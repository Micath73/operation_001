import 'package:flutter/material.dart';
import 'package:operation_001/angelus_screen.dart';
import 'package:operation_001/chapel_screen.dart';
import 'package:operation_001/container.dart';
import 'package:operation_001/context_hero_banner.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/prayer_categories.dart';
import 'package:operation_001/prayer_data.dart';
import 'package:operation_001/prayer_detail_screen.dart';
import 'package:operation_001/premium_page_route.dart'; // ✅ CORRECT
import 'package:operation_001/rosary_screen.dart';

class Dailyprayer extends StatefulWidget {
  final String? initialPrayerTitle;

  const Dailyprayer({super.key, this.initialPrayerTitle});

  @Deprecated('Use PrayerLibrary.anchorsOfTheDay instead')
  static const List<NovenaCombo> morningPrayers =
      PrayerLibrary.anchorsOfTheDay;

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

  NovenaCombo _resolvePrayer(String title) {
    return PrayerLibrary.all.firstWhere(
          (p) => p.text.toLowerCase() == title.toLowerCase(),
      orElse: () => NovenaCombo(
        text: title,
        imagePath: 'assets/sunrise.jpeg',
        category: '',
      ),
    );
  }

  void _openAngelus() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (context) => const AngelusScreen()),
    );
  }

  void _openRosary() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => RosaryDetailScreen(
          title: 'The Holy Rosary',
          steps: defaultRosaryList,
        ),
      ),
    );
  }

  void _openChaplet() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(builder: (context) => const ChapletScreen()),
    );
  }

  void _openTargetPrayer(String title) {
    final lowerTitle = title.toLowerCase().trim();

    if (lowerTitle.contains('angelus')) {
      _openAngelus();
      return;
    }

    if (lowerTitle.contains('rosary') && !lowerTitle.contains('morning')) {
      _openRosary();
      return;
    }

    if (lowerTitle.contains('chaplet')) {
      _openChaplet();
      return;
    }

    Navigator.of(context, rootNavigator: true).push(
      premiumPageRoute(NovenaPrayerDetailScreen(prayer: _resolvePrayer(title))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 8),
          ContextHeroBanner(
            onSuggestionTap: (prayer) => _openTargetPrayer(prayer.text),
          ),
          const SizedBox(height: 20),

          // Quick Action Hub
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: theme.colorScheme.outlineVariant),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context: context,
                      title: 'Angelus',
                      icon: Icons.church_rounded,
                      onTap: _openAngelus,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildActionButton(
                      context: context,
                      title: 'Rosary',
                      icon: Icons.grain_rounded,
                      onTap: _openRosary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildActionButton(
                      context: context,
                      title: 'Chaplet',
                      icon: Icons.favorite_rounded,
                      onTap: _openChaplet,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          for (final section in PrayerLibrary.sections) ...[
            Contain(title: section.key, prayers: section.value),
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 110,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: colorScheme.primary),
              const SizedBox(height: 8),
              Text(
                title,
                style: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}