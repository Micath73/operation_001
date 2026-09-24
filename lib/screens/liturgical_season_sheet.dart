import 'package:flutter/material.dart';

class LiturgicalSeasonSheet extends StatelessWidget {
  final VoidCallback onOpenLentLesson;
  final VoidCallback onOpenActOfContrition;

  const LiturgicalSeasonSheet({
    super.key,
    required this.onOpenLentLesson,
    required this.onOpenActOfContrition,
  });

  static void show(
      BuildContext context, {
        required VoidCallback onOpenLentLesson,
        required VoidCallback onOpenActOfContrition,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => LiturgicalSeasonSheet(
        onOpenLentLesson: () {
          Navigator.of(sheetContext).pop();
          onOpenLentLesson();
        },
        onOpenActOfContrition: () {
          Navigator.of(sheetContext).pop();
          onOpenActOfContrition();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.calendar_month_rounded,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Season: Lent',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'A 40-day journey of prayer, fasting, and almsgiving.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const Divider(height: 32),

            Text(
              'The Three Pillars of Lent',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildPillarTile(
              context,
              icon: Icons.volunteer_activism_rounded,
              title: '1. Prayer',
              description: 'Deepening our personal relationship with Christ through silent meditation and Scripture.',
            ),
            _buildPillarTile(
              context,
              icon: Icons.restaurant_rounded,
              title: '2. Fasting',
              description: 'Denying earthly cravings on Ash Wednesday and Good Friday to hunger more for God.',
            ),
            _buildPillarTile(
              context,
              icon: Icons.handshake_rounded,
              title: '3. Almsgiving',
              description: 'Sharing our material resources and time with the poor and vulnerable.',
            ),

            const SizedBox(height: 24),
            Text(
              'Deep Dive & Spiritual Growth',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),

            // BUTTON 1: LENT LESSON
            Card(
              elevation: 0,
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.auto_stories_rounded,
                  color: theme.colorScheme.primary,
                ),
                title: const Text(
                  'Lent: Conversion & Fasting',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Read the complete theological lesson on the Lenten season.'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap: onOpenLentLesson,
              ),
            ),
            const SizedBox(height: 8),

            // BUTTON 2: ACT OF CONTRITION (SWITCHES TO DAILY PRAYERS TAB)
            Card(
              elevation: 0,
              color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: theme.colorScheme.secondary.withValues(alpha: 0.3),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.favorite_rounded,
                  color: theme.colorScheme.secondary,
                ),
                title: const Text(
                  'Pray the Act of Contrition',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Go to Daily Prayers to view the Act of Contrition.'),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                onTap: onOpenActOfContrition,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPillarTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String description,
      }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            child: Icon(icon, size: 18, color: theme.colorScheme.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}