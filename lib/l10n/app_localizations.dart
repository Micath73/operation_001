import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_am.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('am'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Catholic Devotional Hub'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @bible.
  ///
  /// In en, this message translates to:
  /// **'Bible'**
  String get bible;

  /// No description provided for @mass.
  ///
  /// In en, this message translates to:
  /// **'Mass'**
  String get mass;

  /// No description provided for @journey.
  ///
  /// In en, this message translates to:
  /// **'Journey'**
  String get journey;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @dailyReflection.
  ///
  /// In en, this message translates to:
  /// **'Daily Reflection'**
  String get dailyReflection;

  /// No description provided for @theHolyGospel.
  ///
  /// In en, this message translates to:
  /// **'The Holy Gospel'**
  String get theHolyGospel;

  /// No description provided for @wordsOfSaints.
  ///
  /// In en, this message translates to:
  /// **'Words of the Saints'**
  String get wordsOfSaints;

  /// No description provided for @savedQuoteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Saved quote to favorites!'**
  String get savedQuoteSuccess;

  /// No description provided for @removedQuoteSuccess.
  ///
  /// In en, this message translates to:
  /// **'Removed quote from favorites.'**
  String get removedQuoteSuccess;

  /// No description provided for @novenaCompletedTitle.
  ///
  /// In en, this message translates to:
  /// **'Novena Completed!'**
  String get novenaCompletedTitle;

  /// No description provided for @novenaCompletedBody.
  ///
  /// In en, this message translates to:
  /// **'You have already completed the {novenaTitle}. Would you like to clear your previous progress and start a fresh cycle?'**
  String novenaCompletedBody(String novenaTitle);

  /// No description provided for @viewProgress.
  ///
  /// In en, this message translates to:
  /// **'View Progress'**
  String get viewProgress;

  /// No description provided for @restartFresh.
  ///
  /// In en, this message translates to:
  /// **'Restart Fresh'**
  String get restartFresh;

  /// No description provided for @inProgressNovenas.
  ///
  /// In en, this message translates to:
  /// **'In Progress Novenas'**
  String get inProgressNovenas;

  /// No description provided for @completedNovenas.
  ///
  /// In en, this message translates to:
  /// **'Completed Novenas'**
  String get completedNovenas;

  /// No description provided for @gospelOfTheDay.
  ///
  /// In en, this message translates to:
  /// **'Gospel Of The Day'**
  String get gospelOfTheDay;

  /// No description provided for @gospelDescription.
  ///
  /// In en, this message translates to:
  /// **'Reflect your day with this Gospel verse'**
  String get gospelDescription;

  /// No description provided for @read.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get read;

  /// No description provided for @prayerAndOurFatherTitle.
  ///
  /// In en, this message translates to:
  /// **'Prayer & The Our Father Breakdown'**
  String get prayerAndOurFatherTitle;

  /// No description provided for @ourLadyOfRosaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Lady of the Rosary (Pompeii & Lepanto)'**
  String get ourLadyOfRosaryTitle;

  /// No description provided for @catechismCategory.
  ///
  /// In en, this message translates to:
  /// **'Catechism'**
  String get catechismCategory;

  /// No description provided for @apparitionsCategory.
  ///
  /// In en, this message translates to:
  /// **'Apparitions'**
  String get apparitionsCategory;

  /// No description provided for @spiritualBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Spiritual Breakdown'**
  String get spiritualBreakdown;

  /// No description provided for @lineByLineAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Line-by-line spiritual analysis.'**
  String get lineByLineAnalysis;

  /// No description provided for @holyMass.
  ///
  /// In en, this message translates to:
  /// **'Holy Mass'**
  String get holyMass;

  /// No description provided for @dailyReadings.
  ///
  /// In en, this message translates to:
  /// **'Daily Readings'**
  String get dailyReadings;

  /// No description provided for @orderOfMass.
  ///
  /// In en, this message translates to:
  /// **'Order of Mass'**
  String get orderOfMass;

  /// No description provided for @dailyLiturgy.
  ///
  /// In en, this message translates to:
  /// **'DAILY LITURGY'**
  String get dailyLiturgy;

  /// No description provided for @todaysMassReadings.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Mass Readings'**
  String get todaysMassReadings;

  /// No description provided for @dailyLiturgyDescription.
  ///
  /// In en, this message translates to:
  /// **'Listen to the Word of the Lord for today\'s Holy Mass including Gospel, Psalm & Reflections.'**
  String get dailyLiturgyDescription;

  /// No description provided for @openFullReader.
  ///
  /// In en, this message translates to:
  /// **'Open Full Reader'**
  String get openFullReader;

  /// No description provided for @quickNavigation.
  ///
  /// In en, this message translates to:
  /// **'QUICK NAVIGATION'**
  String get quickNavigation;

  /// No description provided for @gospelReading.
  ///
  /// In en, this message translates to:
  /// **'Gospel Reading'**
  String get gospelReading;

  /// No description provided for @todaysGoodNews.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Good News'**
  String get todaysGoodNews;

  /// No description provided for @liturgicalCalendar.
  ///
  /// In en, this message translates to:
  /// **'Liturgical Calendar'**
  String get liturgicalCalendar;

  /// No description provided for @feastsAndSeasons.
  ///
  /// In en, this message translates to:
  /// **'Feasts & Seasons'**
  String get feastsAndSeasons;

  /// No description provided for @introductoryRitesEn.
  ///
  /// In en, this message translates to:
  /// **'The Introductory Rites'**
  String get introductoryRitesEn;

  /// No description provided for @introductoryRitesAm.
  ///
  /// In en, this message translates to:
  /// **'የመግቢያ ሥርዓት'**
  String get introductoryRitesAm;

  /// No description provided for @introductoryRitesDesc.
  ///
  /// In en, this message translates to:
  /// **'From the Entrance Chant through the Collect prayer.'**
  String get introductoryRitesDesc;

  /// No description provided for @liturgyOfTheWordEn.
  ///
  /// In en, this message translates to:
  /// **'The Liturgy of the Word'**
  String get liturgyOfTheWordEn;

  /// No description provided for @liturgyOfTheWordAm.
  ///
  /// In en, this message translates to:
  /// **'የቃል ሥርዓት'**
  String get liturgyOfTheWordAm;

  /// No description provided for @liturgyOfTheWordDesc.
  ///
  /// In en, this message translates to:
  /// **'From the First Reading through the Universal Prayer.'**
  String get liturgyOfTheWordDesc;

  /// No description provided for @liturgyOfTheEucharistEn.
  ///
  /// In en, this message translates to:
  /// **'The Liturgy of the Eucharist'**
  String get liturgyOfTheEucharistEn;

  /// No description provided for @liturgyOfTheEucharistAm.
  ///
  /// In en, this message translates to:
  /// **'የቁርባን ሥርዓት'**
  String get liturgyOfTheEucharistAm;

  /// No description provided for @liturgyOfTheEucharistDesc.
  ///
  /// In en, this message translates to:
  /// **'From the Preparation of the Gifts through the Eucharistic Prayer.'**
  String get liturgyOfTheEucharistDesc;

  /// No description provided for @communionRiteEn.
  ///
  /// In en, this message translates to:
  /// **'The Communion Rite'**
  String get communionRiteEn;

  /// No description provided for @communionRiteAm.
  ///
  /// In en, this message translates to:
  /// **'የቁርባን ተቀብሎ ሥርዓት'**
  String get communionRiteAm;

  /// No description provided for @communionRiteDesc.
  ///
  /// In en, this message translates to:
  /// **'From the Lord\'s Prayer through the Prayer after Communion.'**
  String get communionRiteDesc;

  /// No description provided for @concludingRitesEn.
  ///
  /// In en, this message translates to:
  /// **'The Concluding Rites'**
  String get concludingRitesEn;

  /// No description provided for @concludingRitesAm.
  ///
  /// In en, this message translates to:
  /// **'የመዝጋቢ ሥርዓት'**
  String get concludingRitesAm;

  /// No description provided for @concludingRitesDesc.
  ///
  /// In en, this message translates to:
  /// **'Announcements, the final blessing, and the dismissal.'**
  String get concludingRitesDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['am', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am':
      return AppLocalizationsAm();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
