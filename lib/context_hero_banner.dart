import 'dart:async';

import 'package:flutter/material.dart';
import 'package:operation_001/controllers/language_controller.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/prayer_categories.dart';
import 'package:operation_001/prayer_data.dart';

/// One time band's worth of copy + which prayers fit it.
class _TimeBand {
  const _TimeBand({
    required this.startHour,
    required this.endHour, // exclusive
    required this.slot,
    required this.libraryTag,
    required this.greeting,
    required this.greetingAm,
    required this.subtitle,
    required this.subtitleAm,
    required this.icon,
    required this.primaryTitles,
    this.alternateTitles = const [],
    this.weekdayPrimary = const {},
    this.weekdaySubtitle = const {},
    this.weekdaySubtitleAm = const {},
  });

  final int startHour;
  final int endHour;
  final String slot;

  /// Which `suggestedTimes` tag in [PrayerLibrary] belongs to this band
  final String libraryTag;
  final String greeting;
  final String greetingAm;
  final String subtitle;
  final String subtitleAm;
  final IconData icon;
  final List<String> primaryTitles;
  final List<String> alternateTitles;

  /// DateTime.weekday (1 = Monday ... 7 = Sunday) -> prayer title.
  final Map<int, String> weekdayPrimary;
  final Map<int, String> weekdaySubtitle;
  final Map<int, String> weekdaySubtitleAm;

  bool includes(int hour) => hour >= startHour && hour < endHour;

  String getGreeting(bool isAmharic) => isAmharic ? greetingAm : greeting;
  String getSubtitle(bool isAmharic, int weekday) {
    if (isAmharic) {
      return weekdaySubtitleAm[weekday] ?? subtitleAm;
    }
    return weekdaySubtitle[weekday] ?? subtitle;
  }
}

