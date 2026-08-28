class DailyReading {
  final String date; // Format: YYYY-MM-DD
  final String liturgicalTitle; // e.g., "Twenty-First Sunday in Ordinary Time"
  final String liturgicalColor; // e.g., "Green", "Purple", "White", "Red"
  final String firstReadingTitle; // e.g., "First Reading: Isaiah 22:19-23"
  final String firstReadingText;
  final String psalmResponse; // e.g., "R. Lord, your love is eternal..."
  final String psalmText;
  final String? secondReadingTitle; // Optional (Sundays & Solemnities)
  final String? secondReadingText;
  final String gospelAcclamation;
  final String gospelTitle; // e.g., "Gospel: Matthew 16:13-20"
  final String gospelText;

  DailyReading({
    required this.date,
    required this.liturgicalTitle,
    required this.liturgicalColor,
    required this.firstReadingTitle,
    required this.firstReadingText,
    required this.psalmResponse,
    required this.psalmText,
    this.secondReadingTitle,
    this.secondReadingText,
    required this.gospelAcclamation,
    required this.gospelTitle,
    required this.gospelText,
  });

  // Convert JSON map to DailyReading object
  factory DailyReading.fromJson(Map<String, dynamic> json) {
    return DailyReading(
      date: json['date'] as String? ?? '',
      liturgicalTitle: json['liturgicalTitle'] as String? ?? '',
      liturgicalColor: json['liturgicalColor'] as String? ?? 'Green',
      firstReadingTitle: json['firstReadingTitle'] as String? ?? '',
      firstReadingText: json['firstReadingText'] as String? ?? '',
      psalmResponse: json['psalmResponse'] as String? ?? '',
      psalmText: json['psalmText'] as String? ?? '',
      secondReadingTitle: json['secondReadingTitle'] as String?,
      secondReadingText: json['secondReadingText'] as String?,
      gospelAcclamation: json['gospelAcclamation'] as String? ?? '',
      gospelTitle: json['gospelTitle'] as String? ?? '',
      gospelText: json['gospelText'] as String? ?? '',
    );
  }

  // Convert DailyReading object back to Map for SQLite database storage
  Map<String, dynamic> toJson() {
    return {
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
}