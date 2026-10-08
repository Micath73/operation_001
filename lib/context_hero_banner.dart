import 'dart:async';

import 'package:flutter/material.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/prayer_categories.dart';

/// One time band's worth of copy + which prayers fit it.
///
/// Resolution order for the primary suggestion (see [PrayerMoment.forTime]):
///   1. Dec 31 evening          -> Te Deum (thanksgiving for the year)
///   2. [weekdayPrimary]        -> a day-of-the-week devotion, if the band has one
///   3. [primaryTitles]         -> rotated by day-of-year (bands with no fixed custom)
///   4. [libraryTag] fallback   -> anything in the library tagged for this part of the day
class _TimeBand {
  const _TimeBand({
    required this.startHour,
    required this.endHour, // exclusive
    required this.slot,
    required this.libraryTag,
    required this.greeting,
    required this.subtitle,
    required this.icon,
    required this.primaryTitles,
    this.alternateTitles = const [],
    this.weekdayPrimary = const {},
    this.weekdaySubtitle = const {},
  });

  final int startHour;
  final int endHour;
  final String slot;

  /// Which `suggestedTimes` tag in [PrayerLibrary] belongs to this band
  /// (library vocabulary: morning, midday, 3pm, evening, anytime).
  final String libraryTag;
  final String greeting;
  final String subtitle;
  final IconData icon;
  final List<String> primaryTitles;
  final List<String> alternateTitles;

  /// DateTime.weekday (1 = Monday ... 7 = Sunday) -> prayer title.
  final Map<int, String> weekdayPrimary;
  final Map<int, String> weekdaySubtitle;

  bool includes(int hour) => hour >= startHour && hour < endHour;
}

