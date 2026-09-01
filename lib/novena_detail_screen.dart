import 'package:flutter/material.dart';
import 'package:operation_001/prayer_completion_screen.dart';

class NovenaDayContent {
  final int dayNumber;
  final String theme;
  final String prayer;

  const NovenaDayContent({
    required this.dayNumber,
    required this.theme,
    required this.prayer,
  });
}

class NovenaDetailScreen extends StatefulWidget {
  final String title;
  final List<NovenaDayContent> days;

  const NovenaDetailScreen({
    super.key,
    required this.title,
    required this.days,
  });

  @override
  State<NovenaDetailScreen> createState() => _NovenaDetailScreenState();
}

class _NovenaDetailScreenState extends State<NovenaDetailScreen> {
  int currentDay = 1;
  double fontSize = 16.0;
  final Set<int> completedDays = {};
  final TextEditingController intentionController = TextEditingController();

  @override
  void dispose() {
    intentionController.dispose();
    super.dispose();
  }

  void _markDayComplete() {
    setState(() {
      completedDays.add(currentDay);
    });

    if (currentDay < 9) {
      setState(() {
        currentDay++;
      });
    } else {
      // 9th Day completed -> Navigate to PrayerCompletionScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PrayerCompletionScreen(
            isAmharic: false,
            prayerType: 'Novena',
            titleEn: widget.title,
            detailValue: widget.title,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final activeDayData = widget.days.firstWhere(
          (d) => d.dayNumber == currentDay,
      orElse: () => widget.days.first,
    );

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.text_decrease_rounded),
            onPressed: () {
              if (fontSize > 12) setState(() => fontSize -= 2);
            },
          ),
          IconButton(
            icon: const Icon(Icons.text_increase_rounded),
            onPressed: () {
              if (fontSize < 24) setState(() => fontSize += 2);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 9-DAY SELECTOR STRIP
          Container(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: 9,
                itemBuilder: (context, index) {
                  final dayNum = index + 1;
                  final isSelected = dayNum == currentDay;
                  final isDone = completedDays.contains(dayNum);

                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isDone) ...[
                            Icon(
                              Icons.check_circle_rounded,
                              size: 14,
                              color: theme.colorScheme.secondary,
                            ),
                            const SizedBox(width: 4),
                          ],
                          Text('Day $dayNum'),
                        ],
                      ),
                      selected: isSelected,
                      selectedColor: theme.colorScheme.primary,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onSurface,
                        fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      backgroundColor: theme.colorScheme.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurface.withValues(alpha: 0.12),
                        ),
                      ),
                      onSelected: (_) {
                        setState(() => currentDay = dayNum);
                      },
                    ),
                  );
                },
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // PERSONAL INTENTION CARD
                  Card(
                    elevation: 1,
                    color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: theme.colorScheme.primary.withValues(alpha: 0.15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.edit_note_rounded,
                                color: theme.colorScheme.secondary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "My Personal Intention",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            controller: intentionController,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 14,
                              color: theme.colorScheme.onSurface,
                            ),
                            decoration: InputDecoration(
                              hintText:
                              "Type your prayer intention for this novena...",
                              hintStyle: TextStyle(
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // DAY THEME HEADER
                  Text(
                    activeDayData.theme,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  Divider(
                    height: 24,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.12),
                  ),

                  // MAIN PRAYER TEXT
                  Text(
                    activeDayData.prayer,
                    style: TextStyle(
                      fontSize: fontSize,
                      height: 1.6,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BOTTOM ACTION BAR
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _markDayComplete,
                  icon: Icon(
                    completedDays.contains(currentDay)
                        ? Icons.check_circle_rounded
                        : Icons.done_all_rounded,
                  ),
                  label: Text(
                    currentDay == 9
                        ? "Finish Novena & Complete"
                        : "Mark Day $currentDay as Complete",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}