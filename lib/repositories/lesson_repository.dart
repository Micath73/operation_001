import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/lesson_block.dart';

/// Representation of a parsed lesson containing structured content blocks.
class Lesson {
  final String id;
  final String title;
  final String category;
  final String? imagePath;
  final List<LessonBlock> blocks;

  const Lesson({
    required this.id,
    required this.title,
    required this.category,
    this.imagePath,
    required this.blocks,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    final rawBlocks = json['blocks'] as List<dynamic>? ?? [];
    final parsedBlocks = rawBlocks
        .map((b) => LessonBlock.fromJson(b as Map<String, dynamic>))
        .toList();

    return Lesson(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      category: json['category'] as String? ?? '',
      imagePath: json['imagePath'] as String?,
      blocks: parsedBlocks,
    );
  }
}

/// Repository responsible for loading and caching lesson assets.
class LessonRepository {
  LessonRepository._internal();
  static final LessonRepository instance = LessonRepository._internal();

  // In-memory cache to avoid re-reading files from disk
  final Map<String, Lesson> _cache = {};

  /// Loads a lesson JSON asset from [assetPath] with caching.
  Future<Lesson> loadLesson(String assetPath) async {
    if (_cache.containsKey(assetPath)) {
      return _cache[assetPath]!;
    }

    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final dynamic mapData = jsonDecode(jsonString);

      final lesson = Lesson.fromJson(mapData as Map<String, dynamic>);
      _cache[assetPath] = lesson;
      return lesson;
    } catch (e) {
      throw Exception('Failed to load lesson asset at $assetPath: $e');
    }
  }

  /// Clears the in-memory cache if needed.
  void clearCache() {
    _cache.clear();
  }
}