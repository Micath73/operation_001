import 'package:flutter/material.dart';
import 'package:operation_001/container.dart';
import 'package:operation_001/controllers/language_controller.dart';
import 'package:operation_001/l10n/app_localizations.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/prayer_data.dart';
import 'package:operation_001/prayer_detail_screen.dart';
import 'package:operation_001/premium_page_route.dart';
import 'package:operation_001/angelus_screen.dart';
import 'package:operation_001/chapel_screen.dart';
import 'package:operation_001/rosary_screen.dart';

class PrayerCategoryScreen extends StatelessWidget {
  final String categoryTitle;
  final List<NovenaCombo> prayers;

  const PrayerCategoryScreen({
    super.key,
    required this.categoryTitle,
    required this.prayers,
  });

  String _getCategoryDescription(String title, bool isAmharic) {
    final lower = title.toLowerCase();
    if (lower.contains('everyday')) {
      return isAmharic
          ? 'እእነዚህ መሠረታዊ ጸሎቶች የክርስቲያናዊ ሕይወትዎ ማዕከል ናቸው፤ ቀንዎን ለመጀመር፣ ለማጠናቀቅ ወይም በየዕለቱ ለመጸለይ እንጠቀማቸዋለን። ከጥንታዊቷ ቤተክርስቲያን ትውፊት የተቀዱና ከእግዚአብሔር ጋር ያለዎትን ሐዋርያዊ ኅብረት የሚያጠናክሩ ናቸው።\n\n"ሳታቋርጡ ጸልዩ።" — 1 ተሰሎንቄ 5፥17'
          : 'These foundational prayers form the core of daily Catholic spiritual life, ideal for starting your morning, concluding your day, or praying throughout the week. Rooted in the ancient tradition of the Church, they guide the soul into unceasing communion with God.\n\n"Pray without ceasing." — 1 Thessalonians 5:17';
    } else if (lower.contains('anchors')) {
      return isAmharic
          ? 'እነዚህ ጸሎቶች ቀንዎን በጸሎት የሚያያይዙ ሲሆን፤ ከጠዋት እስከ ለሊት ድረስ እያንዳንዱን ሰዓት በጥንታዊቷ ቤተክርስቲያን ትውፊት መሰረት እንድንባርከዉ ይረዳናል።\n\n"እግዚአብሔር ሆይ፤ በማለዳ ድምፄን ትሰማለህ፤ በማለዳ ልመናዬን በፊትህ አቀርባለሁ፤ ፈቃድህንም በጥሞና እጠባበቃለሁ።" — መዝሙር 5፥3'
          : 'These structural devotions anchor your day in prayer, keeping your spiritual focus aligned from morning till night, sanctifying the passing hours according to the sacred rhythms of Christian tradition.\n\n"O Lord, in the morning you hear my voice; in the morning I plead my case to you and watch." — Psalm 5:3';
    } else if (lower.contains('protection') || lower.contains('warfare')) {
      return isAmharic
          ? 'በፈተና፣ በጭንቀት ወይም በመንፈሳዊ ውጊያ ሰዓት ሰላምን፤ ብርታትን፤ እንዲሁም መንፈሳዊ ከለላን ለማግኘት ቅድስት ቤተክርስቲያን የሰጠችውን፤ በቅዱሳን መላእክት እና ቅዱሳን አማላጅነት በመታመን የሚጸለየውን እነዚህን የጥበቃና የድል ጸሎቶች ተጠቀሙ።\n\n"የዲያብሎስን የተንኰል ሥራ መቋቋም ትችሉ ዘንድ፣ የእግዚአብሔርን ሙሉ የጦር ዕቃ ልበሱ።።" — ኤፌሶን 6፥11'
          : 'In times of anxiety, temptation, or spiritual battle, the Church offers these traditional invocations for peace, courage, and heavenly protection through the intercession of the holy angels and saints.\n\n"Put on the whole armor of God, that you may be able to stand against the wiles of the devil." — Ephesians 6:11';
    } else if (lower.contains('repentance') || lower.contains('mercy')) {
      return isAmharic
          ? 'የእግዚአብሔርን ማለቂያ የሌለውን ምሕረት በመለመን ሕሊናዎን የሚያነጹበት እና ይቅርታን የሚያገኙበት፣ ነፍስን በንስሐ የሚያጥቡበት ጸሎቶች ናቸው።\n\n"እግዚአብሔር ሆይ፤ እንደ ቸርነትህ መጠን፣ ምሕረት አድርግልኝ፤ እንደ ርኅራኄህም ብዛት፣ መተላለፌን ደምስስ።" — መዝሙር 51፥1'
          : 'Seek God\'s infinite mercy, purify your conscience, and draw close to the fount of divine compassion through these penitential prayers, washing the soul in divine grace.\n\n"Have mercy on me, O God, according to your steadfast love; according to your abundant mercy blot out my transgressions." — Psalm 51:1';
    } else if (lower.contains('eucharistic')) {
      return isAmharic
          ? 'ቅዱስ ቁርባንን ሲቀበሉ ወይም ልብዎን ከእርሱ ጋር ሲያተባበሩ የሚደረጉ ልዩ የምስጋና፣ የውዳሴ እና ከእውነተኛው የሕይወት እንጀራ ጋር የመተባበር ጸሎቶች ናቸው።\n\n"ሥጋዬ እውነተኛ መብል ደሜም እውነተኛ መጠጥ ነውና።" — ዮሐንስ 6፥55'
          : 'Deepen your devotion to the Real Presence with these profound prayers of thanksgiving, adoration, and Eucharistic union, uniting your heart with Christ in the Blessed Sacrament.\n\n"For my flesh is true food, and my blood is true drink." — John 6:55';
    } else if (lower.contains('marian')) {
      return isAmharic
          ? 'ከትውልድ ወደ ትውልድ ሲተላለፍ በመጣው መቁጠሪያ፤ ጥንታዊ መዝሙሮች ና ጸሎቶች እመቤታችን ቅድስት ንግል ማርያምን እንወድሳት።\n\n"የባሪያይቱን ውርደት ተመልክቶአልና። እነሆም፥ ከዛሬ ጀምሮ ትውልድ ሁሉ ብፅዕት ይሉኛል።" — ሉቃስ 1፥48'
          : 'Honor Our Blessed Mother and seek her powerful intercession through traditional rosaries, ancient hymns, and deep Marian devotions inherited through generations of faith.\n\n"For behold, from now on all generations will call me blessed." — Luke 1:48';
    } else if (lower.contains('intercession')) {
      return isAmharic
          ? 'ለቤተሰብ፣ ለርእሰ ሊቀ ጳጳስ፣ ለቅዱሳን ማኅበር እና ለሚያልፉት ነፍሳት ሁሉ የሐዋርያዊ ምልጃ ጸሎቶችን በማድረግ የቤተክርስቲያንን አንድነት አጠናክሩ።\n\n"እርስ በርሳችሁ በኃጢአታችሁ ተናዘዙ። ትፈወሱም ዘንድ እያንዳንዱ ስለ ሌላው ይጸልይ፤ የጻድቅ ሰው ጸሎት በሥራዋ እጅግ ኃይል ታደርጋለች።" — ያዕቆብ 5፥16'
          : 'Lift up your family, the Holy Father, the communion of saints, and the holy souls in purgatory through communal intercession, standing in prayer for the needs of the universal Church.\n\n"Pray for one another, that you may be healed. The prayer of a righteous person has great power as it is working." — James 5:16';
    } else {
      return isAmharic
          ? 'በጽሞና ለማሰላሰል፣ ለውስጣዊ ጸጥታ እና ለእግዚአብሔር ራስን አሳልፎ ለመስጠት የሚረዱ፣ በልዑል እጆች ውስጥ ሰላምን ማግኛ መንፈሳዊ ጸሎቶች።\n\n"በፍጹም ልብህ በእግዚአብሔር ታመን፥ በራስህም ማስተዋል አትደገፍ፤በመንገድህ ሁሉ እርሱን እወቅ፥ እርሱም ጎዳናህን ያቀናልሃል።" — ምሳሌ 3፥5-6'
          : 'Quiet your heart and surrender your will completely to God through these contemplative, reflective prayers, resting peacefully in His divine providence.\n\n"Trust in the Lord with all your heart, and do not lean on your own understanding." — Proverbs 3:5';
    }
  }

