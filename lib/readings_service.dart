import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'daily_reading_model.dart';
import 'readings_database_helper.dart';

class ReadingsService {
  final ReadingsDatabaseHelper _dbHelper = ReadingsDatabaseHelper.instance;
  final http.Client _httpClient;

  ReadingsService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  /// Main entry point: checks SQLite first, falls back to Universalis JSONP API.
  Future<DailyReading?> getReadingForDate(DateTime date) async {
    final dateKey = _formatDateKey(date);

    // 1. Check local SQLite cache
    final cachedData = await _dbHelper.getReadingByDate(dateKey);
    if (cachedData != null) {
      if (kDebugMode) {
        print("⚡ [CACHE HIT] Loaded reading from local SQLite for $dateKey");
      }
      return cachedData;
    }

    // 2. Fetch live data from API
    if (kDebugMode) {
      print("🌐 [CACHE MISS] Fetching live readings from API for $dateKey...");
    }

    try {
      final liveReading = await _fetchFromApi(date, dateKey);

      if (liveReading != null) {
        await _dbHelper.insertReading(liveReading);
        if (kDebugMode) {
          print("💾 [DATABASE] Cached reading for $dateKey locally.");
        }
        return liveReading;
      }
    } catch (e) {
      if (kDebugMode) {
        print("⚠️ Network or parse error for $dateKey: $e");
      }
    }

    // 3. Fallback for dates beyond publication window
    return _buildFallbackReading(dateKey);
  }

  /// Concurrently prefetches a range of days and batch inserts them into SQLite.
  Future<void> prefetchReadingRange(DateTime startDate, int daysCount) async {
    final List<DailyReading> fetchedReadings = [];

    // Process in smaller batches of 3 to avoid flooding connection pool
    const int batchSize = 3;
    for (int i = 0; i < daysCount; i += batchSize) {
      final currentBatchCount = (i + batchSize > daysCount)
          ? daysCount - i
          : batchSize;

      final tasks = List.generate(currentBatchCount, (index) async {
        final targetDate = startDate.add(Duration(days: i + index));
        final dateKey = _formatDateKey(targetDate);

        final existing = await _dbHelper.getReadingByDate(dateKey);
        if (existing != null) return null;

        try {
          return await _fetchFromApi(targetDate, dateKey);
        } catch (_) {
          return null;
        }
      });

      final results = await Future.wait(tasks);
      fetchedReadings.addAll(results.whereType<DailyReading>());
    }

    if (fetchedReadings.isNotEmpty) {
      await _dbHelper.insertBatchReadings(fetchedReadings);
      if (kDebugMode) {
        print(
          "📦 [PREFETCH] Successfully batch-cached ${fetchedReadings.length} readings.",
        );
      }
    }
  }

