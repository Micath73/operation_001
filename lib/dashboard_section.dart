import 'package:flutter/material.dart';
import 'package:operation_001/angelus_screen.dart';
import 'package:operation_001/chapel_screen.dart';
import 'package:operation_001/daily_readings_screen.dart';
import 'package:operation_001/db_helper.dart';
import 'package:operation_001/glorious.dart';
import 'package:operation_001/joyful.dart';
import 'package:operation_001/luminous.dart';
import 'package:operation_001/pre_prayer_intention_screen.dart';
import 'package:operation_001/prayer_type.dart'; // Explicit package import fix
import 'package:operation_001/route_observer.dart';
import 'package:operation_001/sorrowful.dart';

class DashboardSection extends StatefulWidget {
  const DashboardSection({super.key});

  @override
  State<DashboardSection> createState() => _DashboardSectionState();
}

class _DashboardSectionState extends State<DashboardSection>
    with RouteAware {
  static const List<String> _days = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  late String _previewDay = _todayLabel;

  String get _todayLabel => _days[DateTime.now().weekday - 1];

  bool isGospelCompleted = false;
  bool isAngelusCompleted = false;
  bool isRosaryCompleted = false;
  bool isMercyCompleted = false;

  @override
  void initState() {
    super.initState();
    _checkTodaysCompletions();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      appRouteObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    appRouteObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    _checkTodaysCompletions();
  }

  Future<void> _checkTodaysCompletions() async {
    try {
      final completed = await DatabaseHelper.instance.getTodaysCompletedTypes();
      if (!mounted) return;
      setState(() {
        isAngelusCompleted = completed.contains(PrayerType.angelus);
        isRosaryCompleted = completed.contains(PrayerType.rosary);
        isMercyCompleted = completed.contains(PrayerType.chaplet);
      });
    } catch (e) {
      debugPrint('Error checking today completions: $e');
    }
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
      case 'Thu':
        return const LuminousScreen();
      default:
        return const JoyfulScreen();
    }
  }

  Future<void> _navigateToAndRefresh(Widget page, [String? type]) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );

    if (type == 'gospel' && mounted) {
      setState(() {
        isGospelCompleted = true;
      });
    }

    await _checkTodaysCompletions();
  }

  Widget _buildDailyButton({
    required String label,
    required bool isCompleted,
    required VoidCallback onPressed,
    required ThemeData theme,
  }) {
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Material(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(14),
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: isCompleted
                    ? colorScheme.secondary.withValues(alpha: 0.5)
                    : colorScheme.secondary.withValues(alpha: 0.2),
                width: isCompleted ? 1.3 : 1,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                if (isCompleted)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.secondary.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_rounded,
                            size: 14, color: colorScheme.secondary),
                        const SizedBox(width: 3),
                        Text(
                          'Prayed',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Icon(Icons.chevron_right_rounded,
                      color: colorScheme.onSurfaceVariant
                          .withValues(alpha: 0.6)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isPreviewingOtherDay = _previewDay != _todayLabel;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.15),
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
                      color: colorScheme.secondary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: _days.map((day) {
                      final isSelected = _previewDay == day;
                      final isRealToday = day == _todayLabel;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () => setState(() => _previewDay = day),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? colorScheme.primary
                                    : colorScheme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: isSelected
                                      ? colorScheme.secondary
                                      : colorScheme.outline
                                      .withValues(alpha: 0.15),
                                  width: isSelected ? 1.5 : 1,
                                ),
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Text(
                                    day,
                                    style: TextStyle(
                                      color: isSelected
                                          ? colorScheme.onPrimary
                                          : colorScheme.onSurfaceVariant,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  if (isRealToday)
                                    Positioned(
                                      right: -6,
                                      top: -6,
                                      child: Container(
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isSelected
                                              ? colorScheme.onPrimary
                                              : colorScheme.secondary,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  isPreviewingOtherDay
                      ? "Previewing $_previewDay — today's Rosary still prays $_todayLabel's Mysteries"
                      : "Today: $_todayLabel",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isPreviewingOtherDay
                        ? colorScheme.onSurfaceVariant
                        : colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: isPreviewingOtherDay ? 12 : 15,
                  ),
                ),
                const SizedBox(height: 16),
                _buildDailyButton(
                  label: "Read today's Gospel",
                  isCompleted: isGospelCompleted,
                  onPressed: () {
                    _navigateToAndRefresh(
                        const DailyReadingsScreen(), 'gospel');
                  },
                  theme: theme,
                ),
                _buildDailyButton(
                  label: "Pray today's Angelus",
                  isCompleted: isAngelusCompleted,
                  onPressed: () {
                    _navigateToAndRefresh(
                      PrePrayerIntentionScreen(
                        prayerType: PrayerType.angelus,
                        isAmharic: false,
                        targetPrayerPage: const AngelusScreen(),
                      ),
                    );
                  },
                  theme: theme,
                ),
                _buildDailyButton(
                  label: "Pray today's Rosary",
                  isCompleted: isRosaryCompleted,
                  onPressed: () {
                    final rosaryTarget = _getRosaryScreenForDay(_todayLabel);
                    _navigateToAndRefresh(
                      PrePrayerIntentionScreen(
                        prayerType: PrayerType.rosary,
                        isAmharic: false,
                        targetPrayerPage: rosaryTarget,
                      ),
                    );
                  },
                  theme: theme,
                ),
                if (_todayLabel == 'Fri')
                  _buildDailyButton(
                    label: "Special Friday Divine Mercy",
                    isCompleted: isMercyCompleted,
                    onPressed: () {
                      _navigateToAndRefresh(
                        PrePrayerIntentionScreen(
                          prayerType: PrayerType.chaplet,
                          isAmharic: false,
                          targetPrayerPage: const ChapletScreen(),
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