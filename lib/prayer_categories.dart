import 'package:operation_001/novena_combo.dart';

/// Central source of truth for every prayer shown on the Daily Prayer
/// screen, organized by spiritual intention and tailored for Ethiopian heritage.
class PrayerLibrary {
  // 1. EVERYDAY ESSENTIALS
  static const List<NovenaCombo> everydayEssentials = [
    NovenaCombo(
      text: 'Basic Prayers (Sign of the Cross, Our Father, Hail Mary, Glory Be)',
      imagePath: 'assets/sunrise.jpeg', // Replace with your asset
      category: 'Everyday Essentials',
      intentions: ['Everyday Essentials'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Apostles\' Creed',
      imagePath: 'assets/ethiopian/apostles creed.jpg',
      category: 'Everyday Essentials',
      intentions: ['Everyday Essentials'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Grace Before & After Meals',
      imagePath: 'assets/ethiopian/grace meal.jpg',
      category: 'Everyday Essentials',
      intentions: ['Everyday Essentials'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Acts of Faith, Hope & Charity',
      imagePath: 'assets/ethiopian/acts of faith.jpg',
      category: 'Everyday Essentials',
      intentions: ['Everyday Essentials'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Short Aspirations',
      imagePath: 'assets/ethiopian/short apirations.jpg',
      category: 'Everyday Essentials',
      intentions: ['Everyday Essentials'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Come, Holy Spirit',
      imagePath: 'assets/img_17.png',
      category: 'Everyday Essentials',
      intentions: ['Everyday Essentials'],
      suggestedTimes: ['anytime'],
    ),
  ];

  // 2. ANCHORS OF THE DAY
  static const List<NovenaCombo> anchorsOfTheDay = [
    NovenaCombo(
      text: 'The Morning Offering',
      imagePath: 'assets/ethiopian/morning offering.jpg',
      category: 'Anchors of the Day',
      intentions: ['Anchors of the Day'],
      suggestedTimes: ['morning'],
    ),
    NovenaCombo(
      text: 'Prayer Before Work',
      imagePath: 'assets/ethiopian/prayer before work.jpg',
      category: 'Anchors of the Day',
      intentions: ['Anchors of the Day'],
      suggestedTimes: ['morning'],
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
      text: 'Visit We Beseech Thee',
      imagePath: 'assets/img_10.png',
      category: 'Anchors of the Day',
      intentions: ['Anchors of the Day'],
      suggestedTimes: ['evening'],
    ),
    NovenaCombo(
      text: 'Short Night Prayer or Evening Examen',
      imagePath: 'assets/ethiopian/night prayer.jpg',
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

  // 3. PROTECTION & SPIRITUAL WARFARE
  static const List<NovenaCombo> protectionWarfare = [
    NovenaCombo(
      text: 'Prayer to St. Michael the Archangel',
      imagePath: 'assets/ethiopian/arch angel michael.jpg',
      category: 'Protection & Spiritual Warfare',
      intentions: ['Protection & Spiritual Warfare'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'The Guardian Angel Prayer',
      imagePath: 'assets/ethiopian/guardian angel.jpeg',
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
  ];

  // 4. REPENTANCE & MERCY
  static const List<NovenaCombo> repentanceMercy = [
    NovenaCombo(
      text: 'Act of Contrition',
      imagePath: 'assets/img_2.png',
      category: 'Repentance & Mercy',
      intentions: ['Repentance & Mercy'],
      suggestedTimes: ['evening', 'anytime'],
    ),
    NovenaCombo(
      text: 'Prayer for the Hour of Mercy',
      imagePath: 'assets/img_5.png',
      category: 'Repentance & Mercy',
      intentions: ['Repentance & Mercy'],
      suggestedTimes: ['3pm'],
    ),
    NovenaCombo(
      text: 'Psalm 51 (Miserere)',
      imagePath: 'assets/ethiopian/psalm 51.jpg',
      category: 'Repentance & Mercy',
      intentions: ['Repentance & Mercy'],
      suggestedTimes: ['morning', 'evening'],
    ),
  ];

  // 5. EUCHARISTIC
  static const List<NovenaCombo> eucharistic = [
    NovenaCombo(
      text: 'Anima Christi',
      imagePath: 'assets/anima christi vip.jpg',
      category: 'Eucharistic',
      intentions: ['Eucharistic'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Prayer Before Holy Communion',
      imagePath: 'assets/ethiopian/spiritual communion.jpg',
      category: 'Eucharistic',
      intentions: ['Eucharistic'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Blessing of the Holy Communion (St. Thomas)',
      imagePath: 'assets/Anima Christi.jpg',
      category: 'Eucharistic',
      intentions: ['Eucharistic'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Prayer After Receiving Holy Communion',
      imagePath: 'assets/ethiopian/o sacrament most holy.jpg',
      category: 'Eucharistic',
      intentions: ['Eucharistic'],
      suggestedTimes: ['anytime'],
    ),
  ];

  // 6. MARIAN DEVOTIONS
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
      imagePath: 'assets/ethiopian/memorare.jpg',
      category: 'Marian Devotions',
      intentions: ['Marian Devotions'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Hail Holy Queen',
      imagePath: 'assets/ethiopian/hail holy queen.jpg',
      category: 'Marian Devotions',
      intentions: ['Marian Devotions'],
      suggestedTimes: ['evening'],
    ),
    NovenaCombo(
      text: 'Regina Caeli',
      imagePath: 'assets/ethiopian/regina caeli.jpg',
      category: 'Marian Devotions',
      intentions: ['Marian Devotions'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Sub Tuum Praesidium',
      imagePath: 'assets/Mary.jpg',
      category: 'Marian Devotions',
      intentions: ['Marian Devotions'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Prayer of Purity',
      imagePath: 'assets/img_11.png',
      category: 'Marian Devotions',
      intentions: ['Marian Devotions'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Litany of Our Lady',
      imagePath: 'assets/img.png',
      category: 'Marian Devotions',
      intentions: ['Marian Devotions'],
      suggestedTimes: ['anytime'],
    ),
  ];

  // 7. INTERCESSION & FOR OTHERS
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
    NovenaCombo(
      text: 'Eternal Rest (Prayer for the Dead)',
      imagePath: 'assets/ethiopian/death.jpg',
      category: 'Intercession & For Others',
      intentions: ['Intercession & For Others'],
      suggestedTimes: ['anytime'],
    ),
  ];

  // 8. SPIRITUAL REFLECTION & SURRENDER
  static const List<NovenaCombo> spiritualReflection = [
    NovenaCombo(
      text: 'Prayer to Holy Trinity',
      imagePath: 'assets/ethiopian/kidist silase.jpg',
      category: 'Spiritual Reflection & Surrender',
      intentions: ['Spiritual Reflection & Surrender'],
      suggestedTimes: ['anytime'],
    ),
    NovenaCombo(
      text: 'Prayer of St. Augustine',
      imagePath: 'assets/img_9.png',
      category: 'Spiritual Reflection & Surrender',
      intentions: ['Spiritual Reflection & Surrender'],
      suggestedTimes: ['anytime'],
    ),
  ];

  /// Mapping sections to display in UI
  static const List<MapEntry<String, List<NovenaCombo>>> sections = [
    MapEntry('Everyday Essentials', everydayEssentials),
    MapEntry('Anchors of the Day', anchorsOfTheDay),
    MapEntry('Protection & Spiritual Warfare', protectionWarfare),
    MapEntry('Repentance & Mercy', repentanceMercy),
    MapEntry('Eucharistic', eucharistic),
    MapEntry('Marian Devotions', marianDevotions),
    MapEntry('Intercession & For Others', intercessionOthers),
    MapEntry('Spiritual Reflection & Surrender', spiritualReflection),
  ];

  static List<NovenaCombo> get all => [
    ...everydayEssentials,
    ...anchorsOfTheDay,
    ...protectionWarfare,
    ...repentanceMercy,
    ...eucharistic,
    ...marianDevotions,
    ...intercessionOthers,
    ...spiritualReflection,
  ];
}