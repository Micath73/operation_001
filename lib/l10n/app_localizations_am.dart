// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'ካቶሊክ የጸሎት ማዕከል';

  @override
  String get home => 'ዋና ገጽ';

  @override
  String get bible => 'መጽሐፍ ቅዱስ';

  @override
  String get mass => 'ቅዳሴ';

  @override
  String get journey => 'መንፈሳዊ ጉዞ';

  @override
  String get more => 'ተጨማሪ';

  @override
  String get dailyReflection => 'የዕለቱ አስተንትኖ';

  @override
  String get theHolyGospel => 'ቅዱስ ወንጌል';

  @override
  String get wordsOfSaints => 'የቅዱሳን አባባል';

  @override
  String get savedQuoteSuccess => 'ጥቅሱ ወደ ተወደዱት ተቀምጧል!';

  @override
  String get removedQuoteSuccess => 'ጥቅሱ ከተወደዱት ተወግዷል::';

  @override
  String get novenaCompletedTitle => 'ኖቬና ተጠናቋል!';

  @override
  String novenaCompletedBody(String novenaTitle) {
    return '$novenaTitle ኖቬናን አጠናቀዋል። ያለፈውን እድገት አጽድተው አዲስ ዑደት መጀመር ይፈልጋሉ?';
  }

  @override
  String get viewProgress => 'እድገትን ተመልከት';

  @override
  String get restartFresh => 'በአዲስ ጀምር';

  @override
  String get inProgressNovenas => 'በሂደት ላይ ያሉ ኖቬናዎች';

  @override
  String get completedNovenas => 'የተጠናቀቁ ኖቬናዎች';

  @override
  String get gospelOfTheDay => 'የዕለቱ ወንጌል';

  @override
  String get gospelDescription => 'ቀንዎን በዚህ የወንጌል ቃል ያሰላስሉ';

  @override
  String get read => 'ያንብቡ';

  @override
  String get prayerAndOurFatherTitle => 'ጸሎት እና አባታችን ሆይ ትንተና';

  @override
  String get ourLadyOfRosaryTitle => 'የመቁጠሪያዋ እመቤታችን (ፖምፔ እና ሌፓንቶ)';

  @override
  String get catechismCategory => 'ትምህርተ ክርስቶስ';

  @override
  String get apparitionsCategory => 'ራእያት';

  @override
  String get spiritualBreakdown => 'መንፈሳዊ ትንተና';

  @override
  String get lineByLineAnalysis => 'በየስንኙ የተደረገ መንፈሳዊ ትንተና::';

  @override
  String get holyMass => 'ቅዱስ ቁርባን';

  @override
  String get dailyReadings => 'የዕለቱ ንባባት';

  @override
  String get orderOfMass => 'የቅዳሴ ሥርዓት';

  @override
  String get dailyLiturgy => 'የዕለቱ ቅዳሴ';

  @override
  String get todaysMassReadings => 'የዛሬ የቅዳሴ ንባባት';

  @override
  String get dailyLiturgyDescription =>
      'ወንጌልን፣ መዝሙርንና አስተንትኖዎችን ጨምሮ የዛሬውን የጌታ ቃል ያዳምጡ::';

  @override
  String get openFullReader => 'ሙሉውን ያንብቡ';

  @override
  String get quickNavigation => 'ፈጣን ማውጫ';

  @override
  String get gospelReading => 'የዕለቱ ወንጌል';

  @override
  String get todaysGoodNews => 'የዛሬው የምስራች ቃል';

  @override
  String get liturgicalCalendar => 'የቤተክርስቲያን ዘመን አቆጣጠር';

  @override
  String get feastsAndSeasons => 'በዓላት እና ወቅቶች';

  @override
  String get introductoryRitesEn => 'The Introductory Rites';

  @override
  String get introductoryRitesAm => 'የመግቢያ ሥርዓት';

  @override
  String get introductoryRitesDesc => 'ከመግቢያ መዝሙር እስከ ዕለቱ ጸሎት::';

  @override
  String get liturgyOfTheWordEn => 'The Liturgy of the Word';

  @override
  String get liturgyOfTheWordAm => 'የቃል ሥርዓት';

  @override
  String get liturgyOfTheWordDesc => 'ከመጀመሪያው ንባብ እስከ የሕዝብ ጸሎት::';

  @override
  String get liturgyOfTheEucharistEn => 'The Liturgy of the Eucharist';

  @override
  String get liturgyOfTheEucharistAm => 'የቁርባን ሥርዓት';

  @override
  String get liturgyOfTheEucharistDesc => 'ከመባ ዝግጅት እስከ ምስጋና ጸሎት::';

  @override
  String get communionRiteEn => 'The Communion Rite';

  @override
  String get communionRiteAm => 'የቁርባን ተቀብሎ ሥርዓት';

  @override
  String get communionRiteDesc => 'ከአባታችን ሆይ እስከ የቁርባን በኋላ ጸሎት::';

  @override
  String get concludingRitesEn => 'The Concluding Rites';

  @override
  String get concludingRitesAm => 'የመዝጋቢ ሥርዓት';

  @override
  String get concludingRitesDesc => 'ማስታወቂያዎች፣ የመጨረሻ ቡራኬ እና መበተን::';

  @override
  String get angelusHeroTitle => 'የመልአኩ ሰላምታ';

  @override
  String get angelusHeroQuote =>
      'የእግዚአብሔር መልአክ ማርያምን አበሠራት፤ እርሷም በመንፈስ ቅዱስ ፀነሰች።';

  @override
  String get angelusCitation => '— ሉቃስ 1:38';

  @override
  String get angelusLetUsPray => 'እንጸልይ';

  @override
  String get angelusTitle => 'መልአኩ ሰላምታ';

  @override
  String get angelusAudioTitle => 'የመልአኩ ሰላምታ ድምፅ';

  @override
  String get angelusTextHeading => 'የመክፈቻ ጸሎት';

  @override
  String get angelusPrayerText =>
      'V. የእግዚአብሔር መልአክ ማርያምን አበሠራት፡፡\nR. እርሷም በመንፈስ ቅዱስ ፀነሰች፡፡\n\nጸጋ የመላሽ ማርያም ሆይ… ቅድስት ማርያም…\n\nV. እነሆኝ የእግዚአብሔር አገልጋይ፡፡\nR. እንዳልከኝ ይሁንልኝ፡፡\n\nጸጋ የመላሽ ማርያም ሆይ… ቅድስት ማርያም…\n\nV. ቃል ሥጋ ሆነ፡፡\nR. በኛም አደረ፡፡\n\nጸጋ የመላሽ ማርያም ሆይ… ቅድስት ማርያም…\n\nV. ቅድስት የአምላክ እናት ሆይ ለምኝልን፡፡\nR. ክርስቶስ ለሰጠን ተስፋ የተገባን እንድንሆን፡፡\n\nእንጸልይ:\nእግዚአብሔር ሆይ በመልአኩ ምስራች የልጅህን የኢየሱስ ክርስቶስን ሰው መሆኑን እንዳወቅን፤ በህማሙና በመስቀሉ ወደ ትንሣኤ ክብር እንድንደርስ ጸጋህን ስጠን፡፡ በጌታችን ኢየሱስ ክርስቶስ ስም እንለምንሃለን፡፡ አሜን፡፡';

  @override
  String get amenButton => 'አሜን';

  @override
  String get devotionalLabelEn => 'Devotional';

  @override
  String get devotionalLabelAm => 'ጸሎት';

  @override
  String get angelusCompletedTitleEn => 'Angelus Completed';

  @override
  String get angelusCompletedTitleAm => 'የመልአኩ ሰላምታ ተጠናቋል';

  @override
  String get angelusCompletedSubtitleEn =>
      'May the grace of His Incarnation fill your heart';

  @override
  String get angelusCompletedSubtitleAm => 'የምስራቹ ጸጋ ከእርስዎ ጋር ይሁን';

  @override
  String get chapletScreenHeading => 'የማሕሪው ኢየሱስ ጸሎት';

  @override
  String get chapletQuote =>
      '\"ልጄ ሆይ፣ የሰጠሁሽን ጸሎት ነፍሳት እንዲጸልዩ አበረታቺ። ይህን ጸሎት በመጸለይ የሚጠይቁኝን ሁሉ መስጠት ደስ ያሰኘኛል።\"';

  @override
  String get chapletQuoteCitation => '— ማስታወሻ ደብተር፣ 1541';

  @override
  String get chapletLetUsPray => 'እንጸልይ';

  @override
  String get chapletTitle => 'የማሕሪው ኢየሱስ ጸሎት';

  @override
  String get chapletAudioTitle => 'የማሕሪው ኢየሱስ ድምፅ';

  @override
  String get chapletStep1Title => '1. የመክፈቻ ጸሎት';

  @override
  String get chapletStep1Body =>
      'በአብ፡ በወልድ፡ ወመንፈስ ቅዱስ ስም አሐዱ አምላክ አሜን።\n\nአቤቱ ኢየሱስ ሆይ፡ ሞትክ፡ ነገር ግን የሕይወት ምንጭ ለነፍሳት ፈሰሰ፤ የምሕረትም ውቅያኖስ ለመላው ዓለም ተከፈተ። እጅግ ጥልቅ የሆነ የምሕረት ምንጭ ሆይ፡ መላውን ዓለም ሸፍን፡ እራስህንም በእኛ ላይ አፍስስ።\n\nእኛን የሚምር የኢየሱስ ልብ ሆይ፡ ከአንተ የፈሰሰው ደምና ውኃ፡ በእንተ እተማመናለሁ! (3 ጊዜ)';

  @override
  String get chapletStep2Title => '2. የመዘጋጃ ጸሎቶች';

  @override
  String get chapletStep2Body =>
      'አባታችን ሆይ በሰማያት የምትኖር… (አባታችን ሆይ)\n\nጸጋን የሞላብሽ ማርያም ሆይ ሰላም ለአንቺ ይሁን… (ሰላም ለአንቺ ይሁን)\n\nየሐዋርያት እምነት ጸሎት (ሃይማኖተ አበው):\nሁሉን በሚችል በሰማይና በምድር በታየውና ባልታየው በፈጠረ በአንድ አምላክ በእግዚአብሔር አብ እንስማማለን…';

  @override
  String get chapletStep3Title => '3. አምስቱ አስርቶች';

  @override
  String get chapletStep3Body =>
      'ለእያንዳንዱ 5 አስርቶች የሚከተለውን ይጸልዩ:\n\nበትልቁ እንቁላል ላይ:\n\"ዘላላማዊ አባት ሆይ፡ ስለ እኛና ስለ መላው ዓለም ኃጢአት ማስተስረያ፡ የተወደደውን ልጅህን የጌታችንን የኢየሱስ ክርስቶስን ሥጋውንና ደሙን ነፍሱንና አምላክነቱን ለአንተ እናቀርባለን።\"\n\nበ 10 ትናንሽ እንቁላሎች ላይ:\n\"ስለ ሕማማቱና ስለ ሞቱ፡ በእኛና በመላው ዓለም ላይ ምሕረት አድርግ።\"';

  @override
  String get chapletStep4Title => '4. የማጠቃለያ ጸሎት';

  @override
  String get chapletStep4Body =>
      'ቅዱስ እግዚአብሔር፡ ቅዱስ ኃያል፡ ቅዱስ ሕያው የማይሞት፡ በእኛና በመላው ዓለም ላይ ምሕረት አድርግ። (3 ጊዜ)\n\nየመዝጊያ ጸሎት:\nዘላለማዊ አምላክ ሆይ፡ ምሕረትህ አያልቅም፡ የርኅራኄህም መዝገብ አይጨረስም፤ በጭንቅ ጊዜ ተስፋ እንዳንቆርጥ፡ በታላቅ እምነት ወደ ቅዱስ ፈቃድህ እንድንመለስ በምሕረትህ ተመልከተን። አሜን።';

  @override
  String get chapletAmen => 'አሜን';

  @override
  String get chapletCompletedTitle => 'ጸሎቱ በስኬት ተጠናቋል';

  @override
  String get chapletCompletedSubtitle => 'ምህረቱ እና ጸጋው ከእርስዎ ጋር ይሁን';

  @override
  String get chapletDetailLabel => 'ጸሎት';

  @override
  String get angelus => 'አንጀሉስ';

  @override
  String get divineMercyChaplet => 'የመለኮታዊ ምሕረት ጸሎት';

  @override
  String get rosary => 'የመቁጠሪያ ጸሎት';

  @override
  String get holyRosary => 'የመቁጠሪያ ጸሎት';
}
