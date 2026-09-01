import 'package:flutter/material.dart';
import 'package:operation_001/angelus_screen.dart';
import 'package:operation_001/chapel_screen.dart';
import 'package:operation_001/daily_readings_screen.dart';
import 'package:operation_001/glorious.dart';
import 'package:operation_001/joyful.dart';
import 'package:operation_001/luminous.dart';
import 'package:operation_001/pre_prayer_intention_screen.dart';
import 'package:operation_001/sorrowful.dart';

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
        return const JoyfulScreen();
      case 'Tue':
      case 'Fri':
        return const SorrowfulScreen();
      case 'Wed':
      case 'Sun':
        return const GloriousScreen();
      case 'Thur':
        return const LuminousScreen();
      default:
        return const JoyfulScreen();
    }
  }

  Widget _buildDailyButton({
    required String label,
    required VoidCallback onPressed,
    required ThemeData theme,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            foregroundColor: theme.colorScheme.onSurface,
            elevation: 2,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: theme.colorScheme.secondary.withAlpha(76),
                width: 1,
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: theme.colorScheme.onSurface,
            ),
          ),
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
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: theme.colorScheme.primary.withAlpha(38),
                width: 1,
              ),
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
                      color: theme.colorScheme.secondary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: days.map((day) {
                      bool isSelected = selectedDay == day;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {
                              setState(() {
                                selectedDay = day;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? theme.colorScheme.primary
                                    : theme.colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: isSelected
                                      ? theme.colorScheme.secondary
                                      : theme.colorScheme.outline.withAlpha(38),
                                  width: isSelected ? 1.5 : 1,
                                ),
                              ),
                              child: Text(
                                day,
                                style: TextStyle(
                                  color: isSelected
                                      ? theme.colorScheme.onPrimary
                                      : theme.colorScheme.onSurfaceVariant,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Selected: $selectedDay",
                  style: TextStyle(
                    color: theme.colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 16),
                _buildDailyButton(
                  label: "Read today's Gospel",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DailyReadingsScreen(),
                      ),
                    );
                  },
                  theme: theme,
                ),
                _buildDailyButton(
                  label: "Pray today's Angelus",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrePrayerIntentionScreen(
                          prayerCategory: 'Angelus',
                          isAmharic: false,
                          targetPrayerPage: AngelusScreen(),
                        ),
                      ),
                    );
                  },
                  theme: theme,
                ),
                _buildDailyButton(
                  label: "Pray today's Rosary",
                  onPressed: () {
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
                  theme: theme,
                ),
                if (selectedDay == 'Fri')
                  _buildDailyButton(
                    label: "Special Friday Divine Mercy",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrePrayerIntentionScreen(
                            prayerCategory: 'Divine Chaplet',
                            isAmharic: false,
                            targetPrayerPage: ChapletScreen(),
                          ),
                        ),
                      );
                    },
                    theme: theme,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}