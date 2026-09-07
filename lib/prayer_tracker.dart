import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:operation_001/theme.dart'; // Adjust import path as needed

// ==========================================
// 1. DATA MODEL & PERSISTENCE SERVICES
// ==========================================

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

  static DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  static int _calendarDaysBetween(DateTime from, DateTime to) {
    final fromDate = _normalizeDate(from);
    final toDate = _normalizeDate(to);
    return toDate.difference(fromDate).inDays;
  }

  static Future<Map<String, dynamic>> recordCompletion(
      String prayerName,
      ) async {
    final prefs = await SharedPreferences.getInstance();

    final int total = (prefs.getInt(_keyTotalPrayers) ?? 0) + 1;
    await prefs.setInt(_keyTotalPrayers, total);

    final List<String> historyJson =
        prefs.getStringList(_keyPrayerHistory) ?? [];
    final entry = PrayerEntry(
      prayerName: prayerName,
      timestamp: DateTime.now(),
    );
    historyJson.add(jsonEncode(entry.toJson()));
    await prefs.setStringList(_keyPrayerHistory, historyJson);

    final DateTime now = DateTime.now();
    final DateTime today = _normalizeDate(now);
    final String? lastDateStr = prefs.getString(_keyLastCompletedDate);
    int streak = prefs.getInt(_keyCurrentStreak) ?? 0;

    if (lastDateStr == null) {
      streak = 1;
    } else {
      final DateTime lastCompletedDay =
      _normalizeDate(DateTime.parse(lastDateStr));
      final int dayDiff = _calendarDaysBetween(lastCompletedDay, today);

      if (dayDiff == 1) {
        streak += 1;
      } else if (dayDiff > 1) {
        streak = 1;
      } else if (dayDiff < 0) {
        streak = streak == 0 ? 1 : streak;
      }
    }

    await prefs.setInt(_keyCurrentStreak, streak);
    await prefs.setString(_keyLastCompletedDate, today.toIso8601String());

    return {'total': total, 'streak': streak};
  }

  static Future<Map<String, int>> getStats() async {
    final prefs = await SharedPreferences.getInstance();
    final int total = prefs.getInt(_keyTotalPrayers) ?? 0;
    int streak = prefs.getInt(_keyCurrentStreak) ?? 0;
    final String? lastDateStr = prefs.getString(_keyLastCompletedDate);

    if (lastDateStr != null) {
      final DateTime today = _normalizeDate(DateTime.now());
      final DateTime lastCompletedDay =
      _normalizeDate(DateTime.parse(lastDateStr));
      final int dayDiff = _calendarDaysBetween(lastCompletedDay, today);

      if (dayDiff > 1) {
        streak = 0;
        await prefs.setInt(_keyCurrentStreak, 0);
      }
    }

    return {'total': total, 'streak': streak};
  }

  static Future<List<PrayerEntry>> getPrayerHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> historyJson =
        prefs.getStringList(_keyPrayerHistory) ?? [];

    final List<PrayerEntry> history = [];
    for (final item in historyJson) {
      try {
        final decoded = jsonDecode(item) as Map<String, dynamic>;
        history.add(PrayerEntry.fromJson(decoded));
      } catch (_) {}
    }

    return history.reversed.toList();
  }

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
      } catch (_) {}
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
          final lastCompletedDay =
          _normalizeDate(lastRemainingEntry.timestamp);

          await prefs.setString(
            _keyLastCompletedDate,
            lastCompletedDay.toIso8601String(),
          );

          final int dayDiff = _calendarDaysBetween(lastCompletedDay, today);
          if (dayDiff > 1) {
            streak = 0;
          } else {
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

// ==========================================
// 2. APPTHEME-COMPLIANT PROGRESS CARD WIDGET
// ==========================================

class ProgressTrackerCard extends StatefulWidget {
  final bool isAmharic;

  const ProgressTrackerCard({
    super.key,
    this.isAmharic = false,
  });

  @override
  State<ProgressTrackerCard> createState() => _ProgressTrackerCardState();
}

class _ProgressTrackerCardState extends State<ProgressTrackerCard> {
  int _totalPrayers = 0;
  int _streakDays = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchStats();
  }

  Future<void> _fetchStats() async {
    final stats = await PrayerTracker.getStats();
    if (mounted) {
      setState(() {
        _totalPrayers = stats['total'] ?? 0;
        _streakDays = stats['streak'] ?? 0;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final Color cardBackground = isDark
        ? AppTheme.darkCard
        : AppTheme.sacramentalCream;

    final Color primaryAccent = isDark
        ? AppTheme.marianBlueDark
        : AppTheme.marianBlueLight;

    final Color goldAccent = isDark
        ? AppTheme.softGoldDark
        : AppTheme.softGoldLight;

    final Color textColor = isDark ? AppTheme.textLight : AppTheme.textDark;

    return Card(
      elevation: isDark ? 2 : 1,
      color: cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isDark
              ? primaryAccent.withValues(alpha: 0.25)
              : const Color(0xFFE0DCD3),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const SizedBox(
          height: 80,
          child: Center(child: CircularProgressIndicator.adaptive()),
        )
            : Row(
          children: [
            // Total Prayers Stat Tile
            Expanded(
              child: _buildStatItem(
                context,
                title: widget.isAmharic ? 'ጠቅላላ ጸሎቶች' : 'Total Prayers',
                value: '$_totalPrayers',
                icon: Icons.auto_awesome_rounded,
                iconColor: primaryAccent,
                textColor: textColor,
              ),
            ),
            Container(
              height: 48,
              width: 1,
              color: isDark
                  ? Colors.white.withValues(alpha: 0.12)
                  : AppTheme.textMutedLight.withValues(alpha: 0.3),
            ),
            // Current Streak Stat Tile
            Expanded(
              child: _buildStatItem(
                context,
                title: widget.isAmharic ? 'ቀጣይነት (ቀናት)' : 'Day Streak',
                value: '$_streakDays ${widget.isAmharic ? "ቀናት" : "Days"}',
                icon: Icons.local_fire_department_rounded,
                iconColor: goldAccent,
                textColor: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
      BuildContext context, {
        required String title,
        required String value,
        required IconData icon,
        required Color iconColor,
        required Color textColor,
      }) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: iconColor),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                title,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: textColor.withValues(alpha: 0.75),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}