  Future<DailyReading?> _fetchFromApi(DateTime date, String dateKey) async {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    final url = Uri.parse(
      "https://universalis.com/$year$month$day/jsonpmass.js",
    );

    final response = await _httpClient.get(url).timeout(
      const Duration(seconds: 8),
    );

    if (response.statusCode == 200) {
      String rawBody = response.body.trim();

      // Guard against HTML error pages returned with 200 status
      if (rawBody.startsWith('<!DOCTYPE') || rawBody.startsWith('<html')) {
        if (kDebugMode) {
          print("ℹ️ Readings not yet available on API for date: $dateKey");
        }
        return null;
      }

      final startIdx = rawBody.indexOf('{"number"');
      if (startIdx != -1) {
        final endIdx = rawBody.lastIndexOf('}}');
        if (endIdx != -1 && endIdx > startIdx) {
          rawBody = rawBody.substring(startIdx, endIdx + 2);
        } else {
          return null;
        }
      } else {
        return null;
      }

      final Map<String, dynamic> json = jsonDecode(rawBody);

      final liturgicalTitle = _sanitize(
        _safeString(json['day']) ?? "Daily Mass Readings",
      );
      final liturgicalColor = _extractColor(
        _safeString(json['copyright']) ?? "",
      );

      final r1 = json['Mass_R1'];
      final firstReadingTitle = r1 != null
          ? _sanitize(_safeString(r1['heading']) ?? "First Reading")
          : "First Reading";
      final firstReadingText = r1 != null
          ? _sanitize(
        "${_safeString(r1['source']) ?? ''}\n\n${_safeString(r1['text']) ?? ''}",
      )
          : '';

      final ps = json['Mass_Ps'];
      final psalmResponse = ps != null
          ? _sanitize(_safeString(ps['heading']) ?? "Responsorial Psalm")
          : "Responsorial Psalm";
      final psalmText = ps != null
          ? _sanitize(
        "${_safeString(ps['source']) ?? ''}\n\n${_safeString(ps['text']) ?? ''}",
      )
          : '';

      String? secondReadingTitle;
      String? secondReadingText;
      if (json.containsKey('Mass_R2') && json['Mass_R2'] != null) {
        final r2 = json['Mass_R2'];
        secondReadingTitle = _sanitize(
          _safeString(r2['heading']) ?? "Second Reading",
        );
        secondReadingText = _sanitize(
          "${_safeString(r2['source']) ?? ''}\n\n${_safeString(r2['text']) ?? ''}",
        );
      }

      String? gospelAcclamation;
      if (json.containsKey('Mass_GA') && json['Mass_GA'] != null) {
        final ga = json['Mass_GA'];
        gospelAcclamation = _sanitize(_safeString(ga['text']) ?? '');
      }

      final g = json['Mass_G'];
      final gospelTitle = g != null
          ? _sanitize(_safeString(g['heading']) ?? "Gospel")
          : "Gospel";
      final gospelText = g != null
          ? _sanitize(
        "${_safeString(g['source']) ?? ''}\n\n${_safeString(g['text']) ?? ''}",
      )
          : '';

      return DailyReading(
        id: dateKey,
        date: dateKey,
        liturgicalTitle: liturgicalTitle,
        liturgicalColor: liturgicalColor,
        firstReadingTitle: firstReadingTitle,
        firstReadingText: firstReadingText,
        psalmResponse: psalmResponse,
        psalmText: psalmText,
        secondReadingTitle: secondReadingTitle,
        secondReadingText: secondReadingText,
        gospelAcclamation: gospelAcclamation,
        gospelTitle: gospelTitle,
        gospelText: gospelText,
      );
    }

    return null;
  }

  /// Placeholder for unpublished future dates
  DailyReading _buildFallbackReading(String dateKey) {
    return DailyReading(
      id: dateKey,
      date: dateKey,
      liturgicalTitle: "Mass Readings",
      liturgicalColor: "green",
      firstReadingTitle: "Readings Unavailable",
      firstReadingText:
      "Official liturgical readings for this date have not been published by the server yet. Please check back closer to this day.",
      psalmResponse: "Responsorial Psalm",
      psalmText: "The Lord is my shepherd; there is nothing I shall want.",
      gospelTitle: "Gospel",
      gospelText: "Please check back on this date for full Gospel text.",
    );
  }

  String? _safeString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    return value.toString();
  }

  String _sanitize(String raw) {
    if (raw.isEmpty) return raw;

    String text = raw;

    text = text.replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n');
    text = text.replaceAll(RegExp(r'<[^>]*>'), '');

    text = text.replaceAllMapped(RegExp(r'&#x([0-9a-fA-F]+);?'), (match) {
      final code = int.parse(match.group(1)!, radix: 16);
      return String.fromCharCode(code);
    });

    text = text.replaceAllMapped(RegExp(r'&#([0-9]+);?'), (match) {
      final code = int.parse(match.group(1)!);
      return String.fromCharCode(code);
    });

    text = text
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#8217;', "'");

    text = text.replaceAllMapped(RegExp(r'([;:\.,!?])([A-Za-z])'), (match) {
      return '${match.group(1)} ${match.group(2)}';
    });

    return text.replaceAll(RegExp(r'[ \t]+'), ' ').trim();
  }

  String _extractColor(String copyright) {
    final lower = copyright.toLowerCase();
    if (lower.contains('purple') || lower.contains('violet')) return 'purple';
    if (lower.contains('red')) return 'red';
    if (lower.contains('white') || lower.contains('gold')) return 'white';
    return 'green';
  }

  String _formatDateKey(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}