/// Time bands aligned strictly with masterPrayerDB keys and traditional Catholic hours
const List<_TimeBand> _bands = [
  _TimeBand(
    startHour: 4,
    endHour: 6,
    slot: 'waking',
    libraryTag: 'morning',
    greeting: 'Good morning',
    greetingAm: 'እንደምን አደሩ',
    subtitle: 'The first moments of the day belong to God',
    subtitleAm: 'የቀኑ የመጀመሪያ ሰዓታት ለእግዚአብሔር የተሰጡ ናቸው',
    icon: Icons.wb_twilight,
    primaryTitles: ['The Morning Offering'],
    alternateTitles: ['The Guardian Angel Prayer', 'St. Patrick\'s Breastplate'],
  ),
  _TimeBand(
    startHour: 6,
    endHour: 7,
    slot: 'earlyMorning',
    libraryTag: 'morning',
    greeting: 'Good morning',
    greetingAm: 'እንደምን አደሩ',
    subtitle: 'Begin your morning wrapped in divine protection',
    subtitleAm: 'ጥዋትዎን በመለኮታዊ ጥበቃ ይጀምሩ',
    icon: Icons.wb_twilight,
    primaryTitles: ['The Guardian Angel Prayer'],
    alternateTitles: ['The Morning Offering', 'St. Patrick\'s Breastplate'],
  ),
  _TimeBand(
    startHour: 7,
    endHour: 9,
    slot: 'morning',
    libraryTag: 'morning',
    greeting: 'Good morning',
    greetingAm: 'እንደምን አደሩ',
    subtitle: 'Begin your day rooted in Christ with morning praise',
    subtitleAm: 'በጠዋት ምስጋና ቀንዎን በክርስቶስ መሠረት ይጀምሩ',
    icon: Icons.wb_sunny_outlined,
    primaryTitles: ['The Benedictus'],
    alternateTitles: [
      'The Morning Offering',
      'St. Patrick\'s Breastplate',
      'Apostles\' Creed',
    ],
    weekdayPrimary: {7: 'Te Deum'},
    weekdaySubtitle: {7: 'Sunday: give thanks and praise with the Te Deum'},
    weekdaySubtitleAm: {7: 'እሑድ፦ በቴ ደም መዝሙር ምስጋናና ውዳሴ አቅርቡ'},
  ),
  _TimeBand(
    startHour: 9,
    endHour: 12,
    slot: 'lateMorning',
    libraryTag: 'morning',
    greeting: 'Good morning',
    greetingAm: 'እንደምን አደሩ',
    subtitle: 'Ask the Holy Spirit to guide the work of your day',
    subtitleAm: 'መንፈስ ቅዱስ የዕለት ሥራዎን እንዲመራዎት ይጠይቁ',
    icon: Icons.wb_sunny_outlined,
    primaryTitles: ['Come, Holy Spirit'],
    alternateTitles: ['Prayer for the Holy Father', 'Psalm 51 (Miserere)'],
  ),
  _TimeBand(
    startHour: 12,
    endHour: 13,
    slot: 'noon',
    libraryTag: 'midday',
    greeting: 'Good afternoon',
    greetingAm: 'እንደምን ዋሉ',
    subtitle: 'Midday communion and reflection in Christ',
    subtitleAm: 'በእኩለ ቀን ከክርስቶስ ጋር መተባበርና ማሰላሰል',
    icon: Icons.wb_sunny_outlined,
    primaryTitles: ['Prayer Before Holy Communion'],
    alternateTitles: ['Litany of the Holy Name of Jesus', 'Anima Christi'],
  ),
  _TimeBand(
    startHour: 13,
    endHour: 15,
    slot: 'earlyAfternoon',
    libraryTag: 'anytime',
    greeting: 'Good afternoon',
    greetingAm: 'እንደምን ዋሉ',
    subtitle: 'Offer your daily labor and surrender to God',
    subtitleAm: 'የዕለት ሥራዎን አቅርበው ራስዎን ለእግዚአብሔር አሳልፈው ይስጡ',
    icon: Icons.wb_sunny_outlined,
    primaryTitles: [
      'Prayer of St. Francis',
      'Prayer of Abandonment',
      'Prayer of St. Augustine',
    ],
    alternateTitles: ['Come, Holy Spirit', 'Prayer Before Work'],
    weekdayPrimary: {
      3: 'Prayer to St. Joseph',
      4: 'Anima Christi',
      6: 'The Memorare',
    },
    weekdaySubtitle: {
      3: 'Wednesday is traditionally dedicated to St. Joseph',
      4: 'Thursday is traditionally a day to honor Christ in the Eucharist',
      6: 'Saturday is traditionally Our Lady\'s day',
    },
    weekdaySubtitleAm: {
      3: 'ዕሮብ ለቅዱስ ዮሴፍ የተሰጠ ቀን ነው',
      4: 'ሐሙስ በቅዱስ ቁርባን ክርስቶስን የምናከብርበት ቀን ነው',
      6: 'ቅዳሜ የእመቤታችን የቅድስት ማርያም ቀን ነው',
    },
  ),
  _TimeBand(
    startHour: 15,
    endHour: 16,
    slot: 'hourOfMercy',
    libraryTag: '3pm',
    greeting: 'The Hour of Mercy',
    greetingAm: 'የምሕረት ሰዓት',
    subtitle: 'Christ breathed His last for us at this hour',
    subtitleAm: 'ክርስቶስ በዚህ ሰዓት ለኛ ሲል ሕይወቱን ሰጠ',
    icon: Icons.favorite_outline,
    primaryTitles: ['Prayer for the Hour of Mercy'],
    alternateTitles: ['Act of Contrition', 'Psalm 51 (Miserere)'],
  ),
  _TimeBand(
    startHour: 16,
    endHour: 18,
    slot: 'vespers',
    libraryTag: 'evening',
    greeting: 'Good evening',
    greetingAm: 'እንደምን አመሹ',
    subtitle: 'Evening Prayer: give thanks as the day begins to close',
    subtitleAm: 'የማታ ጸሎት፦ ቀኑ ሲጠናቀቅ ምስጋና ያቅርቡ',
    icon: Icons.nights_stay_outlined,
    primaryTitles: ['The Magnificat'],
    alternateTitles: ['Sub Tuum Praesidium', 'Hail Holy Queen'],
  ),
  _TimeBand(
    startHour: 18,
    endHour: 21,
    slot: 'evening',
    libraryTag: 'evening',
    greeting: 'Good evening',
    greetingAm: 'እንደምን አመሹ',
    subtitle: 'A quiet Rosary to close out the day',
    subtitleAm: 'ቀኑን ለማጠናቀቅ ጸጥ ያለ የመቁጠሪያ ጸሎት',
    icon: Icons.nights_stay_outlined,
    primaryTitles: ['Rosary'],
    alternateTitles: ['Hail Holy Queen', 'The Memorare', 'Prayer for Families'],
  ),
  _TimeBand(
    startHour: 21,
    endHour: 24,
    slot: 'night',
    libraryTag: 'evening',
    greeting: 'Good night',
    greetingAm: 'ደህና እደሩ',
    subtitle: "Rest in God's mercy and evening prayer before you sleep",
    subtitleAm: 'ከመተኛትዎ በፊት በማታ ጸሎት በእግዚአብሔር ምሕረት ያርፉ',
    icon: Icons.dark_mode_outlined,
    primaryTitles: ['Traditional Evening Prayer'],
    alternateTitles: [
      'Act of Contrition',
      'Visit We Beseech Thee',
      'Short Night Prayer or Evening Examen',
      'The Guardian Angel Prayer',
    ],
  ),
  _TimeBand(
    startHour: 0,
    endHour: 4,
    slot: 'lateNight',
    libraryTag: 'evening',
    greeting: 'Good night',
    greetingAm: 'ደህና እደሩ',
    subtitle: 'Still awake? Rest in God\'s mercy with an act of contrition',
    subtitleAm: 'አሁንም ነቅተዋል? በንስሐ ጸሎት በእግዚአብሔር ምሕረት ያርፉ',
    icon: Icons.dark_mode_outlined,
    primaryTitles: ['Act of Contrition'],
    alternateTitles: ['Traditional Evening Prayer', 'Visit We Beseech Thee'],
  ),
];

