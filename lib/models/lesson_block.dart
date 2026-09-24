import 'package:flutter/foundation.dart';

/// Base sealed class for all content block types in a lesson.
sealed class LessonBlock {
  const LessonBlock();

  factory LessonBlock.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String?;
    switch (type) {
      case 'heading':
        return HeadingBlock(json['text'] as String? ?? '');
      case 'scripture':
      case 'quote':
        return ScriptureBlock(
          reference: json['reference'] as String? ?? json['author'] as String? ?? '',
          text: json['text'] as String? ?? '',
        );
      case 'prayer':
        return PrayerBlock(
          title: json['title'] as String? ?? '',
          text: json['text'] as String? ?? '',
        );
      case 'callout':
        return CalloutBlock(
          title: json['title'] as String?,
          text: json['text'] as String? ?? '',
        );
      case 'paragraph':
      default:
        return ParagraphBlock(json['text'] as String? ?? '');
    }
  }
}

class HeadingBlock extends LessonBlock {
  final String text;
  const HeadingBlock(this.text);
}

class ParagraphBlock extends LessonBlock {
  final String text;
  const ParagraphBlock(this.text);
}

class ScriptureBlock extends LessonBlock {
  final String reference;
  final String text;

  const ScriptureBlock({
    required this.reference,
    required this.text,
  });
}

class PrayerBlock extends LessonBlock {
  final String title;
  final String text;

  const PrayerBlock({
    required this.title,
    required this.text,
  });
}

class CalloutBlock extends LessonBlock {
  final String? title;
  final String text;

  const CalloutBlock({
    this.title,
    required this.text,
  });
}