/// Bands follow the traditional rhythm of Catholic prayer:
///  - On waking: Morning Offering, then Lauds (Benedictus) at sunrise/morning
///  - Angelus at its traditional hours: 6 am, noon, 6 pm
///  - Mid-morning ("the third hour", when the Spirit came at Pentecost):
///    Come, Holy Spirit
///  - 3 pm, the Hour of Mercy: Divine Mercy Chaplet
///  - Vespers (Evening Prayer) at day's end: Magnificat
///  - Evening: the Rosary
///  - Bedtime: night prayers, examination of conscience, Act of Contrition,
///    and the Marian antiphon (Salve Regina / Hail Holy Queen)
const List<_TimeBand> _bands = [
  _TimeBand(
    startHour: 4,
    endHour: 6,
    slot: 'waking',
    libraryTag: 'morning',
    greeting: 'Good morning',
    subtitle: 'The first moments of the day belong to God',
    icon: Icons.wb_twilight,
    primaryTitles: ['The Morning Offering'],
    alternateTitles: ['The Guardian Angel Prayer', 'St. Patrick\'s Breastplate'],
  ),
  _TimeBand(
    startHour: 6,
    endHour: 7,
    slot: 'morningAngelus',
    libraryTag: 'morning',
    greeting: 'Good morning',
    subtitle: 'The Angelus: the traditional prayer at the 6 am bell',
    icon: Icons.wb_twilight,
    primaryTitles: ['Angelus'],
    alternateTitles: ['The Morning Offering', 'The Benedictus'],
  ),
  _TimeBand(
    startHour: 7,
    endHour: 9,
    slot: 'morning',
    libraryTag: 'morning',
    greeting: 'Good morning',
    subtitle: 'Begin your day rooted in Christ',
    icon: Icons.wb_sunny_outlined,
    // Benedictus is the Gospel canticle of Morning Prayer (Lauds), so it
    // belongs to every morning. Te Deum is reserved for Sundays outside Lent.
    primaryTitles: ['The Benedictus'],
    alternateTitles: [
      'The Benedictus',
      'The Morning Offering',
      'St. Patrick\'s Breastplate',
    ],
    weekdayPrimary: {7: 'Te Deum'},
    weekdaySubtitle: {7: 'Sunday: give thanks and praise with the Te Deum'},
  ),
  _TimeBand(
    startHour: 9,
    endHour: 12,
    slot: 'lateMorning',
    libraryTag: 'morning',
    greeting: 'Good morning',
    subtitle: 'Ask the Holy Spirit to guide the work of your day',
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
    subtitle: 'The Angelus: pause at noon and turn your heart to God',
    icon: Icons.wb_sunny_outlined,
    primaryTitles: ['Angelus'],
    alternateTitles: ['Litany of the Holy Name of Jesus', 'Anima Christi'],
  ),
  _TimeBand(
    startHour: 13,
    endHour: 15,
    slot: 'earlyAfternoon',
    libraryTag: 'anytime',
    greeting: 'Good afternoon',
    subtitle: 'Carry someone in mind as you pray',
    icon: Icons.wb_sunny_outlined,
    // No fixed hour of prayer here, so the day-of-the-week devotion leads:
    // Wednesday = St. Joseph, Thursday = the Eucharist, Saturday = Our Lady.
    primaryTitles: [
      'Prayer of St. Francis',
      'Prayer of Abandonment',
      'Prayer of St. Augustine',
    ],
    alternateTitles: ['Come, Holy Spirit', 'Prayer of Abandonment'],
    weekdayPrimary: {
      3: 'Prayer to Saint Joseph',
      4: 'Anima Christi',
      6: 'The Memorare',
    },
    weekdaySubtitle: {
      3: 'Wednesday is traditionally dedicated to St. Joseph',
      4: 'Thursday is traditionally a day to honor Christ in the Eucharist',
      6: 'Saturday is traditionally Our Lady\'s day',
    },
  ),
  _TimeBand(
    startHour: 15,
    endHour: 16,
    slot: 'hourOfMercy',
    libraryTag: '3pm',
    greeting: 'The Hour of Mercy',
    subtitle: 'Christ breathed his last for us at this hour',
    icon: Icons.favorite_outline,
    primaryTitles: ['Divine Mercy Chaplet'],
    alternateTitles: ['Prayer for the Hour of Mercy', 'Jesus, I Trust in You'],
  ),
  _TimeBand(
    startHour: 16,
    endHour: 18,
    slot: 'vespers',
    libraryTag: 'evening',
    greeting: 'Good evening',
    subtitle: 'Evening Prayer: give thanks as the day begins to close',
    icon: Icons.nights_stay_outlined,
    primaryTitles: ['The Magnificat'],
    alternateTitles: ['Rosary', 'Sub Tuum Praesidium'],
  ),
  _TimeBand(
    startHour: 18,
    endHour: 19,
    slot: 'eveningAngelus',
    libraryTag: 'evening',
    greeting: 'Good evening',
    subtitle: 'The Angelus: the traditional prayer at the 6 pm bell',
    icon: Icons.nights_stay_outlined,
    primaryTitles: ['Angelus'],
    alternateTitles: ['Rosary', 'The Magnificat'],
  ),
  _TimeBand(
    startHour: 19,
    endHour: 21,
    slot: 'evening',
    libraryTag: 'evening',
    greeting: 'Good evening',
    subtitle: 'A quiet Rosary to close out the day',
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
    subtitle: "Rest in God's mercy before you sleep",
    icon: Icons.dark_mode_outlined,
    primaryTitles: ['Traditional Evening Prayer'],
    alternateTitles: [
      'Act of Contrition',
      'Visit We Beseech Thee',
      'The Guardian Angel Prayer',
      'Hail Holy Queen',
    ],
  ),
  _TimeBand(
    startHour: 0,
    endHour: 4,
    slot: 'lateNight',
    libraryTag: 'evening',
    greeting: 'Good night',
    subtitle: 'Still awake? Rest in God\'s mercy before you sleep',
    icon: Icons.dark_mode_outlined,
    primaryTitles: ['Act of Contrition'],
    alternateTitles: ['Traditional Evening Prayer', 'Visit We Beseech Thee'],
  ),
];

// ---------------------------------------------------------------------------
// Church-calendar helpers (kept private; just enough for the rules above)
// ---------------------------------------------------------------------------

/// Easter Sunday (Meeus/Jones/Butcher), local midnight.
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