DateTime _easterSunday(int year) {
  final a = year % 19;
  final b = year ~/ 100;
  final c = year % 100;
  final d = b ~/ 4;
  final e = b % 4;
  final f = (b + 8) ~/ 25;
  final g = (b - f + 1) ~/ 3;
  final h = (19 * a + b - d - g + 15) % 30;
  final i = c ~/ 4;
  final k = c % 4;
  final l = (32 + 2 * e + 2 * i - h - k) % 7;
  final m = (a + 11 * h + 22 * l) ~/ 451;
  final month = (h + l - 7 * m + 114) ~/ 31;
  final day = ((h + l - 7 * m + 114) % 31) + 1;
  return DateTime(year, month, day);
}

bool _isLent(DateTime t) {
  final d = DateTime(t.year, t.month, t.day);
  final easter = _easterSunday(t.year);
  final ashWednesday = DateTime(easter.year, easter.month, easter.day - 46);
  return !d.isBefore(ashWednesday) && d.isBefore(easter);
}

bool _isAllowed(String title, DateTime t) {
  if (title == 'Te Deum') return !_isLent(t);
  return true;
}

String _mysteriesFor(DateTime t, bool isAmharic) {
  final m = switch (t.weekday) {
    DateTime.monday || DateTime.saturday => isAmharic ? 'የደስታ' : 'Joyful',
    DateTime.tuesday || DateTime.friday => isAmharic ? 'የሐዘን' : 'Sorrowful',
    DateTime.wednesday || DateTime.sunday => isAmharic ? 'የክብር' : 'Glorious',
    _ => isAmharic ? 'የብርሃን' : 'Luminous',
  };
  return isAmharic ? '$m ምስጢራት' : '$m Mysteries';
}

NovenaCombo? _byTitle(String title) {
  for (final p in PrayerLibrary.all) {
    if (p.text.toLowerCase() == title.toLowerCase()) return p;
  }
  return null;
}

class PrayerMoment {
  final String timeSlot;
  final String greeting;
  final String subtitle;
  final NovenaCombo? suggestedPrayer;
  final List<NovenaCombo> alternateSuggestions;
  final IconData icon;

  const PrayerMoment({
    required this.timeSlot,
    required this.greeting,
    required this.subtitle,
    required this.suggestedPrayer,
    required this.alternateSuggestions,
    required this.icon,
  });

