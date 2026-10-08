import 'package:operation_001/novena_combo.dart';

/// Central source of truth for every prayer shown on the Daily Prayer
/// screen, organized by spiritual intention rather than time of day.
class PrayerLibrary {
  // 1. ANCHORS OF THE DAY
  static const List<NovenaCombo> anchorsOfTheDay = [
    NovenaCombo(
      text: 'The Morning Offering',
      imagePath: 'assets/sunrise.jpeg',
      category: 'Anchors of the Day',
      intentions: ['Anchors of the Day'],
      suggestedTimes: ['morning'],
    ),
    NovenaCombo(
      text: 'Angelus',
      imagePath: 'assets/img_1.png',
      category: 'Anchors of the Day',
      intentions: ['Anchors of the Day'],
      suggestedTimes: ['morning', 'midday', 'evening'],
    ),
    NovenaCombo(
      text: 'The Benedictus',
      imagePath: 'assets/My Daily Journal.jpg',
      category: 'Anchors of the Day',
      intentions: ['Anchors of the Day'],
      suggestedTimes: ['morning'],
    ),
    NovenaCombo(
      text: 'Traditional Evening Prayer',
      imagePath: 'assets/img_7.png',
      category: 'Anchors of the Day',
      intentions: ['Anchors of the Day'],
      suggestedTimes: ['evening'],
    ),
    NovenaCombo(
      text: 'Te Deum',
      imagePath: 'assets/My Day I blessed.jpg',
      category: 'Anchors of the Day',
      intentions: ['Anchors of the Day'],
      suggestedTimes: ['morning'],
    ),
  ];