/// Ash Wednesday up to (not including) Easter Sunday.
bool _isLent(DateTime t) {
  final d = DateTime(t.year, t.month, t.day);
  final easter = _easterSunday(t.year);
  final ashWednesday = DateTime(easter.year, easter.month, easter.day - 46);
  return !d.isBefore(ashWednesday) && d.isBefore(easter);
}

/// Prayers with liturgical restrictions. The Te Deum is not said during Lent.
bool _isAllowed(String title, DateTime t) {
  if (title == 'Te Deum') return !_isLent(t);
  return true;
}

/// Mysteries of the Rosary by day (Rosarium Virginis Mariae, 2002).
String _mysteriesFor(DateTime t) => switch (t.weekday) {
  DateTime.monday || DateTime.saturday => 'Joyful',
  DateTime.tuesday || DateTime.friday => 'Sorrowful',
  DateTime.wednesday || DateTime.sunday => 'Glorious',
  _ => 'Luminous', // Thursday
};

NovenaCombo? _byTitle(String title) {
  for (final p in PrayerLibrary.all) {
    if (p.text.toLowerCase() == title.toLowerCase()) return p;
  }
  return null;
}

/// Describes what the hero banner should show right now: which time
/// slot we're in, the copy to display, the primary suggestion, and a
/// short list of other prayers that also fit this hour.
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

  /// Builds the current moment from wall-clock time. Pass [now]
  /// explicitly in tests/previews; defaults to device-local time.
  factory PrayerMoment.forTime([DateTime? now]) {
    final time = now ?? DateTime.now();
    final band = _bands.firstWhere(
          (b) => b.includes(time.hour),
      orElse: () => _bands.last,
    );

    NovenaCombo? primary;
    var subtitle = band.subtitle;

    // 1. New Year's Eve: the Te Deum is the Church's hymn of thanksgiving
    //    for the year just ending.
    if (time.month == 12 && time.day == 31 && time.hour >= 16) {
      primary = _byTitle('Te Deum');
      if (primary != null) {
        subtitle = 'Close the year with a hymn of thanksgiving';
      }
    }

    // 2. Day-of-the-week devotion, where the band has one.
    if (primary == null) {
      final title = band.weekdayPrimary[time.weekday];
      if (title != null && _isAllowed(title, time)) {
        primary = _byTitle(title);
        if (primary != null) {
          subtitle = band.weekdaySubtitle[time.weekday] ?? subtitle;
        }
      }
    }

    // 3. The band's own list. Bands with several equally valid primaries
    //    rotate by day-of-year so the suggestion isn't static.
    if (primary == null) {
      final titles = band.primaryTitles;
      final dayOfYear = time.difference(DateTime(time.year, 1, 1)).inDays;
      for (var i = 0; i < titles.length && primary == null; i++) {
        final title = titles[(dayOfYear + i) % titles.length];
        if (_isAllowed(title, time)) primary = _byTitle(title);
      }
    }

    // 4. Fallbacks: something tagged for this part of the day, then anything.
    primary ??= PrayerLibrary.all
        .where((p) => p.suggestedTimes.contains(band.libraryTag))
        .firstOrNull;
    primary ??= PrayerLibrary.all.firstOrNull;

    final chosen = primary;

    // Tell the user which Mysteries to pray tonight.
    if (chosen?.text == 'Rosary') {
      subtitle = '$subtitle · ${_mysteriesFor(time)} Mysteries today';
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
      greeting: band.greeting,
      subtitle: subtitle,
      suggestedPrayer: chosen,
      alternateSuggestions: alternates,
      icon: band.icon,
    );
  }
}

/// Dynamic greeting header shown above the prayer sections.
///
/// Refreshes itself at the top of each hour and when the app returns to the
/// foreground, so a banner left open doesn't keep suggesting the morning
/// prayer in the afternoon.
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
    final moment = PrayerMoment.forTime();
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
                                'Suggested for you',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onPrimary
                                      .withValues(alpha: 0.8),
                                ),
                              ),
                              Text(
                                suggestion.text,
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
                'Also fitting now',
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
                            alt.text,
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
  }
}