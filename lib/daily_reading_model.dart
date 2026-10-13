class DailyReading {
  final String id;
  final String date;
  final String liturgicalTitle;
  final String liturgicalColor;
  final String firstReadingTitle;
  final String firstReadingText;
  final String psalmResponse;
  final String psalmText;
  final String? secondReadingTitle;
  final String? secondReadingText;
  final String? gospelAcclamation;
  final String gospelTitle;
  final String gospelText;

  // Optional Amharic translations
  final String? liturgicalTitleAm;
  final String? firstReadingTitleAm;
  final String? firstReadingTextAm;
  final String? psalmResponseAm;
  final String? psalmTextAm;
  final String? secondReadingTitleAm;
  final String? secondReadingTextAm;
  final String? gospelAcclamationAm;
  final String? gospelTitleAm;
  final String? gospelTextAm;

  DailyReading({
    required this.id,
    required this.date,
    required this.liturgicalTitle,
    required this.liturgicalColor,
    required this.firstReadingTitle,
    required String firstReadingText,
    required this.psalmResponse,
    required String psalmText,
    this.secondReadingTitle,
    String? secondReadingText,
    String? gospelAcclamation,
    required this.gospelTitle,
    required String gospelText,
    this.liturgicalTitleAm,
    this.firstReadingTitleAm,
    String? firstReadingTextAm,
    this.psalmResponseAm,
    String? psalmTextAm,
    this.secondReadingTitleAm,
    String? secondReadingTextAm,
    String? gospelAcclamationAm,
    this.gospelTitleAm,
    String? gospelTextAm,
  })  : firstReadingText = _cleanText(firstReadingText),
        firstReadingTextAm = firstReadingTextAm != null ? _cleanText(firstReadingTextAm) : null,
        psalmText = _cleanText(psalmText),
        psalmTextAm = psalmTextAm != null ? _cleanText(psalmTextAm) : null,
        secondReadingText = secondReadingText != null ? _cleanText(secondReadingText) : null,
        secondReadingTextAm = secondReadingTextAm != null ? _cleanText(secondReadingTextAm) : null,
        gospelAcclamation = gospelAcclamation != null ? _cleanText(gospelAcclamation) : null,
        gospelAcclamationAm = gospelAcclamationAm != null ? _cleanText(gospelAcclamationAm) : null,
        gospelText = _cleanText(gospelText),
        gospelTextAm = gospelTextAm != null ? _cleanText(gospelTextAm) : null;

  // Bilingual Getter Helpers (ready for when you hook up the Amharic text)
  String getLiturgicalTitle(String langCode) =>
      (langCode == 'am' && liturgicalTitleAm != null && liturgicalTitleAm!.isNotEmpty) ? liturgicalTitleAm! : liturgicalTitle;

  String getFirstReadingTitle(String langCode) =>
      (langCode == 'am' && firstReadingTitleAm != null && firstReadingTitleAm!.isNotEmpty) ? firstReadingTitleAm! : firstReadingTitle;

  String getFirstReadingText(String langCode) =>
      (langCode == 'am' && firstReadingTextAm != null && firstReadingTextAm!.isNotEmpty) ? firstReadingTextAm! : firstReadingText;

  String getPsalmResponse(String langCode) =>
      (langCode == 'am' && psalmResponseAm != null && psalmResponseAm!.isNotEmpty) ? psalmResponseAm! : psalmResponse;

  String getPsalmText(String langCode) =>
      (langCode == 'am' && psalmTextAm != null && psalmTextAm!.isNotEmpty) ? psalmTextAm! : psalmText;

  String? getSecondReadingTitle(String langCode) =>
      (langCode == 'am' && secondReadingTitleAm != null && secondReadingTitleAm!.isNotEmpty) ? secondReadingTitleAm : secondReadingTitle;

  String? getSecondReadingText(String langCode) =>
      (langCode == 'am' && secondReadingTextAm != null && secondReadingTextAm!.isNotEmpty) ? secondReadingTextAm : secondReadingText;

  String? getGospelAcclamation(String langCode) =>
      (langCode == 'am' && gospelAcclamationAm != null && gospelAcclamationAm!.isNotEmpty) ? gospelAcclamationAm : gospelAcclamation;

  String getGospelTitle(String langCode) =>
      (langCode == 'am' && gospelTitleAm != null && gospelTitleAm!.isNotEmpty) ? gospelTitleAm! : gospelTitle;

  String getGospelText(String langCode) =>
      (langCode == 'am' && gospelTextAm != null && gospelTextAm!.isNotEmpty) ? gospelTextAm! : gospelText;

  static String _cleanText(String rawText) {
    return rawText
        .replaceAll(RegExp(r'\[NABRE\]', caseSensitive: false), '')
        .replaceAll(RegExp(r'\[.*?\]'), '')
        .trim();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'liturgicalTitle': liturgicalTitle,
      'liturgicalColor': liturgicalColor,
      'firstReadingTitle': firstReadingTitle,
      'firstReadingText': firstReadingText,
      'psalmResponse': psalmResponse,
      'psalmText': psalmText,
      'secondReadingTitle': secondReadingTitle,
      'secondReadingText': secondReadingText,
      'gospelAcclamation': gospelAcclamation,
      'gospelTitle': gospelTitle,
      'gospelText': gospelText,
      'liturgicalTitleAm': liturgicalTitleAm,
      'firstReadingTitleAm': firstReadingTitleAm,
      'firstReadingTextAm': firstReadingTextAm,
      'psalmResponseAm': psalmResponseAm,
      'psalmTextAm': psalmTextAm,
      'secondReadingTitleAm': secondReadingTitleAm,
      'secondReadingTextAm': secondReadingTextAm,
      'gospelAcclamationAm': gospelAcclamationAm,
      'gospelTitleAm': gospelTitleAm,
      'gospelTextAm': gospelTextAm,
    };
  }

  factory DailyReading.fromMap(Map<String, dynamic> map) {
    return DailyReading(
      id: map['id']?.toString() ?? '',
      date: map['date'] ?? '',
      liturgicalTitle: map['liturgicalTitle'] ?? map['liturgical_title'] ?? '',
      liturgicalColor: map['liturgicalColor'] ?? map['liturgical_color'] ?? 'Green',
      firstReadingTitle: map['firstReadingTitle'] ?? map['first_reading_title'] ?? '',
      firstReadingText: map['firstReadingText'] ?? map['first_reading_text'] ?? '',
      psalmResponse: map['psalmResponse'] ?? map['psalm_response'] ?? '',
      psalmText: map['psalmText'] ?? map['psalm_text'] ?? '',
      secondReadingTitle: map['secondReadingTitle'] ?? map['second_reading_title'],
      secondReadingText: map['secondReadingText'] ?? map['second_reading_text'],
      gospelAcclamation: map['gospelAcclamation'] ?? map['gospel_acclamation'],
      gospelTitle: map['gospelTitle'] ?? map['gospel_title'] ?? '',
      gospelText: map['gospelText'] ?? map['gospel_text'] ?? '',
      liturgicalTitleAm: map['liturgicalTitleAm'] ?? map['liturgical_title_am'],
      firstReadingTitleAm: map['firstReadingTitleAm'] ?? map['first_reading_title_am'],
      firstReadingTextAm: map['firstReadingTextAm'] ?? map['first_reading_text_am'],
      psalmResponseAm: map['psalmResponseAm'] ?? map['psalm_response_am'],
      psalmTextAm: map['psalmTextAm'] ?? map['psalm_text_am'],
      secondReadingTitleAm: map['secondReadingTitleAm'] ?? map['second_reading_title_am'],
      secondReadingTextAm: map['secondReadingTextAm'] ?? map['second_reading_text_am'],
      gospelAcclamationAm: map['gospelAcclamationAm'] ?? map['gospel_acclamation_am'],
      gospelTitleAm: map['gospelTitleAm'] ?? map['gospel_title_am'],
      gospelTextAm: map['gospelTextAm'] ?? map['gospel_text_am'],
    );
  }
}