class PrayerStep {
  final String? sectionHeader;
  final String? sectionHeaderAm;
  final String titleEn;
  final String titleAm;
  final String contentEn;
  final String contentAm;
  final String imagePath;

  PrayerStep({
    this.sectionHeader,
    this.sectionHeaderAm,
    required this.titleEn,
    required this.titleAm,
    required this.contentEn,
    required this.contentAm,
    required this.imagePath,
  });

  /// Helper to pick section header based on language code ('am' vs 'en')
  String? getSectionHeader(String langCode) {
    if (langCode == 'am') {
      return sectionHeaderAm ?? sectionHeader;
    }
    return sectionHeader;
  }

  /// Helper to pick title based on language code ('am' vs 'en')
  String getTitle(String langCode) {
    return langCode == 'am' ? titleAm : titleEn;
  }

  /// Helper to pick content based on language code ('am' vs 'en')
  String getContent(String langCode) {
    return langCode == 'am' ? contentAm : contentEn;
  }
}