import 'package:flutter/material.dart';

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
      // 9th Day completed -> Navigate to Completion Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => PrayerCompletedScreen(title: widget.title),
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
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.text_decrease),
            onPressed: () {
              if (fontSize > 12) setState(() => fontSize -= 2);
            },
          ),
          IconButton(
            icon: const Icon(Icons.text_increase),
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
            color: theme.colorScheme.surface,
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
                          if (isDone)
                            const Icon(
                              Icons.check,
                              size: 14,
                              color: Colors.green,
                            ),
                          if (isDone) const SizedBox(width: 4),
                          Text('Day $dayNum'),
                        ],
                      ),
                      selected: isSelected,
                      selectedColor: theme.colorScheme.primary,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onSurface,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                      backgroundColor: theme.colorScheme.background,
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
                    color: theme.colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.edit_note,
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
                          const SizedBox(height: 6),
                          TextField(
                            controller: intentionController,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 13,
                              color: theme.colorScheme.onSurface,
                            ),
                            decoration: InputDecoration(
                              hintText:
                                  "Type your prayer intention for this novena...",
                              hintStyle: TextStyle(
                                color: theme.colorScheme.onSurface.withOpacity(
                                  0.5,
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

                  const SizedBox(height: 16),

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
                    color: theme.colorScheme.onSurface.withOpacity(0.12),
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
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _markDayComplete,
                  icon: Icon(
                    completedDays.contains(currentDay)
                        ? Icons.check_circle
                        : Icons.done_all,
                  ),
                  label: Text(
                    currentDay == 9
                        ? "Finish Novena & Complete"
                        : "Mark Day $currentDay as Complete",
                    style: const TextStyle(fontWeight: FontWeight.bold),
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

// NOVENA PRAYER COMPLETED SCREEN
class PrayerCompletedScreen extends StatelessWidget {
  final String title;

  const PrayerCompletedScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.verified_sharp,
                  size: 72,
                  color: theme.colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                "Novena Completed!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "You have finished 9 days of prayer for the $title.\n\nMay your prayers be answered and your heart be filled with grace.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: theme.colorScheme.onSurface.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Return to Home",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
