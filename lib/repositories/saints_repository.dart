import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:operation_001/models/saint_model.dart';

Map<String, DailySaintsEntry> parseSaintsIndex(String jsonString) {
  final decoded = jsonDecode(jsonString) as List<dynamic>;
  final index = <String, DailySaintsEntry>{};

  for (final raw in decoded) {
    final entry = DailySaintsEntry.fromJson(raw as Map<String, dynamic>);
    index[entry.feastDate] = entry;
  }

  return index;
}

class SaintsRepository {
  static final SaintsRepository instance = SaintsRepository._internal();
  factory SaintsRepository() => instance;
  SaintsRepository._internal();

  final Map<String, DailySaintsEntry> _index = {};
  final Set<int> _loadedMonths = {};

  static const List<String> _monthFiles = [
    '01_january.json',
    '02_february.json',
    '03_march.json',
    '04_april.json',
    '05_may.json',
    '06_june.json',
    '07_july.json',
    '08_august.json',
    '09_september.json',
    '10_october.json',
    '11_november.json',
    '12_december.json',
  ];

  bool get isLoaded => _loadedMonths.isNotEmpty;

  /// Loads a specific month (1 = Jan, 12 = Dec) into memory
  Future<void> loadMonth(int month) async {
    if (month < 1 || month > 12 || _loadedMonths.contains(month)) return;

    final fileName = _monthFiles[month - 1];

    // Pointing to assets/saints/ where monthly JSON files reside
    final path = 'assets/saints/$fileName';

    try {
      final jsonString = await rootBundle.loadString(path);
      final monthIndex = await compute(parseSaintsIndex, jsonString);

      _index.addAll(monthIndex);
      _loadedMonths.add(month);
    } catch (e) {
      debugPrint('SaintsRepository: Month file not found or failed to parse: $path');
    }
  }

  /// Loads all available month files for the Directory / Global Search
  Future<void> loadAllMonths() async {
    for (int m = 1; m <= 12; m++) {
      await loadMonth(m);
    }
  }

  /// Ensures current month (or all available months) are loaded
  Future<void> ensureLoaded({int? month}) async {
    if (month != null) {
      await loadMonth(month);
    } else {
      // Load all months so Directory displays every saint loaded so far
      await loadAllMonths();
    }
  }

  /// Legacy helper method
  Future<void> load() async {
    await loadAllMonths();
  }

  DailySaintsEntry? entryForDate(DateTime date) {
    final monthStr = date.month.toString().padLeft(2, '0');
    final dayStr = date.day.toString().padLeft(2, '0');
    final key = '$monthStr-$dayStr';

    if (!_loadedMonths.contains(date.month)) {
      loadMonth(date.month);
    }

    if (_index.containsKey(key)) return _index[key];

    // Fallback for non-leap years looking for Feb 29
    if (date.month == 2 && date.day == 29 && _index.containsKey('02-28')) {
      return _index['02-28'];
    }

    return null;
  }

  DailySaintsEntry? entryForToday({DateTime? now}) => entryForDate(now ?? DateTime.now());

  List<SaintModel> getAllSaints() {
    final Map<String, SaintModel> uniqueSaints = {};
    for (final entry in _index.values) {
      for (final saint in entry.saints) {
        uniqueSaints[saint.id] = saint;
      }
    }
    return uniqueSaints.values.toList();
  }

  /// Retrieves a saint by unique ID across all loaded calendar entries
  SaintModel? getSaintById(String id) {
    for (final entry in _index.values) {
      for (final saint in entry.saints) {
        if (saint.id == id) {
          return saint;
        }
      }
    }
    return null;
  }

  List<SaintModel> searchSaints(String query) {
    final all = getAllSaints();
    if (query.trim().isEmpty) return all;

    final q = query.toLowerCase().trim();
    return all.where((saint) {
      final nameMatches = saint.name.toLowerCase().contains(q);
      final patronageMatches = saint.patronage.any((p) => p.toLowerCase().contains(q));
      final tagMatches = saint.tags.any((t) => t.toLowerCase().contains(q));

      return nameMatches || patronageMatches || tagMatches;
    }).toList();
  }

  List<SaintModel> getSaintForDate(DateTime date) {
    return entryForDate(date)?.saints ?? const [];
  }

  /// Helper to fetch saints sharing a date string formatted as "MM-DD"
  List<SaintModel> getSaintsForFeastDate(String feastDate) {
    if (_index.containsKey(feastDate)) {
      return _index[feastDate]?.saints ?? [];
    }
    return [];
  }
}