import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerEntry {
  final String prayerName;
  final DateTime timestamp;

  PrayerEntry({required this.prayerName, required this.timestamp});

  Map<String, dynamic> toJson() => {
    'prayerName': prayerName,
    'timestamp': timestamp.toIso8601String(),
  };

  factory PrayerEntry.fromJson(Map<String, dynamic> json) => PrayerEntry(
    prayerName: json['prayerName'],
    timestamp: DateTime.parse(json['timestamp']),
  );
}

class PrayerTracker {
  static const String _keyTotalPrayers = 'total_prayers_count';
  static const String _keyCurrentStreak = 'current_streak';
  static const String _keyLastCompletedDate = 'last_completed_date';
  static const String _keyPrayerHistory = 'prayer_history_logs';

  /// Record a prayer completion entry with a timestamp
  static Future<Map<String, dynamic>> recordCompletion(
    String prayerName,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    // 1. Increment Total Prayers Count
    final int total = (prefs.getInt(_keyTotalPrayers) ?? 0) + 1;
    await prefs.setInt(_keyTotalPrayers, total);

    // 2. Append log entry with timestamp
    List<String> historyJson = prefs.getStringList(_keyPrayerHistory) ?? [];
    final entry = PrayerEntry(
      prayerName: prayerName,
      timestamp: DateTime.now(),
    );
    historyJson.add(jsonEncode(entry.toJson()));
    await prefs.setStringList(_keyPrayerHistory, historyJson);

    // 3. Update Streak Calculation
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final String? lastDateStr = prefs.getString(_keyLastCompletedDate);
    int streak = prefs.getInt(_keyCurrentStreak) ?? 0;

    if (lastDateStr == null) {
      streak = 1;
    } else {
      final DateTime lastDate = DateTime.parse(lastDateStr);
      final DateTime lastCompletedDay = DateTime(
        lastDate.year,
        lastDate.month,
        lastDate.day,
      );
      final int difference = today.difference(lastCompletedDay).inDays;

      if (difference == 1) {
        streak += 1;
      } else if (difference > 1) {
        streak = 1;
      }
      // If difference == 0, keep current streak unchanged
    }

    await prefs.setInt(_keyCurrentStreak, streak);
    await prefs.setString(_keyLastCompletedDate, today.toIso8601String());

    return {'total': total, 'streak': streak};
  }

  /// Fetch current total prayers and streak without recording a new prayer
  static Future<Map<String, int>> getStats() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'total': prefs.getInt(_keyTotalPrayers) ?? 0,
      'streak': prefs.getInt(_keyCurrentStreak) ?? 0,
    };
  }

  /// Retrieve all logged prayer entries (most recent first)
  static Future<List<PrayerEntry>> getPrayerHistory() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> historyJson = prefs.getStringList(_keyPrayerHistory) ?? [];
    return historyJson
        .map((e) => PrayerEntry.fromJson(jsonDecode(e)))
        .toList()
        .reversed
        .toList();
  }

  /// Reset today's logged prayers and deduct them from the total count
  static Future<Map<String, int>> resetTodaysPrayers() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> historyJson = prefs.getStringList(_keyPrayerHistory) ?? [];

    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);

    List<String> updatedHistory = [];
    int removedCount = 0;

    for (String item in historyJson) {
      final entry = PrayerEntry.fromJson(jsonDecode(item));
      final entryDay = DateTime(
        entry.timestamp.year,
        entry.timestamp.month,
        entry.timestamp.day,
      );

      if (entryDay.isAtSameMomentAs(today)) {
        removedCount++;
      } else {
        updatedHistory.add(item);
      }
    }

    // Deduct removed entries from total count safely
    int currentTotal = prefs.getInt(_keyTotalPrayers) ?? 0;
    int newTotal = (currentTotal - removedCount).clamp(0, 999999);

    await prefs.setInt(_keyTotalPrayers, newTotal);
    await prefs.setStringList(_keyPrayerHistory, updatedHistory);

    return {'total': newTotal, 'streak': prefs.getInt(_keyCurrentStreak) ?? 0};
  }
}
