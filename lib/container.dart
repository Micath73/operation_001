import 'package:flutter/material.dart';
import 'package:operation_001/new_prayer_template_page.dart';
import 'package:operation_001/angelus_screen.dart';
import 'package:operation_001/chapel_screen.dart';
import 'package:operation_001/expansion_tile.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/rosary_screen.dart';

class Contain extends StatefulWidget {
  final String title;
  final List<NovenaCombo> prayers;

  const Contain({
    super.key,
    required this.title,
    required this.prayers,
  });

  @override
  State<Contain> createState() => _ContainState();
}

class _ContainState extends State<Contain> {
  void _navigateToPrayer(BuildContext context, NovenaCombo prayer) {
    Widget destinationPage;

    switch (prayer.text) {
      case 'Morning Psalm Prayers':
        destinationPage = const MorningPsalmPage();
        break;
      case 'Angelus':
        destinationPage = AngelusScreen();
        break;
      case 'Divine Mercy Chaplet':
        destinationPage = ChapletScreen();
        break;
      case 'Rosary':
        destinationPage = RosaryDetailScreen(
          title: 'Holy Rosary',
          steps: defaultRosaryList,
        );
        break;
      default:
        destinationPage = NewPrayerTemplatePage(
          prayerTitle: prayer.text,
          prayerImage: prayer.imagePath,
        );
        break;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destinationPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: theme.colorScheme.primary.withAlpha(38),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...widget.prayers.map((prayer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () => _navigateToPrayer(context, prayer),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 8,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              prayer.imagePath,
                              height: 45,
                              width: 45,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Icon(
                                Icons.image_not_supported,
                                color: theme.colorScheme.onSurface.withAlpha(153),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              prayer.text,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: theme.colorScheme.onSurface.withAlpha(102),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}