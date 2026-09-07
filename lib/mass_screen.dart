import 'package:flutter/material.dart';

class MassScreen extends StatelessWidget {
  const MassScreen({super.key});

  static const List<String> _massParts = [
    "Introductory Rites",
    "Liturgy of the Word",
    "Liturgy of the Eucharist",
    "Concluding Rites",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Holy Mass"),
          bottom: TabBar(
            indicatorColor: colorScheme.secondary,
            labelColor: colorScheme.onPrimary,
            unselectedLabelColor:
            colorScheme.onPrimary.withValues(alpha: 0.7),
            tabs: const [
              Tab(
                icon: Icon(Icons.calendar_today_rounded),
                text: "Daily Readings",
              ),
              Tab(
                icon: Icon(Icons.menu_book_rounded),
                text: "Order of Mass",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Today's Readings View
            _buildReadingsTab(context),
            // Tab 2: Order of Mass View
            _buildOrderOfMassTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildReadingsTab(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Card(
          elevation: 0,
          color: theme.colorScheme.surfaceContainerLow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Mass Readings",
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Liturgical Readings for Today",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildReadingSection(
          context,
          title: "First Reading",
          passage: "Reading details will go here...",
        ),
        _buildReadingSection(
          context,
          title: "Responsorial Psalm",
          passage: "Psalm details will go here...",
        ),
        _buildReadingSection(
          context,
          title: "Gospel",
          passage: "Gospel details will go here...",
        ),
      ],
    );
  }

  Widget _buildReadingSection(
      BuildContext context, {
        required String title,
        required String passage,
      }) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.primary.withValues(alpha: 0.12),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(passage, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildOrderOfMassTab(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _massParts.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          color: theme.colorScheme.surfaceContainerLow,
          margin: const EdgeInsets.only(bottom: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            leading: CircleAvatar(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              child: Text(
                "${index + 1}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              _massParts[index],
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            onTap: () {
              // Navigation to specific Mass section detail
            },
          ),
        );
      },
    );
  }
}