  // 2. PROTECTION & SPIRITUAL WARFARE
  static const List<NovenaCombo> protectionWarfare = [
    NovenaCombo(
      text: 'Prayer to St. Michael the Archangel',
      imagePath: 'assets/img_13.png',
      category: 'Protection & Spiritual Warfare',
      intentions: ['Protection & Spiritual Warfare'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'The Guardian Angel Prayer',
      imagePath: 'assets/guardian.jpg',
      category: 'Protection & Spiritual Warfare',
      intentions: ['Protection & Spiritual Warfare'],
      suggestedTimes: ['morning', 'evening'],
    ),
    NovenaCombo(
      text: 'Litany of the Holy Name of Jesus',
      imagePath: 'assets/img_16.png',
      category: 'Protection & Spiritual Warfare',
      intentions: ['Protection & Spiritual Warfare'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'St. Patrick\'s Breastplate',
      imagePath: 'assets/saint patrick.jpg',
      category: 'Protection & Spiritual Warfare',
      intentions: ['Protection & Spiritual Warfare'],
      suggestedTimes: ['morning', 'anytime'],
    ),
    NovenaCombo(
      text: 'Visit We Beseech Thee',
      imagePath: 'assets/img_10.png',
      category: 'Protection & Spiritual Warfare',
      intentions: ['Protection & Spiritual Warfare'],
      suggestedTimes: ['evening'],
    ),
  ];

  // 3. REPENTANCE & MERCY
  static const List<NovenaCombo> repentanceMercy = [
    NovenaCombo(
      text: 'Act of Contrition',
      imagePath: 'assets/img_2.png',
      category: 'Repentance & Mercy',
      intentions: ['Repentance & Mercy'],
      suggestedTimes: ['evening', 'anytime'],
    ),
    NovenaCombo(
      text: 'Divine Mercy Chaplet',
      imagePath: 'assets/img_3.png',
      category: 'Repentance & Mercy',
      intentions: ['Repentance & Mercy'],
      suggestedTimes: ['midday', '3pm'],
    ),
    NovenaCombo(
      text: 'Prayer for the Hour of Mercy',
      imagePath: 'assets/img_5.png',
      category: 'Repentance & Mercy',
      intentions: ['Repentance & Mercy'],
      suggestedTimes: ['3pm'],
    ),
    NovenaCombo(
      text: 'Anima Christi',
      imagePath: 'assets/anima christi vip.jpg',
      category: 'Repentance & Mercy',
      intentions: ['Repentance & Mercy'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Psalm 51 (Miserere)',
      imagePath: 'assets/Holy Mass.jpg',
      category: 'Repentance & Mercy',
      intentions: ['Repentance & Mercy'],
      suggestedTimes: ['morning', 'evening'],
    ),
  ];

  // 4. MARIAN DEVOTIONS
  static const List<NovenaCombo> marianDevotions = [
    NovenaCombo(
      text: 'Rosary',
      imagePath: 'assets/img_6.png',
      category: 'Marian Devotions',
      intentions: ['Marian Devotions'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'The Magnificat',
      imagePath: 'assets/img_8.png',
      category: 'Marian Devotions',
      intentions: ['Marian Devotions'],
      suggestedTimes: ['evening'],
    ),
    NovenaCombo(
      text: 'The Memorare',
      imagePath: 'assets/img_11.png',
      category: 'Marian Devotions',
      intentions: ['Marian Devotions'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Hail Holy Queen',
      imagePath: 'assets/img_18.png',
      category: 'Marian Devotions',
      intentions: ['Marian Devotions'],
      suggestedTimes: ['evening'],
    ),
    NovenaCombo(
      text: 'Sub Tuum Praesidium',
      imagePath: 'assets/Mary.jpg',
      category: 'Marian Devotions',
      intentions: ['Marian Devotions'],
      suggestedTimes: ['anytime'],
    ),
  ];

  // 5. INTERCESSION & FOR OTHERS
  static const List<NovenaCombo> intercessionOthers = [
    NovenaCombo(
      text: 'Prayer to Saint Joseph',
      imagePath: 'assets/img_12.png',
      category: 'Intercession & For Others',
      intentions: ['Intercession & For Others'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'The Litany of Saints',
      imagePath: 'assets/img_15.png',
      category: 'Intercession & For Others',
      intentions: ['Intercession & For Others'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Prayer of St. Francis',
      imagePath: 'assets/francis.jpg',
      category: 'Intercession & For Others',
      intentions: ['Intercession & For Others'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Prayer for the Holy Father',
      imagePath: 'assets/Leo.jpg',
      category: 'Intercession & For Others',
      intentions: ['Intercession & For Others'],
      suggestedTimes: ['morning'],
    ),
    NovenaCombo(
      text: 'Prayer for Families',
      imagePath: 'assets/holy family.jpg',
      category: 'Intercession & For Others',
      intentions: ['Intercession & For Others'],
      suggestedTimes: ['evening'],
    ),
  ];

  // 6. QUICK PRAYERS, ANYTIME
  static const List<NovenaCombo> quickPrayersAnytime = [
    NovenaCombo(
      text: 'Come, Holy Spirit',
      imagePath: 'assets/img_17.png',
      category: 'Quick Prayers, Anytime',
      intentions: ['Quick Prayers, Anytime'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Prayer of Abandonment',
      imagePath: 'assets/father.jpg',
      category: 'Quick Prayers, Anytime',
      intentions: ['Quick Prayers, Anytime'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Prayer of St. Augustine',
      imagePath: 'assets/img_9.png',
      category: 'Quick Prayers, Anytime',
      intentions: ['Quick Prayers, Anytime'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Glory Be',
      imagePath: 'assets/HT.jpg',
      category: 'Quick Prayers, Anytime',
      intentions: ['Quick Prayers, Anytime'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Jesus, I Trust in You',
      imagePath: 'assets/img_3.png',
      category: 'Quick Prayers, Anytime',
      intentions: ['Quick Prayers, Anytime'],
      suggestedTimes: ['anytime'],
    ),
  ];

  /// Fixed list references to match variable declarations
  static const List<MapEntry<String, List<NovenaCombo>>> sections = [
    MapEntry('Anchors of the Day', anchorsOfTheDay),
    MapEntry('Protection & Spiritual Warfare', protectionWarfare),
    MapEntry('Repentance & Mercy', repentanceMercy),
    MapEntry('Marian Devotions', marianDevotions),
    MapEntry('Intercession & For Others', intercessionOthers),
    MapEntry('Quick Prayers, Anytime', quickPrayersAnytime),
  ];

  static List<NovenaCombo> get all => [
    ...anchorsOfTheDay,
    ...protectionWarfare,
    ...repentanceMercy,
    ...marianDevotions,
    ...intercessionOthers,
    ...quickPrayersAnytime,
  ];
}