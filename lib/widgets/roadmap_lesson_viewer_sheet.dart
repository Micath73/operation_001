import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/roadmap_models.dart';

class RoadmapLessonViewerSheet extends StatelessWidget {
  final RoadmapLessonNode node;
  final VoidCallback onCompleteLesson;

  const RoadmapLessonViewerSheet({
    super.key,
    required this.node,
    required this.onCompleteLesson,
  });

  Future<Map<String, dynamic>> _loadLessonData() async {
    final String response = await rootBundle.loadString(node.jsonAssetPath);
    return json.decode(response) as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: FutureBuilder<Map<String, dynamic>>(
        future: _loadLessonData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || !snapshot.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error loading lesson content:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }

          final data = snapshot.data!;

          // Comprehensive key lookup to match any JSON breakdown schema
          final dynamic rawContent = data['sections'] ??
              data['content'] ??
              data['breakdown'] ??
              data['phrases'] ??
              data['lines'] ??
              data['steps'] ??
              data['paragraphs'] ??
              data['items'];

          final List<dynamic> contentList = rawContent is List ? rawContent : [];

          return Column(
            children: [
              // Sheet Drag Handle & Title Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      data['title'] ?? node.title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (data['subtitle'] != null || data['description'] != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        data['subtitle'] ?? data['description'] ?? '',
                        style: TextStyle(color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
              const Divider(height: 1),

              // Lesson Body Render Area
              Expanded(
                child: contentList.isNotEmpty
                    ? ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: contentList.length,
                  itemBuilder: (context, index) {
                    return _buildSectionItem(context, contentList[index]);
                  },
                )
                    : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    data['body'] ??
                        (rawContent is String ? rawContent : null) ??
                        node.description,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                ),
              ),

              // Bottom Completion Action
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        onCompleteLesson();
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Mark as Completed',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionItem(BuildContext context, dynamic item) {
    if (item is String) {
      return _buildFormattedText(item);
    }

    if (item is Map<String, dynamic>) {
      return _buildSectionMap(context, item);
    }

    return const SizedBox.shrink();
  }

  Widget _buildFormattedText(String text) {
    // Strips out raw markdown asterisks and formats bold keyphrases nicely
    final cleanText = text.replaceAll('**', '');
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        cleanText,
        style: const TextStyle(fontSize: 15, height: 1.5),
      ),
    );
  }

  Widget _buildSectionMap(BuildContext context, Map<String, dynamic> section) {
    final type = section['type'];
    final title = section['title'] ?? section['heading'] ?? section['phrase'] ?? section['line'];
    final content = section['content'] ?? section['text'] ?? section['meaning'] ?? section['explanation'] ?? section['detail'] ?? '';

    // Standard Phrase / Line Breakdown Cards
    if (title != null && content.toString().isNotEmpty && type == null) {
      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 0,
        color: Colors.grey.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toString(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                content.toString(),
                style: const TextStyle(fontSize: 14, height: 1.4),
              ),
            ],
          ),
        ),
      );
    }

    switch (type) {
      case 'header':
      case 'heading':
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            (content.toString().isEmpty ? title : content).toString(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        );

      case 'callout':
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.amber.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.amber.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Text(
                  title.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber.shade900,
                  ),
                ),
              if (title != null) const SizedBox(height: 4),
              Text(
                content.toString(),
                style: TextStyle(color: Colors.amber.shade900),
              ),
            ],
          ),
        );

      case 'bullet_list':
        final items = section['items'] as List<dynamic>? ?? [];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items
                .map((listItem) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      listItem.toString().replaceAll('**', ''),
                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                  ),
                ],
              ),
            ))
                .toList(),
          ),
        );

      default:
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            content.toString(),
            style: const TextStyle(fontSize: 15, height: 1.5),
          ),
        );
    }
  }
}