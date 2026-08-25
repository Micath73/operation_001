import 'package:flutter/material.dart';
import 'package:operation_001/NewPrayerTemplatePage.dart';
import 'package:operation_001/angelusScreen.dart';
import 'package:operation_001/chapelScreen.dart';
import 'package:operation_001/expansionTile.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/rosaryScreen.dart';

class Contain extends StatefulWidget {
  final String title;
  final List<NovenaCombo> prayers;
  const Contain({super.key, required this.title, required this.prayers});

  @override
  State<Contain> createState() => _ContainState();
}

class _ContainState extends State<Contain> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
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
              style: TextStyle(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 20),
            ...widget.prayers.map((prayer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: GestureDetector(
                  onTap: () {
                    if (prayer.text == 'Morning Psalm Prayers') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MorningPsalmPage(),
                        ),
                      );
                    } else if (prayer.text == 'Angelus') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const angelus(),
                        ),
                      );
                    } else if (prayer.text == 'Divine Mercy Chaplet') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const chaplet(),
                        ),
                      );
                    } else if (prayer.text == 'Rosary') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const rosary()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewPrayerTemplatePage(
                            prayerTitle: prayer.text,
                            prayerImage: prayer.imagePath,
                          ),
                        ),
                      );
                    }
                  },
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
                            color: theme.colorScheme.onPrimary.withOpacity(0.7),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          prayer.text,
                          style: TextStyle(
                            color: theme.colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
