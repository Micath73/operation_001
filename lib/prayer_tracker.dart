import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerTracker {
  static const String _keyTotalPrayers = 'total_prayers_count';
  static const String _keyCurrentStreak = 'current_streak';
  static const String _keyLastCompletedDate = 'last_completed_date';

  /// Call this when the user completes a prayer
  static Future<Map<String, dynamic>> recordCompletion(String prayerName) async {
    final prefs = await SharedPreferences.getInstance();

    final int total = (prefs.getInt(_keyTotalPrayers) ?? 0) + 1;
    await prefs.setInt(_keyTotalPrayers, total);

    // Track specific prayer count
    final String prayerKey = 'prayer_count_$prayerName';
    final int prayerTotal = (prefs.getInt(prayerKey) ?? 0) + 1;
    await prefs.setInt(prayerKey, prayerTotal);

    // Calculate Streak
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);

    final String? lastDateStr = prefs.getString(_keyLastCompletedDate);
    int streak = prefs.getInt(_keyCurrentStreak) ?? 0;

    if (lastDateStr == null) {
      // First prayer ever
      streak = 1;
    } else {
      final DateTime lastDate = DateTime.parse(lastDateStr);
      final DateTime lastCompletedDay = DateTime(lastDate.year, lastDate.month, lastDate.day);
      final int difference = today.difference(lastCompletedDay).inDays;

      if (difference == 1) {
        // Consecutive day
        streak += 1;
      } else if (difference > 1) {
        // Streak broken
        streak = 1;
      }
      // If difference == 0, user prayed multiple times today; keep current streak intact
    }

    await prefs.setInt(_keyCurrentStreak, streak);
    await prefs.setString(_keyLastCompletedDate, today.toIso8601String());

    return {
      'total': total,
      'streak': streak,
      'prayerTotal': prayerTotal,
    };
  }
}