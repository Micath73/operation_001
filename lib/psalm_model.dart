class PsalmModel {
  final String title;
  final String fullText;
  final String? AmTitle;    // Made nullable
  final String? AmFullText; // Made nullable

  PsalmModel({
    required this.title,
    required this.fullText,
    this.AmTitle,
    this.AmFullText,
  });
}