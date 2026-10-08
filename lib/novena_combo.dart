/// Represents a single prayer/devotion entry.
///
/// [category] is kept as a legacy/liturgical label for backward
/// compatibility. [intentions] drives the new context-aware grouping
/// shown on the Daily Prayer screen — a prayer can belong to more than
/// one intention. [suggestedTimes] powers the dynamic hero banner and
/// does NOT restrict where the prayer is displayed; it only affects
/// which prayer gets suggested at a given hour.
class NovenaCombo {
  final String text;
  final String imagePath;
  final String category;
  final String? webUrl;
  final bool isOnline;
  final List<String> tags;
  final String? jsonAsset; // Pointer to the local lesson JSON asset

  /// e.g. 'Protection & Spiritual Warfare', 'Marian Devotions',
  /// 'Repentance & Mercy'. Defaults to 'Anytime'.
  final List<String> intentions;

  /// Any of: 'morning', 'midday', 'evening', 'night', 'anytime'.
  /// Used only by [PrayerMoment.forTime] to pick a hero-banner
  /// suggestion — does not gate visibility elsewhere.
  final List<String> suggestedTimes;

  const NovenaCombo({
    required this.text,
    required this.imagePath,
    required this.category,
    this.webUrl,
    this.isOnline = false,
    this.tags = const [],
    this.jsonAsset,
    this.intentions = const ['Anytime'],
    this.suggestedTimes = const ['anytime'],
  });
}