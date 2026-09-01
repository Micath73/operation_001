class BibleVerse {
  final int id;
  final int bookId;
  final int chapter;
  final int verse;
  final String text;

  BibleVerse({
    required this.id,
    required this.bookId,
    required this.chapter,
    required this.verse,
    required String text,
  }) : text = _cleanText(text);

  /// Strips bracketed translation artifacts like [NABRE] or [1]
  static String _cleanText(String rawText) {
    return rawText
        .replaceAll(RegExp(r'\[NABRE\]', caseSensitive: false), '')
        .replaceAll(RegExp(r'\[.*?\]'), '')
        .trim();
  }

  /// Returns verse text for requested language mode
  String getText(bool isAmharic) {
    return text;
  }

  factory BibleVerse.fromMap(Map<String, dynamic> map) {
    String rawVerseText =
        map['text'] ?? map['text_en'] ?? map['text_am'] ?? map['verse_text'] ?? '';

    return BibleVerse(
      id: map['id'] is int ? map['id'] : int.tryParse(map['id'].toString()) ?? 0,
      bookId: map['book_id'] is int
          ? map['book_id']
          : int.tryParse(map['book_id'].toString()) ?? 0,
      chapter: map['chapter'] is int
          ? map['chapter']
          : int.tryParse(map['chapter'].toString()) ?? 0,
      verse: map['verse'] is int
          ? map['verse']
          : int.tryParse(map['verse'].toString()) ?? 0,
      text: rawVerseText,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'book_id': bookId,
      'chapter': chapter,
      'verse': verse,
      'text': text,
    };
  }
}