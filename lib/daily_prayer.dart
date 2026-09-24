import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:operation_001/angelus_screen.dart';
import 'package:operation_001/chapel_screen.dart';
import 'package:operation_001/container.dart';
import 'package:operation_001/new_prayer_template_page.dart'; // Import updated template page
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/prayer_data.dart';
import 'package:operation_001/rosary_screen.dart';

class Dailyprayer extends StatefulWidget {
  final String? initialPrayerTitle;

  const Dailyprayer({super.key, this.initialPrayerTitle});

  static const List<NovenaCombo> morningPrayers = [
    NovenaCombo(
      text: 'The Morning Offering',
      imagePath: 'assets/morning offering.jpg',
      category: 'Morning',
    ),
    NovenaCombo(
      text: 'Prayer of St. Francis',
      imagePath: 'assets/francis.jpg',
      category: 'Morning',
    ),
    NovenaCombo(
      text: 'The Guardian Angel Prayer',
      imagePath: 'assets/guardian angel.jpg',
      category: 'Morning',
    ),
    NovenaCombo(
      text: 'Morning Psalm Prayers',
      imagePath: 'assets/morning rosary.jpg',
      category: 'Morning',
    ),
    NovenaCombo(
      text: 'The Benedictus',
      imagePath: 'assets/My Daily Journal.jpg',
      category: 'Morning',
    ),
  ];

  static const List<NovenaCombo> midDayPrayers = [
    NovenaCombo(
      text: 'Angelus',
      imagePath: 'assets/img_1.png',
      category: 'Midday',
    ),
    NovenaCombo(
      text: 'Act Of Contrition',
      imagePath: 'assets/img_2.png',
      category: 'Midday',
    ),
    NovenaCombo(
      text: 'Prayer for the Hour of Mercy',
      imagePath: 'assets/img_5.png',
      category: 'Midday',
    ),
    NovenaCombo(
      text: 'Prayer to St. Michael the Archangel',
      imagePath: 'assets/img_4.png',
      category: 'Midday',
    ),
    NovenaCombo(
      text: 'Divine Mercy Chaplet',
      imagePath: 'assets/img_3.png',
      category: 'Midday',
    ),
  ];

  static const List<NovenaCombo> eveningPrayers = [
    NovenaCombo(
      text: 'Rosary',
      imagePath: 'assets/img_6.png',
      category: 'Evening',
    ),
    NovenaCombo(
      text: 'Vespers (Evening Prayer)',
      imagePath: 'assets/img_7.png',
      category: 'Evening',
    ),
    NovenaCombo(
      text: 'The Magnificat',
      imagePath: 'assets/img_8.png',
      category: 'Evening',
    ),
    NovenaCombo(
      text: 'Prayer of St. Augustine',
      imagePath: 'assets/img_9.png',
      category: 'Evening',
    ),
    NovenaCombo(
      text: 'Compline (Night Prayer)',
      imagePath: 'assets/img_10.png',
      category: 'Evening',
    ),
  ];

  static const List<NovenaCombo> intercessionPrayers = [
    NovenaCombo(
      text: 'The Memorare',
      imagePath: 'assets/img_11.png',
      category: 'Intercession',
    ),
    NovenaCombo(
      text: 'Prayer to Saint Joseph',
      imagePath: 'assets/img_12.png',
      category: 'Intercession',
    ),
    NovenaCombo(
      text: 'Prayer to St. Michael the Archangel',
      imagePath: 'assets/img_13.png',
      category: 'Intercession',
    ),
    NovenaCombo(
      text: 'Prayer to St. Francis of Assisi',
      imagePath: 'assets/img_14.png',
      category: 'Intercession',
    ),
    NovenaCombo(
      text: 'The Litany of the Saints',
      imagePath: 'assets/img_15.png',
      category: 'Intercession',
    ),
  ];

  static const List<NovenaCombo> otherPrayers = [
    NovenaCombo(
      text: 'Prayer of Abandonment',
      imagePath: 'assets/father.jpg',
      category: 'Other Devotions',
    ),
    NovenaCombo(
      text: 'Anima Christi',
      imagePath: 'assets/anima christi vip.jpg',
      category: 'Other Devotions',
    ),
    NovenaCombo(
      text: 'Litany of the Holy Name of Jesus',
      imagePath: 'assets/img_16.png',
      category: 'Other Devotions',
    ),
    NovenaCombo(
      text: 'Come, Holy Spirit',
      imagePath: 'assets/img_17.png',
      category: 'Other Devotions',
    ),
    NovenaCombo(
      text: 'Hail Holy Queen',
      imagePath: 'assets/img_18.png',
      category: 'Other Devotions',
    ),
  ];

  @override
  State<Dailyprayer> createState() => _DailyprayerState();
}

class _DailyprayerState extends State<Dailyprayer> {
  @override
  void initState() {
    super.initState();
    _checkAndOpenPrayer(widget.initialPrayerTitle);
  }

  @override
  void didUpdateWidget(covariant Dailyprayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialPrayerTitle != oldWidget.initialPrayerTitle) {
      _checkAndOpenPrayer(widget.initialPrayerTitle);
    }
  }

  void _checkAndOpenPrayer(String? title) {
    if (title != null && title.trim().isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _openTargetPrayer(title);
      });
    }
  }

  // Find image asset corresponding to prayer title, defaulting if unspecified
  String _getImageForTitle(String title) {
    final allPrayers = [
      ...Dailyprayer.morningPrayers,
      ...Dailyprayer.midDayPrayers,
      ...Dailyprayer.eveningPrayers,
      ...Dailyprayer.intercessionPrayers,
      ...Dailyprayer.otherPrayers,
    ];

    final match = allPrayers.firstWhere(
          (p) => p.text.toLowerCase() == title.toLowerCase(),
      orElse: () => const NovenaCombo(
        text: '',
        imagePath: 'assets/sunrise.jpeg',
        category: '',
      ),
    );

    return match.imagePath.isNotEmpty
        ? match.imagePath
        : 'assets/sunrise.jpeg';
  }

  void _openTargetPrayer(String title) {
    final imagePath = _getImageForTitle(title);

    // ✅ Pushes to NewPrayerTemplatePage for the manuscript UI
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => NewPrayerTemplatePage(
          prayerTitle: title,
          prayerImage: imagePath,
        ),
      ),
    );
  }

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
                color: theme.colorScheme.primaryContainer,
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
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) => const AngelusScreen(),
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
                        Navigator.of(context, rootNavigator: true).push(
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
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (context) => const ChapletScreen(),
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
          Contain(
            title: 'Morning Prayers',
            prayers: Dailyprayer.morningPrayers,
          ),
          const SizedBox(height: 24),
          Contain(
            title: 'Mid-Day Prayers',
            prayers: Dailyprayer.midDayPrayers,
          ),
          const SizedBox(height: 24),
          Contain(
            title: 'Evening Prayers',
            prayers: Dailyprayer.eveningPrayers,
          ),
          const SizedBox(height: 24),
          Contain(
            title: 'Intercession Prayers',
            prayers: Dailyprayer.intercessionPrayers,
          ),
          const SizedBox(height: 24),
          Contain(
            title: 'Other Prayers',
            prayers: Dailyprayer.otherPrayers,
          ),
          const SizedBox(height: 24),
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
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.primary,
                    BlendMode.srcIn,
                  ),
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