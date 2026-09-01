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
    prayerName: json['prayerName'] as String? ?? 'Prayer',
    timestamp: json['timestamp'] != null
        ? DateTime.parse(json['timestamp'] as String)
        : DateTime.now(),
  );
}

class PrayerTracker {
  static const String _keyTotalPrayers = 'total_prayers_count';
  static const String _keyCurrentStreak = 'current_streak';
  static const String _keyLastCompletedDate = 'last_completed_date';
  static const String _keyPrayerHistory = 'prayer_history_logs';

  /// Helper to get Date component only (midnight normalization)
  static DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  /// Calculates real day difference between two DateTimes based on calendar days
  static int _calendarDaysBetween(DateTime from, DateTime to) {
    final fromDate = _normalizeDate(from);
    final toDate = _normalizeDate(to);
    return toDate.difference(fromDate).inDays;
  }

  /// Record a prayer completion entry with a timestamp
  static Future<Map<String, dynamic>> recordCompletion(
      String prayerName,
      ) async {
    final prefs = await SharedPreferences.getInstance();

    // 1. Increment Total Prayers Count
    final int total = (prefs.getInt(_keyTotalPrayers) ?? 0) + 1;
    await prefs.setInt(_keyTotalPrayers, total);

    // 2. Append log entry with timestamp
    final List<String> historyJson =
        prefs.getStringList(_keyPrayerHistory) ?? [];
    final entry = PrayerEntry(
      prayerName: prayerName,
      timestamp: DateTime.now(),
    );
    historyJson.add(jsonEncode(entry.toJson()));
    await prefs.setStringList(_keyPrayerHistory, historyJson);

    // 3. Update Streak Calculation accurately by Calendar Days
    final DateTime now = DateTime.now();
    final DateTime today = _normalizeDate(now);
    final String? lastDateStr = prefs.getString(_keyLastCompletedDate);
    int streak = prefs.getInt(_keyCurrentStreak) ?? 0;

    if (lastDateStr == null) {
      streak = 1;
    } else {
      final DateTime lastCompletedDay = _normalizeDate(DateTime.parse(lastDateStr));
      final int dayDiff = _calendarDaysBetween(lastCompletedDay, today);

      if (dayDiff == 1) {
        // First prayer on the consecutive day
        streak += 1;
      } else if (dayDiff > 1) {
        // Missed one or more days, reset streak to 1 for today
        streak = 1;
      } else if (dayDiff < 0) {
        // System clock anomaly handling guard
        streak = streak == 0 ? 1 : streak;
      }
      // If dayDiff == 0 (Already completed a prayer today), keep current streak unchanged
    }

    await prefs.setInt(_keyCurrentStreak, streak);
    await prefs.setString(_keyLastCompletedDate, today.toIso8601String());

    return {'total': total, 'streak': streak};
  }

  /// Fetch current total prayers and streak, accounting for broken streaks
  static Future<Map<String, int>> getStats() async {
    final prefs = await SharedPreferences.getInstance();
    final int total = prefs.getInt(_keyTotalPrayers) ?? 0;
    int streak = prefs.getInt(_keyCurrentStreak) ?? 0;
    final String? lastDateStr = prefs.getString(_keyLastCompletedDate);

    if (lastDateStr != null) {
      final DateTime today = _normalizeDate(DateTime.now());
      final DateTime lastCompletedDay = _normalizeDate(DateTime.parse(lastDateStr));
      final int dayDiff = _calendarDaysBetween(lastCompletedDay, today);

      // Reset streak to 0 if missed more than 1 calendar day
      if (dayDiff > 1) {
        streak = 0;
        await prefs.setInt(_keyCurrentStreak, 0);
      }
    }

    return {'total': total, 'streak': streak};
  }

  /// Retrieve all logged prayer entries (most recent first)
  static Future<List<PrayerEntry>> getPrayerHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> historyJson =
        prefs.getStringList(_keyPrayerHistory) ?? [];

    final List<PrayerEntry> history = [];
    for (final item in historyJson) {
      try {
        final decoded = jsonDecode(item) as Map<String, dynamic>;
        history.add(PrayerEntry.fromJson(decoded));
      } catch (_) {
        // Safe skip for legacy or corrupted log strings
      }
    }

    return history.reversed.toList();
  }

  /// Reset today's logged prayers, deduct total count, and restore previous streak state
  static Future<Map<String, int>> resetTodaysPrayers() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> historyJson =
        prefs.getStringList(_keyPrayerHistory) ?? [];

    final DateTime today = _normalizeDate(DateTime.now());

    final List<String> updatedHistory = [];
    int removedCount = 0;

    for (final item in historyJson) {
      try {
        final decoded = jsonDecode(item) as Map<String, dynamic>;
        final entry = PrayerEntry.fromJson(decoded);
        final entryDay = _normalizeDate(entry.timestamp);

        if (entryDay.isAtSameMomentAs(today)) {
          removedCount++;
        } else {
          updatedHistory.add(item);
        }
      } catch (_) {
        // Exclude unparseable entries during cleanup
      }
    }

    final int currentTotal = prefs.getInt(_keyTotalPrayers) ?? 0;
    final int newTotal = (currentTotal - removedCount).clamp(0, 999999);

    int streak = prefs.getInt(_keyCurrentStreak) ?? 0;

    if (removedCount > 0) {
      if (updatedHistory.isNotEmpty) {
        try {
          final lastRemainingEntry = PrayerEntry.fromJson(
            jsonDecode(updatedHistory.last) as Map<String, dynamic>,
          );
          final lastCompletedDay = _normalizeDate(lastRemainingEntry.timestamp);

          await prefs.setString(
            _keyLastCompletedDate,
            lastCompletedDay.toIso8601String(),
          );

          final int dayDiff = _calendarDaysBetween(lastCompletedDay, today);
          if (dayDiff > 1) {
            streak = 0;
          } else {
            // Re-adjust streak down by 1 since today's activity was cleared entirely
            streak = (streak - 1).clamp(0, 999999);
          }
        } catch (_) {
          streak = 0;
        }
      } else {
        streak = 0;
        await prefs.remove(_keyLastCompletedDate);
      }
      await prefs.setInt(_keyCurrentStreak, streak);
    }

    await prefs.setInt(_keyTotalPrayers, newTotal);
    await prefs.setStringList(_keyPrayerHistory, updatedHistory);

    return {'total': newTotal, 'streak': streak};
  }
}