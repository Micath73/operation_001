import 'package:flutter/material.dart';
import 'package:operation_001/controllers/language_controller.dart';
import 'package:operation_001/l10n/app_localizations.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/prayer_category_screen.dart';

class Contain extends StatelessWidget {
  final String title;
  final List<NovenaCombo> prayers;

  const Contain({
    super.key,
    required this.title,
    required this.prayers,
  });

  IconData _getCategoryIcon(String categoryTitle) {
    final lower = categoryTitle.toLowerCase();
    if (lower.contains('everyday')) return Icons.wb_sunny_rounded;
    if (lower.contains('anchors')) return Icons.anchor_rounded;
    if (lower.contains('protection') || lower.contains('warfare')) return Icons.shield_rounded;
    if (lower.contains('repentance') || lower.contains('mercy')) return Icons.favorite_rounded;
    if (lower.contains('eucharistic')) return Icons.church_rounded;
    if (lower.contains('marian')) return Icons.star_rounded;
    if (lower.contains('intercession')) return Icons.people_rounded;
    return Icons.self_improvement_rounded;
  }

  String _getLocalizedContainerTitle(String originalTitle, bool isAmharic) {
    if (!isAmharic) return originalTitle;

    final lower = originalTitle.toLowerCase();
    if (lower.contains('everyday essentials')) return 'የዕለት ተዕለት መሠረታዊ ጸሎቶች';
    if (lower.contains('anchors of the day')) return 'የዕለቱ ዋና ዋና ጸሎቶች';
    if (lower.contains('protection') || lower.contains('warfare')) return 'ጥበቃ እና መንፈሳዊ ውጊያ';
    if (lower.contains('repentance') || lower.contains('mercy')) return 'ንስሐ እና ምሕረት';
    if (lower.contains('eucharistic')) return 'የቅዱስ ቁርባን ጸሎቶች';
    if (lower.contains('marian')) return 'የእመቤታችን ጸሎቶች';
    if (lower.contains('intercession')) return 'ምልጃ እና ለሌሎች መጸለይ';
    if (lower.contains('reflection') || lower.contains('surrender')) return 'መንፈሳዊ ማሰላሰል እና እጅ መስጠት';
    return originalTitle;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return ListenableBuilder(
      listenable: LanguageController.instance,
      builder: (context, child) {
        final isAmharic = LanguageController.instance.isAmharic;
        final localizedTitle = _getLocalizedContainerTitle(title, isAmharic);
        final categoryIcon = _getCategoryIcon(title);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            elevation: 3,
            shadowColor: primaryColor.withValues(alpha: 0.2),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => PrayerCategoryScreen(
                      categoryTitle: localizedTitle,
                      prayers: prayers,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(14), // Reduced from 16 to 14 for perfect layout fit
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      primaryColor,
                      primaryColor.withValues(alpha: 0.75),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      // Decorative background circle
                      Positioned(
                        right: -25,
                        top: -15,
                        bottom: -15,
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          // Left icon container
                          Container(
                            height: 74,
                            width: 74,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white.withValues(alpha: 0.3),
                                width: 1.2,
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                categoryIcon,
                                color: theme.colorScheme.onPrimary,
                                size: 34,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Category details and pill button
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Allows Column to adapt naturally
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isAmharic ? 'ምድብ' : 'CATEGORY',
                                  style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.75),
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  localizedTitle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontFamily: 'Georgia',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: theme.colorScheme.onPrimary,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Action Pill Button
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.white.withValues(alpha: 0.3),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        isAmharic
                                            ? '${prayers.length} ጸሎቶች'
                                            : 'Explore (${prayers.length})',
                                        style: TextStyle(
                                          fontFamily: 'Georgia',
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: theme.colorScheme.onPrimary,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        size: 13,
                                        color: theme.colorScheme.onPrimary,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}