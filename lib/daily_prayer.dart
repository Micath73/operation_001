import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:operation_001/angelus_screen.dart';
import 'package:operation_001/chapel_screen.dart';
import 'package:operation_001/container.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/rosary_screen.dart';

class Dailyprayer extends StatelessWidget {
  const Dailyprayer({super.key});

  static const List<NovenaCombo> morningPrayers = [
    NovenaCombo(
      text: 'The Morning Offering',
      imagePath: 'assets/morning offering.jpg',
    ),
    NovenaCombo(text: 'Prayer of St. Francis', imagePath: 'assets/francis.jpg'),
    NovenaCombo(
      text: 'The Guardian Angel Prayer',
      imagePath: 'assets/guardian angel.jpg',
    ),
    NovenaCombo(
      text: 'Morning Psalm Prayers',
      imagePath: 'assets/morning rosary.jpg',
    ),
    NovenaCombo(
      text: 'The Benedictus',
      imagePath: 'assets/My Daily Journal.jpg',
    ),
  ];

  static const List<NovenaCombo> midDayPrayers = [
    NovenaCombo(text: 'Angelus', imagePath: 'assets/img_1.png'),
    NovenaCombo(text: 'Act Of Contrition', imagePath: 'assets/img_2.png'),
    NovenaCombo(
      text: 'Prayer for the Hour of Mercy',
      imagePath: 'assets/img_5.png',
    ),
    NovenaCombo(
      text: 'Prayer to St. Michael the Archangel',
      imagePath: 'assets/img_4.png',
    ),
    NovenaCombo(text: 'Divine Mercy Chaplet', imagePath: 'assets/img_3.png'),
  ];

  static const List<NovenaCombo> eveningPrayers = [
    NovenaCombo(text: 'Rosary', imagePath: 'assets/img_6.png'),
    NovenaCombo(
      text: 'Vespers (Evening Prayer)',
      imagePath: 'assets/img_7.png',
    ),
    NovenaCombo(text: 'The Magnificat', imagePath: 'assets/img_8.png'),
    NovenaCombo(text: 'Prayer of St. Augustine', imagePath: 'assets/img_9.png'),
    NovenaCombo(
      text: 'Compline (Night Prayer)',
      imagePath: 'assets/img_10.png',
    ),
  ];

  static const List<NovenaCombo> intercessionPrayers = [
    NovenaCombo(text: 'The Memorare', imagePath: 'assets/img_11.png'),
    NovenaCombo(text: 'Prayer to Saint Joseph', imagePath: 'assets/img_12.png'),
    NovenaCombo(
      text: 'Prayer to St. Michael the Archangel',
      imagePath: 'assets/img_13.png',
    ),
    NovenaCombo(
      text: 'Prayer to St. Francis of Assisi',
      imagePath: 'assets/img_14.png',
    ),
    NovenaCombo(
      text: 'The Litany of the Saints',
      imagePath: 'assets/img_15.png',
    ),
  ];

  static const List<NovenaCombo> otherPrayers = [
    NovenaCombo(text: 'Prayer of Abandonment', imagePath: 'assets/father.jpg'),
    NovenaCombo(
      text: 'Anima Christi',
      imagePath: 'assets/anima christi vip.jpg',
    ),
    NovenaCombo(
      text: 'Litany of the Holy Name of Jesus',
      imagePath: 'assets/img_16.png',
    ),
    NovenaCombo(text: 'Come, Holy Spirit', imagePath: 'assets/img_17.png'),
    NovenaCombo(text: 'Hail Holy Queen', imagePath: 'assets/img_18.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context: context,
                      title: 'Angelus',
                      svgAsset: 'assets/angeelus.svg',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AngelusScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildActionButton(
                      context: context,
                      title: 'Rosary',
                      svgAsset: 'assets/Rosariia.svg',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RosaryDetailScreen(
                              title: 'The Holy Rosary',
                              steps: defaultRosaryList,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildActionButton(
                      context: context,
                      title: 'Chaplet',
                      svgAsset: 'assets/Sacred-Heart-of-Jesus.svg',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChapletScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Contain(title: 'Morning Prayers', prayers: morningPrayers),
          const SizedBox(height: 24),
          const Contain(title: 'Mid-Day Prayers', prayers: midDayPrayers),
          const SizedBox(height: 24),
          const Contain(title: 'Evening Prayers', prayers: eveningPrayers),
          const SizedBox(height: 24),
          const Contain(title: 'Intercession Prayers', prayers: intercessionPrayers),
          const SizedBox(height: 24),
          const Contain(title: 'Other Prayers', prayers: otherPrayers),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String title,
    required String svgAsset,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          height: 110,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  svgAsset,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}