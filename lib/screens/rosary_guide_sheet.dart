import 'package:flutter/material.dart';
import 'package:operation_001/rosary_screen.dart'; // Adjust path if needed

class RosaryGuideSheet extends StatelessWidget {
  final VoidCallback onOpenApparitionLesson;
  final VoidCallback onGoToRosaryScreen;

  const RosaryGuideSheet({
    super.key,
    required this.onOpenApparitionLesson,
    required this.onGoToRosaryScreen,
  });

  static void show(
      BuildContext context, {
        required VoidCallback onOpenApparitionLesson,
        required VoidCallback onGoToRosaryScreen,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RosaryGuideSheet(
        onOpenApparitionLesson: onOpenApparitionLesson,
        onGoToRosaryScreen: onGoToRosaryScreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              // Drag Handle Indicator
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurfaceVariant.withAlpha(100),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 12),

              // Title Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: Icon(
                        Icons.auto_awesome_rounded,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How to Pray the Holy Rosary',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'A Scriptural & Meditative Journey',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(height: 24),

              // Scrollable Content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    // What is the Rosary Card
                    _buildSectionCard(
                      context,
                      title: 'What is the Holy Rosary?',
                      icon: Icons.menu_book_rounded,
                      content:
                      'The Rosary is a Christ-centered prayer requested by Our Lady. While repeating the Hail Mary, we contemplate 20 sacred events (Mysteries) in the life, death, and resurrection of Jesus Christ through the eyes of Mary.',
                    ),
                    const SizedBox(height: 16),

                    // Quick Step-by-Step Sequence
                    Text(
                      'Step-by-Step Sequence',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildStepItem(
                      context,
                      number: '1',
                      title: 'Introductory Prayers',
                      desc: 'Make the Sign of the Cross, recite the Apostles\' Creed, 1 Our Father, 3 Hail Marys (for Faith, Hope, and Charity), and 1 Glory Be.',
                    ),
                    _buildStepItem(
                      context,
                      number: '2',
                      title: 'Announce the Mystery',
                      desc: 'Announce the 1st Mystery (e.g., The Annunciation) and pray 1 Our Father.',
                    ),
                    _buildStepItem(
                      context,
                      number: '3',
                      title: 'Pray the Decade',
                      desc: 'Recite 10 Hail Marys while meditating on the scene, followed by 1 Glory Be and the Fatima Prayer.',
                    ),
                    _buildStepItem(
                      context,
                      number: '4',
                      title: 'Repeat for 5 Decades',
                      desc: 'Repeat Steps 2 & 3 for each of the 5 mysteries of the day.',
                    ),
                    _buildStepItem(
                      context,
                      number: '5',
                      title: 'Closing Prayers',
                      desc: 'Pray the Hail Holy Queen (Salve Regina) and concluding prayer.',
                    ),

                    const SizedBox(height: 20),

                    // Deep Dive Action Buttons
                    Text(
                      'Deep Dive & Spiritual Growth',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Button 1: Open Rosary Mysteries
                    Card(
                      elevation: 0,
                      color: theme.colorScheme.primaryContainer.withAlpha(120),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: theme.colorScheme.primary.withAlpha(60),
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.church_rounded,
                          color: theme.colorScheme.primary,
                        ),
                        title: const Text(
                          'Open Rosary Mysteries Screen',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          'Select Joyful, Sorrowful, Glorious, or Luminous mysteries',
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () {
                          Navigator.pop(context);
                          onGoToRosaryScreen();
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Button 2: Our Lady of the Rosary Apparition Lesson
                    Card(
                      elevation: 0,
                      color: theme.colorScheme.secondaryContainer.withAlpha(120),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: theme.colorScheme.secondary.withAlpha(60),
                        ),
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.auto_stories_rounded,
                          color: theme.colorScheme.secondary,
                        ),
                        title: const Text(
                          'Our Lady of the Rosary (Pompeii & Lepanto)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          'Deep dive lesson on historical victories and apparitions',
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () {
                          Navigator.pop(context);
                          onOpenApparitionLesson();
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionCard(
      BuildContext context, {
        required String title,
        required IconData icon,
        required String content,
      }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem(
      BuildContext context, {
        required String number,
        required String title,
        required String desc,
      }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: theme.colorScheme.primary,
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc,
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