  factory PrayerMoment.forTime({DateTime? now, bool isAmharic = false}) {
    final time = now ?? DateTime.now();
    final band = _bands.firstWhere(
          (b) => b.includes(time.hour),
      orElse: () => _bands.last,
    );

    NovenaCombo? primary;
    var subtitle = band.getSubtitle(isAmharic, time.weekday);

    if (time.month == 12 && time.day == 31 && time.hour >= 16) {
      primary = _byTitle('Te Deum');
      if (primary != null) {
        subtitle = isAmharic
            ? 'አመቱን በምስጋና መዝሙር ደምድሙ'
            : 'Close the year with a hymn of thanksgiving';
      }
    }

    if (primary == null) {
      final title = band.weekdayPrimary[time.weekday];
      if (title != null && _isAllowed(title, time)) {
        primary = _byTitle(title);
        if (primary != null) {
          subtitle = band.getSubtitle(isAmharic, time.weekday);
        }
      }
    }

    if (primary == null) {
      final titles = band.primaryTitles;
      final dayOfYear = time.difference(DateTime(time.year, 1, 1)).inDays;
      for (var i = 0; i < titles.length && primary == null; i++) {
        final title = titles[(dayOfYear + i) % titles.length];
        if (_isAllowed(title, time)) primary = _byTitle(title);
      }
    }

    primary ??= PrayerLibrary.all
        .where((p) => p.suggestedTimes.contains(band.libraryTag))
        .firstOrNull;
    primary ??= PrayerLibrary.all.firstOrNull;

    final chosen = primary;

    if (chosen?.text == 'Rosary') {
      subtitle = '$subtitle · ${_mysteriesFor(time, isAmharic)}';
    }

    final alternates = band.alternateTitles
        .where((t) => _isAllowed(t, time))
        .map(_byTitle)
        .whereType<NovenaCombo>()
        .where((p) => p.text != chosen?.text)
        .take(3)
        .toList();

    return PrayerMoment(
      timeSlot: band.slot,
      greeting: band.getGreeting(isAmharic),
      subtitle: subtitle,
      suggestedPrayer: chosen,
      alternateSuggestions: alternates,
      icon: band.icon,
    );
  }
}

class ContextHeroBanner extends StatefulWidget {
  final void Function(NovenaCombo prayer) onSuggestionTap;

  const ContextHeroBanner({super.key, required this.onSuggestionTap});

  @override
  State<ContextHeroBanner> createState() => _ContextHeroBannerState();
}

class _ContextHeroBannerState extends State<ContextHeroBanner>
    with WidgetsBindingObserver {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scheduleRefresh();
  }

  void _scheduleRefresh() {
    _timer?.cancel();
    final now = DateTime.now();
    final nextHour = DateTime(now.year, now.month, now.day, now.hour + 1);
    _timer = Timer(
      nextHour.difference(now) + const Duration(seconds: 1),
          () {
        if (!mounted) return;
        setState(() {});
        _scheduleRefresh();
      },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && mounted) {
      setState(() {});
      _scheduleRefresh();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListenableBuilder(
      listenable: LanguageController.instance,
      builder: (context, child) {
        final isAmharic = LanguageController.instance.isAmharic;
        final langCode = isAmharic ? 'am' : 'en';
        final moment = PrayerMoment.forTime(isAmharic: isAmharic);
        final suggestion = moment.suggestedPrayer;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.primary,
                  theme.colorScheme.primary.withValues(alpha: 0.75),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(moment.icon, color: theme.colorScheme.onPrimary),
                    const SizedBox(width: 8),
                    Text(
                      moment.greeting,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  moment.subtitle,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.9),
                  ),
                ),
                if (suggestion != null) ...[
                  const SizedBox(height: 16),
                  Material(
                    color: theme.colorScheme.onPrimary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () => widget.onSuggestionTap(suggestion),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isAmharic ? 'ለእርስዎ የቀረበ' : 'Suggested for you',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: theme.colorScheme.onPrimary
                                          .withValues(alpha: 0.8),
                                    ),
                                  ),
                                  Text(
                                    PrayerData.getMainTitle(suggestion.text, langCode),
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      color: theme.colorScheme.onPrimary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                if (moment.alternateSuggestions.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    isAmharic ? 'አሁን ሊጸለዩ የሚችሉ' : 'Also fitting now',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onPrimary.withValues(alpha: 0.75),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final alt in moment.alternateSuggestions)
                        Material(
                          color:
                          theme.colorScheme.onPrimary.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(999),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(999),
                            onTap: () => widget.onSuggestionTap(alt),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 7,
                              ),
                              child: Text(
                                PrayerData.getMainTitle(alt.text, langCode),
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}