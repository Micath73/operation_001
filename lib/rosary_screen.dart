import 'package:flutter/material.dart';

// Package imports with consistent naming
import 'package:operation_001/controllers/language_controller.dart';
import 'package:operation_001/glorious.dart';
import 'package:operation_001/joyful.dart';
import 'package:operation_001/luminous.dart';
import 'package:operation_001/sorrowful.dart';

class RosaryItem {
  final String titleEn;
  final String titleAm;
  final String daysEn;
  final String daysAm;
  final String quoteEn;
  final String quoteAm;
  final String image;
  final WidgetBuilder targetBuilder;

  const RosaryItem({
    required this.titleEn,
    required this.titleAm,
    required this.daysEn,
    required this.daysAm,
    required this.quoteEn,
    required this.quoteAm,
    required this.image,
    required this.targetBuilder,
  });

  String getTitle(bool isAmharic) => isAmharic ? titleAm : titleEn;
  String getDays(bool isAmharic) => isAmharic ? daysAm : daysEn;
  String getQuote(bool isAmharic) => isAmharic ? quoteAm : quoteEn;
}

final List<RosaryItem> defaultRosaryList = [
  RosaryItem(
    titleEn: 'The Joyful Mysteries',
    titleAm: 'የደስታ ምሥጢር',
    daysEn: 'Mondays & Saturdays',
    daysAm: 'ሰኞ እና ቅዳሜ',
    quoteEn:
    '"The Joyful Mysteries are indeed a weekly meditation on the joy of human salvation, beginning with the Annunciation where heaven and earth unite."\n— Pope St. John Paul II',
    quoteAm:
    '"የደስታ ምስጢር፤ ሰማይና ምድር ከተዋሃዱበት ከብስራት ጀምሮ ባለው፤ የሰው ልጆች ደኅንነት ታሪክ በየሳምንቱ የምናሰላስልበት ምስጢር ነው።"\n— ፖፕ ቅዱስ ዮሐንስ ጳውሎስ ፪ኛ',
    image: 'assets/wmremove-transformed (3).jpeg',
    targetBuilder: (context) => const JoyfulScreen(),
  ),
  RosaryItem(
    titleEn: 'The Sorrowful Mysteries',
    titleAm: 'የሕማም ምሥጢር',
    daysEn: 'Tuesdays & Fridays',
    daysAm: 'ማክሰኞ እና አርብ',
    quoteEn:
    '"By His wounds we are healed. In the Sorrowful Mysteries, we accompany Christ through His agony, scourging, and crucifixion, finding infinite mercy in His suffering."\n— St. Alphonsus Liguori',
    quoteAm:
    '"በቁስሎቹ እኛ ተፈወስን። በሐዘን ምስጢር ክርስቶስን በህማሙ፣ በግርፋቱና በስቅለቱ እንከተለዋለን፤ በመከራውም ማለቂያ የሌለው ምሕረትን እናገኛለን።"\n— ቅዱስ አልፎንሶ ሊጉዎሪ',
    image: 'assets/wmremove-transformed (6).jpeg',
    targetBuilder: (context) => const SorrowfulScreen(),
  ),
  RosaryItem(
    titleEn: 'The Glorious Mysteries',
    titleAm: 'የክብር ምሥጢር',
    daysEn: 'Wednesdays & Sundays',
    daysAm: 'ዕሮብ እና እሑድ',
    quoteEn:
    '"Christ is risen! The Glorious Mysteries open our eyes to eternal life and the ultimate triumph of love over death."\n— Pope Benedict XVI',
    quoteAm:
    '"ክርስቶስ ተነሥቷል! የክብር ምስጢር ወደ ዘላለም ሕይወትና፤ ፍቅር በሞት ላይ ላደረገው ፍጹም ድል ዓይኖቻችንን ይከፍትልናል።"\n— ፖፕ በነዲክቶስ ፲፮ኛ',
    image: 'assets/wmremove-transformed (9).jpeg',
    targetBuilder: (context) => const GloriousScreen(),
  ),
  RosaryItem(
    titleEn: 'The Luminous Mysteries',
    titleAm: 'የብርሃን ምሥጢር',
    daysEn: 'Thursdays',
    daysAm: 'ሐሙስ',
    quoteEn:
    '"The Luminous Mysteries reveal Christ as the ultimate light of the world, illuminating our path from His baptism in the Jordan to the institution of the Holy Eucharist."\n— Pope St. John Paul II',
    quoteAm:
    '"የብርሃን ምስጢር ክርስቶስን የዓለም ብርሃን አድርጎ ያሳየናል፤ ከዮርዳኖስ ጥምቀቱ አንስቶ፤ ምሥጢረ ቁርባንን እስከ መሰረተበት ድረስ መንገዳችንን ያበራል።"\n— ፖፕ ቅዱስ ዮሐንስ ጳውሎስ ፪ኛ',
    image: 'assets/wmremove-transformed (10).png',
    targetBuilder: (context) => const LuminousScreen(),
  ),
];

class RosaryDetailScreen extends StatelessWidget {
  final String title;
  final List<RosaryItem> steps;

  const RosaryDetailScreen({
    super.key,
    required this.title,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListenableBuilder(
      listenable: LanguageController.instance,
      builder: (context, child) {
        final isAmharic = LanguageController.instance.isAmharic;
        final screenTitle = isAmharic ? 'የመቁጠሪያ ምሥጢራት' : title;

        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          appBar: AppBar(
            title: Text(screenTitle),
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: steps.length,
            itemBuilder: (context, index) {
              final item = steps[index];
              return Card(
                elevation: 0,
                color: theme.colorScheme.surfaceContainerLow,
                margin: const EdgeInsets.only(bottom: 16),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: item.targetBuilder),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item.image,
                            width: 90,
                            height: 110,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: 90,
                              height: 110,
                              color: theme.colorScheme.primaryContainer,
                              child: Icon(
                                Icons.image_not_supported_rounded,
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.getTitle(isAmharic),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: theme.colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                isAmharic
                                    ? 'የሚጸለይበት ቀን፦ ${item.getDays(isAmharic)}'
                                    : 'Prayed on: ${item.getDays(isAmharic)}',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item.getQuote(isAmharic),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}