  void _navigateToPrayer(BuildContext context, NovenaCombo prayer, AppLocalizations l10n) {
    final lowerText = prayer.text.toLowerCase();

    if (lowerText.contains('angelus')) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AngelusScreen()));
      return;
    }
    if (lowerText.contains('divine mercy chaplet') || lowerText.contains('chaplet')) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChapletScreen()));
      return;
    }
    if (lowerText.contains('rosary')) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RosaryDetailScreen(title: l10n.holyRosary, steps: defaultRosaryList),
      ));
      return;
    }

    Navigator.of(context).push(
      premiumPageRoute(NovenaPrayerDetailScreen(prayer: prayer)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final deepGold = isDark ? const Color(0xFFE5C158) : theme.colorScheme.primary;

    return ListenableBuilder(
      listenable: LanguageController.instance,
      builder: (context, child) {
        final l10n = AppLocalizations.of(context)!;
        final isAmharic = LanguageController.instance.isAmharic;
        final description = _getCategoryDescription(categoryTitle, isAmharic);

        return Scaffold(
          backgroundColor: isDark ? const Color(0xFF1C1A18) : const Color(0xFFF3EFE0),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: deepGold),
            title: Text(
              categoryTitle,
              style: TextStyle(
                fontFamily: 'Georgia',
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
            children: [
              // Catechetical Banner Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      deepGold.withValues(alpha: isDark ? 0.25 : 0.15),
                      theme.colorScheme.surface,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: deepGold.withValues(alpha: 0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.auto_stories_rounded, color: deepGold, size: 22),
                        const SizedBox(width: 8),
                        Text(
                          'SPIRITUAL GUIDANCE',
                          style: TextStyle(
                            fontFamily: 'Georgia',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: deepGold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      description,
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 15,
                        height: 1.5,
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                isAmharic ? 'የዚህ ምድብ ጸሎቶች' : 'Prayers in this Category',
                style: TextStyle(
                  fontFamily: 'Georgia',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: deepGold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              // Prayer Items List
              ...prayers.map((prayer) {
                final localizedName = prayer.localizedText(isAmharic: isAmharic, l10n: l10n);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Material(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                    elevation: 1,
                    shadowColor: Colors.black12,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => _navigateToPrayer(context, prayer, l10n),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                prayer.imagePath,
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  height: 50,
                                  width: 50,
                                  color: deepGold.withValues(alpha: 0.2),
                                  child: Icon(Icons.bookmark_rounded, color: deepGold),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                localizedName,
                                style: TextStyle(
                                  fontFamily: 'Georgia',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                            ),
                            Icon(Icons.chevron_right_rounded, color: deepGold),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}