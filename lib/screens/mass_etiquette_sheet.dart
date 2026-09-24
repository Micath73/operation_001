import 'package:flutter/material.dart';

class MassEtiquetteSheet extends StatelessWidget {
  final VoidCallback? onGoToOrderOfMass;

  const MassEtiquetteSheet({
    super.key,
    this.onGoToOrderOfMass,
  });

  static void show(BuildContext context, {VoidCallback? onGoToOrderOfMass}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => MassEtiquetteSheet(
        onGoToOrderOfMass: onGoToOrderOfMass,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    final postures = [
      {
        'action': 'Stand',
        'icon': Icons.accessibility_new_rounded,
        'when': 'Gospel, Creed, Opening & Closing Prayers',
        'meaning': 'Active readiness, praise, and honor for Christ speaking in the Gospel.',
      },
      {
        'action': 'Sit',
        'icon': Icons.airline_seat_recline_normal_rounded,
        'when': 'Old/New Testament Readings, Homily, Offertory',
        'meaning': 'Receptive posture for listening, reflection, and spiritual instruction.',
      },
      {
        'action': 'Kneel',
        'icon': Icons.airline_seat_legroom_reduced_rounded,
        'when': 'Eucharistic Prayer (Consecration) & Post-Communion',
        'meaning': 'Adoration, humility, and reverence before the Holy Eucharist.',
      },
    ];

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Drag Handle
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor.withOpacity(0.15),
                  child: Icon(Icons.church_rounded, color: primaryColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mass Etiquette & Walkthrough',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Phase 1 • Essential Reverence & Postures',
                        style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Liturgical Postures at a Glance',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'In Catholic liturgy, body posture reflects internal prayer. Here is the quick rules of thumb when attending Mass:',
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 16),

                  // --- POSTURE CARDS ---
                  ...postures.map((item) {
                    return Card(
                      elevation: 0,
                      margin: const EdgeInsets.only(bottom: 12),
                      color: primaryColor.withOpacity(0.06),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: primaryColor.withOpacity(0.15)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: primaryColor.withOpacity(0.15),
                              child: Icon(item['icon'] as IconData, size: 20, color: primaryColor),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['action'] as String,
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    'When: ${item['when']}',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item['meaning'] as String,
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  // --- ACTION BUTTON TO SWITCH TO ORDER OF MASS ---
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.menu_book_rounded),
                      label: const Text(
                        'View Full Order of Mass',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Close sheet
                        if (onGoToOrderOfMass != null) {
                          onGoToOrderOfMass!();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}