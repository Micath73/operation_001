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
    required this.text,
  });

  /// Helper method expected by bible.dart to return verse text
  String getText(bool isAmharic) {
    return text;
  }

  factory BibleVerse.fromMap(Map<String, dynamic> map) {
    return BibleVerse(
      id: map['id'] ?? 0,
      bookId: map['book_id'] ?? 0,
      chapter: map['chapter'] ?? 0,
      verse: map['verse'] ?? 0,
      text: map['text'] ?? map['text_en'] ?? map['text_am'] ?? '',
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