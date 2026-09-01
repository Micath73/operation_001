import 'package:flutter/material.dart';

class RosaryItem {
  final String title;
  final String days;
  final String quote;

  const RosaryItem({
    required this.title,
    required this.days,
    required this.quote,
  });
}

// Global list of Rosaries with days and Saint quotes
const List<RosaryItem> defaultRosaryList = [
  RosaryItem(
    title: 'The Joyful Mysteries',
    days: 'Mondays & Saturdays',
    quote:
    '"The Rosary is the most beautiful and the most rich in graces of all prayers." — Pope St. Pius X',
  ),
  RosaryItem(
    title: 'The Sorrowful Mysteries',
    days: 'Tuesdays & Fridays',
    quote:
    '"Never be afraid of loving the Blessed Virgin too much. You can never love her more than Jesus did." — St. Maximilian Kolbe',
  ),
  RosaryItem(
    title: 'The Glorious Mysteries',
    days: 'Wednesdays & Sundays',
    quote:
    '"Give me an army saying the Rosary and I will conquer the world." — Blessed Pope Pius IX',
  ),
  RosaryItem(
    title: 'The Luminous Mysteries',
    days: 'Thursdays',
    quote:
    '"The Rosary is a powerful weapon to put the demons to flight and to keep oneself from sin." — Pope Pius XI',
  ),
];

class RosaryDetailScreen extends StatelessWidget {
  final String title;
  final List<RosaryItem> steps;

  const RosaryDetailScreen({
    super.key,
    required this.title,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          final item = steps[index];
          return Card(
            color: theme.colorScheme.surfaceContainerHighest,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Prayed on: ${item.days}',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.quote,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant.withValues(
                        alpha: 0.8,
                      ),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}