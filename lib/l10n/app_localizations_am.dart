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
}
