import 'package:flutter/material.dart';

// Package imports with consistent naming
import 'package:operation_001/glorious.dart';
import 'package:operation_001/joyful.dart';
import 'package:operation_001/luminous.dart';
import 'package:operation_001/sorrowful.dart';

class RosaryItem {
  final String title;
  final String days;
  final String quote;
  final String image;
  final WidgetBuilder targetBuilder;

  const RosaryItem({
    required this.title,
    required this.days,
    required this.quote,
    required this.image,
    required this.targetBuilder,
  });
}

final List<RosaryItem> defaultRosaryList = [
  RosaryItem(
    title: 'The Joyful Mysteries',
    days: 'Mondays & Saturdays',
    quote:
    '"The Rosary is the most beautiful and the most rich in graces of all prayers." — Pope St. Pius X',
    image: 'assets/wmremove-transformed (3).jpeg',
    targetBuilder: (context) => const JoyfulScreen(),
  ),
  RosaryItem(
    title: 'The Sorrowful Mysteries',
    days: 'Tuesdays & Fridays',
    quote:
    '"Never be afraid of loving the Blessed Virgin too much. You can never love her more than Jesus did." — St. Maximilian Kolbe',
    image: 'assets/wmremove-transformed (6).jpeg',
    targetBuilder: (context) => const SorrowfulScreen(),
  ),
  RosaryItem(
    title: 'The Glorious Mysteries',
    days: 'Wednesdays & Sundays',
    quote:
    '"Give me an army saying the Rosary and I will conquer the world." — Blessed Pope Pius IX',
    image: 'assets/wmremove-transformed (9).jpeg',
    targetBuilder: (context) => const GloriousScreen(),
  ),
  RosaryItem(
    title: 'The Luminous Mysteries',
    days: 'Thursdays',
    quote:
    '"The Rosary is a powerful weapon to put the demons to flight and to keep oneself from sin." — Pope Pius XI',
    image: 'assets/wmremove-transformed (10).png',
    targetBuilder: (context) => const LuminousScreen(),
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
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          final item = steps[index];
          return Card(
            elevation: 0,
            color: theme.colorScheme.surfaceContainerLow,
            margin: const EdgeInsets.only(bottom: 16),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: item.targetBuilder),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item.image,
                        width: 90,
                        height: 110,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 90,
                          height: 110,
                          color: theme.colorScheme.primaryContainer,
                          child: Icon(
                            Icons.image_not_supported_rounded,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: theme.colorScheme.onSurface,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Prayed on: ${item.days}',
                            style: theme.textTheme.labelMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item.quote,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}