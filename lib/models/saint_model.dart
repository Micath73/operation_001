class SaintModel {
  final String id;
  final String name;
  final String feastDate;
  final bool isPrimary;
  final bool isSolemnity;
  final String liturgicalRank;
  final String imagePath;
  final String shortBio;
  final String fullStory;
  final List<String> patronage;
  final String? quote;
  final int? birthYear;
  final int? deathYear;
  final int? canonizationYear;
  final List<String> tags;

  const SaintModel({
    required this.id,
    required this.name,
    required this.feastDate,
    required this.isPrimary,
    required this.isSolemnity,
    required this.liturgicalRank,
    required this.imagePath,
    required this.shortBio,
    required this.fullStory,
    required this.patronage,
    required this.quote,
    required this.birthYear,
    required this.deathYear,
    required this.canonizationYear,
    required this.tags,
  });

  /// Alias getter for legacy UI screens expecting `saint.title`
  String get title => name;

  factory SaintModel.fromJson(Map<String, dynamic> json) {
    return SaintModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? json['title'] as String? ?? 'Unknown Saint',
      feastDate: json['feastDate'] as String? ?? '01-01',
      isPrimary: json['isPrimary'] as bool? ?? false,
      isSolemnity: json['isSolemnity'] as bool? ?? false,
      liturgicalRank: json['liturgicalRank'] as String? ?? 'optional-memorial',
      imagePath: json['imagePath'] as String? ?? 'assets/saints/placeholder.jpg',
      shortBio: json['shortBio'] as String? ?? '',
      fullStory: json['fullStory'] as String? ?? '',
      patronage: (json['patronage'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          const [],
      quote: json['quote'] as String?,
      birthYear: json['birthYear'] as int?,
      deathYear: json['deathYear'] as int?,
      canonizationYear: json['canonizationYear'] as int?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList() ??
          const [],
    );
  }

  SaintModel copyWith({bool? isPrimary}) => SaintModel(
    id: id,
    name: name,
    feastDate: feastDate,
    isPrimary: isPrimary ?? this.isPrimary,
    isSolemnity: isSolemnity,
    liturgicalRank: liturgicalRank,
    imagePath: imagePath,
    shortBio: shortBio,
    fullStory: fullStory,
    patronage: patronage,
    quote: quote,
    birthYear: birthYear,
    deathYear: deathYear,
    canonizationYear: canonizationYear,
    tags: tags,
  );
}

class DailySaintsEntry {
  final String feastDate;
  final List<SaintModel> saints;

  const DailySaintsEntry({
    required this.feastDate,
    required this.saints,
  });

  factory DailySaintsEntry.fromJson(Map<String, dynamic> json) {
    final rawSaints = json['saints'] as List<dynamic>? ?? const [];
    final saints = rawSaints
        .map((e) => SaintModel.fromJson(e as Map<String, dynamic>))
        .toList();

    final primaryCount = saints.where((s) => s.isPrimary).length;
    if (saints.isNotEmpty && primaryCount != 1) {
      final fixed = <SaintModel>[];
      var assigned = false;
      for (final s in saints) {
        final shouldBePrimary = !assigned && (primaryCount == 0 ? s == saints.first : s.isPrimary);
        fixed.add(s.copyWith(isPrimary: shouldBePrimary));
        if (shouldBePrimary) assigned = true;
      }
      return DailySaintsEntry(
        feastDate: json['feastDate'] as String? ?? saints.first.feastDate,
        saints: fixed,
      );
    }

    return DailySaintsEntry(
      feastDate: json['feastDate'] as String? ?? (saints.isNotEmpty ? saints.first.feastDate : '01-01'),
      saints: saints,
    );
  }

  SaintModel get primary => saints.firstWhere((s) => s.isPrimary, orElse: () => saints.first);
  List<SaintModel> get secondary => saints.where((s) => !s.isPrimary).toList();
  bool get hasMultiple => saints.length > 1;
}