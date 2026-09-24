import 'package:flutter/material.dart';
import '../novena_combo.dart';
import '../repositories/lesson_repository.dart';
import '../widgets/lesson_block_widget.dart';

class LessonDetailScreen extends StatefulWidget {
  final NovenaCombo lessonItem;

  const LessonDetailScreen({super.key, required this.lessonItem});

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  late Future<Lesson?> _lessonFuture;

  @override
  void initState() {
    super.initState();
    final assetPath = widget.lessonItem.jsonAsset;
    if (assetPath != null && assetPath.isNotEmpty) {
      _lessonFuture = LessonRepository.instance.loadLesson(assetPath);
    } else {
      _lessonFuture = Future.value(null);
    }
  }

  void _openFullImageViewer(BuildContext context) {
    if (widget.lessonItem.imagePath.isEmpty) return;

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (dialogContext) => Dialog.fullscreen(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                minScale: 0.8,
                maxScale: 4.0,
                child: Image.asset(
                  widget.lessonItem.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.of(dialogContext).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final pageBackgroundColor = isDark ? const Color(0xFF1E1C1A) : const Color(0xFFFAF7F0);
    final paperSurfaceColor = isDark ? const Color(0xFF282522) : const Color(0xFFFFFDF9);
    final textColor = isDark ? const Color(0xFFE6E1DA) : const Color(0xFF2C2523);

    return Scaffold(
      backgroundColor: pageBackgroundColor,
      body: FutureBuilder<Lesson?>(
        future: _lessonFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(title: Text(widget.lessonItem.text)),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    'Error loading lesson: ${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }

          final lesson = snapshot.data;

          if (lesson == null) {
            return Scaffold(
              appBar: AppBar(title: Text(widget.lessonItem.text)),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.menu_book_rounded, size: 64, color: theme.colorScheme.outline),
                      const SizedBox(height: 16),
                      Text(
                        'Content Coming Soon',
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'This lesson is currently being formatted for the digital library.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * 0.42,
                pinned: true,
                stretch: true,
                backgroundColor: pageBackgroundColor,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.zoomBackground, // Sharp background zoom only
                  ],
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      if (widget.lessonItem.imagePath.isNotEmpty)
                        GestureDetector(
                          onTap: () => _openFullImageViewer(context),
                          child: Image.asset(
                            widget.lessonItem.imagePath,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(color: theme.colorScheme.primaryContainer),
                          ),
                        )
                      else
                        Container(color: theme.colorScheme.primaryContainer),

                      Positioned.fill(
                        child: IgnorePointer(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.3),
                                  Colors.transparent,
                                  pageBackgroundColor.withOpacity(0.8),
                                  pageBackgroundColor,
                                ],
                                stops: const [0.0, 0.4, 0.85, 1.0],
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        top: 48,
                        right: 16,
                        child: GestureDetector(
                          onTap: () => _openFullImageViewer(context),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.fullscreen_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: const Offset(0, -20),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12.0),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 28.0),
                    decoration: BoxDecoration(
                      color: paperSurfaceColor,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(isDark ? 0.4 : 0.08),
                          blurRadius: 18,
                          offset: const Offset(0, -4),
                        ),
                      ],
                      border: Border.all(
                        color: isDark ? Colors.white10 : const Color(0xFFE8E8D5),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                widget.lessonItem.category.toUpperCase(),
                                style: theme.textTheme.labelSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          lesson.title,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontFamily: 'Serif',
                            fontWeight: FontWeight.bold,
                            color: textColor,
                            height: 1.25,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(Icons.menu_book_outlined, size: 16, color: theme.colorScheme.primary),
                            const SizedBox(width: 6),
                            Text(
                              'Catholic Doctrine & Reflection',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontStyle: FontStyle.italic,
                                color: textColor.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Divider(thickness: 0.8),
                        ),
                        ...lesson.blocks.map(
                              (block) => LessonBlockWidget(block: block),
                        ),
                        const SizedBox(height: 40),
                        Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.auto_awesome,
                                size: 20,
                                color: theme.colorScheme.primary.withOpacity(0.5),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'AMEN',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  letterSpacing: 3.0,
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
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
}