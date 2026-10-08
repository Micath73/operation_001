// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Catholic Devotional Hub';

  @override
  String get home => 'Home';

  @override
  String get bible => 'Bible';

  @override
  String get mass => 'Mass';

  @override
  String get journey => 'Journey';

  @override
  String get more => 'More';

  @override
  String get dailyReflection => 'Daily Reflection';

  @override
  String get theHolyGospel => 'The Holy Gospel';

  @override
  String get wordsOfSaints => 'Words of the Saints';

  @override
  String get savedQuoteSuccess => 'Saved quote to favorites!';

  @override
  String get removedQuoteSuccess => 'Removed quote from favorites.';

  @override
  String get novenaCompletedTitle => 'Novena Completed!';

  @override
  String novenaCompletedBody(String novenaTitle) {
    return 'You have already completed the $novenaTitle. Would you like to clear your previous progress and start a fresh cycle?';
  }

  @override
  String get viewProgress => 'View Progress';

  @override
  String get restartFresh => 'Restart Fresh';

  @override
  String get inProgressNovenas => 'In Progress Novenas';

  @override
  String get completedNovenas => 'Completed Novenas';

  @override
  String get gospelOfTheDay => 'Gospel Of The Day';

  @override
  String get gospelDescription => 'Reflect your day with this Gospel verse';

  @override
  String get read => 'Read';

  @override
  String get prayerAndOurFatherTitle => 'Prayer & The Our Father Breakdown';

  @override
  String get ourLadyOfRosaryTitle =>
      'Our Lady of the Rosary (Pompeii & Lepanto)';

  @override
  String get catechismCategory => 'Catechism';

  @override
  String get apparitionsCategory => 'Apparitions';

  @override
  String get spiritualBreakdown => 'Spiritual Breakdown';

  @override
  String get lineByLineAnalysis => 'Line-by-line spiritual analysis.';

  @override
  String get holyMass => 'Holy Mass';

  @override
  String get dailyReadings => 'Daily Readings';

  @override
  String get orderOfMass => 'Order of Mass';

  @override
  String get dailyLiturgy => 'DAILY LITURGY';

  @override
  String get todaysMassReadings => 'Today\'s Mass Readings';

  @override
  String get dailyLiturgyDescription =>
      'Listen to the Word of the Lord for today\'s Holy Mass including Gospel, Psalm & Reflections.';

  @override
  String get openFullReader => 'Open Full Reader';

  @override
  String get quickNavigation => 'QUICK NAVIGATION';

  @override
  String get gospelReading => 'Gospel Reading';

  @override
  String get todaysGoodNews => 'Today\'s Good News';

  @override
  String get liturgicalCalendar => 'Liturgical Calendar';

  @override
  String get feastsAndSeasons => 'Feasts & Seasons';

  @override
  String get introductoryRitesEn => 'The Introductory Rites';

  @override
  String get introductoryRitesAm => 'የመግቢያ ሥርዓት';

  @override
  String get introductoryRitesDesc =>
      'From the Entrance Chant through the Collect prayer.';

  @override
  String get liturgyOfTheWordEn => 'The Liturgy of the Word';

  @override
  String get liturgyOfTheWordAm => 'የቃል ሥርዓት';

  @override
  String get liturgyOfTheWordDesc =>
      'From the First Reading through the Universal Prayer.';

  @override
  String get liturgyOfTheEucharistEn => 'The Liturgy of the Eucharist';

  @override
  String get liturgyOfTheEucharistAm => 'የቁርባን ሥርዓት';

  @override
  String get liturgyOfTheEucharistDesc =>
      'From the Preparation of the Gifts through the Eucharistic Prayer.';

  @override
  String get communionRiteEn => 'The Communion Rite';

  @override
  String get communionRiteAm => 'የቁርባን ተቀብሎ ሥርዓት';

  @override
  String get communionRiteDesc =>
      'From the Lord\'s Prayer through the Prayer after Communion.';

  @override
  String get concludingRitesEn => 'The Concluding Rites';

  @override
  String get concludingRitesAm => 'የመዝጋቢ ሥርዓት';

  @override
  String get concludingRitesDesc =>
      'Announcements, the final blessing, and the dismissal.';
}
