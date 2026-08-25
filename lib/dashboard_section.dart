import 'package:flutter/material.dart';
import 'package:operation_001/Divine_Mercy_Chaplet.dart';
import 'package:operation_001/angelusScreen.dart';
import 'package:operation_001/chapelScreen.dart';
import 'package:operation_001/joyful.dart';
import 'package:operation_001/glorious.dart';
import 'package:operation_001/luminous.dart';
import 'package:operation_001/sorrowful.dart';
import 'package:operation_001/pre_prayer_intention_screen.dart';

class DashboardSection extends StatefulWidget {
  const DashboardSection({super.key});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection> {
  String selectedDay = 'Mon';
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];

  @override
  void initState() {
    super.initState();
    int todayWeekday = DateTime.now().weekday; // 1 = Mon, 7 = Sun
    List<String> dayMap = ['Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun'];
    selectedDay = dayMap[todayWeekday - 1];
  }

  Widget _getRosaryScreenForDay(String day) {
    switch (day) {
      case 'Mon':
      case 'Sat':
        return const joyfulScreen();
      case 'Tue':
      case 'Fri':
        return const sorrowfulScreen();
      case 'Wed':
      case 'Sun':
        return const gloriousScreen();
      case 'Thur':
        return const luminousScreen();
      default:
        return const joyfulScreen();
    }
  }

  Widget _buildDailyButton(String label, VoidCallback onPressed, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onPressed,
          child: Text(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Daily Progress Dashboard',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: days.map((day) {
                      bool isSelected = selectedDay == day;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = day;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            day,
                            style: TextStyle(
                              color: isSelected
                                  ? theme.colorScheme.onPrimary
                                  : theme.colorScheme.onSurfaceVariant,
                              fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "Selected: $selectedDay",
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                _buildDailyButton(
                  "Read today's Gospel",
                      () {
                    print("Reading Gospel for $selectedDay");
                  },
                  theme,
                ),
                _buildDailyButton(
                  "Pray today's Angelus",
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrePrayerIntentionScreen(
                          prayerCategory: 'Angelus',
                          isAmharic: false,
                          targetPrayerPage: angelus(),
                        ),
                      ),
                    );
                  },
                  theme,
                ),
                _buildDailyButton(
                  "Pray today's Rosary",
                      () {
                    Widget rosaryTarget = _getRosaryScreenForDay(selectedDay);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrePrayerIntentionScreen(
                          prayerCategory: 'Rosary',
                          isAmharic: false,
                          targetPrayerPage: rosaryTarget,
                        ),
                      ),
                    );
                  },
                  theme,
                ),
                if (selectedDay == 'Fri')
                  _buildDailyButton(
                    "Special Friday Divine Mercy",
                        () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrePrayerIntentionScreen(
                            prayerCategory: 'Divine Chaplet',
                            isAmharic: false,
                            targetPrayerPage: chaplet(),
                          ),
                        ),
                      );
                    },
                    theme,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}