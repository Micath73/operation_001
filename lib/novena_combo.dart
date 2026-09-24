class NovenaCombo {
  final String text;
  final String imagePath;
  final String category;
  final String? webUrl;
  final bool isOnline;
  final List<String> tags;
  final String? jsonAsset; // Pointer to the local lesson JSON asset

  const NovenaCombo({
    required this.text,
    required this.imagePath,
    required this.category,
    this.webUrl,
    this.isOnline = false,
    this.tags = const [],
    this.jsonAsset,
  });
}