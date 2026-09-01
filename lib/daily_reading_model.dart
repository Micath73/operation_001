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
  })  : firstReadingText = _cleanText(firstReadingText),
        psalmText = _cleanText(psalmText),
        secondReadingText =
        secondReadingText != null ? _cleanText(secondReadingText) : null,
        gospelAcclamation =
        gospelAcclamation != null ? _cleanText(gospelAcclamation) : null,
        gospelText = _cleanText(gospelText);

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
    };
  }

  factory DailyReading.fromMap(Map<String, dynamic> map) {
    return DailyReading(
      id: map['id']?.toString() ?? '',
      date: map['date'] ?? '',
      liturgicalTitle: map['liturgicalTitle'] ?? map['liturgical_title'] ?? '',
      liturgicalColor:
      map['liturgicalColor'] ?? map['liturgical_color'] ?? 'Green',
      firstReadingTitle:
      map['firstReadingTitle'] ?? map['first_reading_title'] ?? '',
      firstReadingText:
      map['firstReadingText'] ?? map['first_reading_text'] ?? '',
      psalmResponse: map['psalmResponse'] ?? map['psalm_response'] ?? '',
      psalmText: map['psalmText'] ?? map['psalm_text'] ?? '',
      secondReadingTitle:
      map['secondReadingTitle'] ?? map['second_reading_title'],
      secondReadingText:
      map['secondReadingText'] ?? map['second_reading_text'],
      gospelAcclamation:
      map['gospelAcclamation'] ?? map['gospel_acclamation'],
      gospelTitle: map['gospelTitle'] ?? map['gospel_title'] ?? '',
      gospelText: map['gospelText'] ?? map['gospel_text'] ?? '',
    );
  }
}