import 'package:flutter/material.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/screens/lesson_detail_screen.dart';

class MarianDogmasSheet extends StatelessWidget {
  const MarianDogmasSheet({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const MarianDogmasSheet(),
    );
  }

  static final List<_DogmaItem> _dogmas = [
    _DogmaItem(
      title: '1. Divine Motherhood (Theotokos)',
      definition:
      'Declared at the Council of Ephesus (431 AD). Mary is truly the Mother of God because Jesus Christ is one divine Person with two natures.',
      lesson: NovenaCombo(
        text: 'Divine Motherhood of Mary (Theotokos)',
        imagePath: 'assets/Dogma/Theotokos.jpg',
        category: 'Dogma',
        tags: const ['Mary', 'Theotokos', 'Marian Dogma'],
        jsonAsset: 'assets/json/lessons/divine_motherhood_of_mary.json',
      ),
    ),
    _DogmaItem(
      title: '2. Perpetual Virginity',
      definition:
      'Mary was a virgin before, during, and perpetually after the birth of Jesus Christ, remaining ever-virgin throughout her entire life.',
      lesson: NovenaCombo(
        text: 'The Perpetual Virginity of Mary',
        imagePath: 'assets/Dogma/Perpetual Virginity of Mary.jpg',
        category: 'Dogma',
        tags: const ['Mary', 'Virginity', 'Marian Dogma'],
        jsonAsset: 'assets/json/lessons/perpetual_virginity_of_mary.json',
      ),
    ),
    _DogmaItem(
      title: '3. Immaculate Conception',
      definition:
      'Defined by Pope Pius IX in 1854. Mary was preserved immune from all stain of Original Sin from the very first instant of her conception.',
      lesson: NovenaCombo(
        text: 'The Immaculate Conception of Mary',
        imagePath: 'assets/Dogma/The Immaculate Conception of Mary.jpg',
        category: 'Dogma',
        tags: const ['Mary', 'Immaculate Conception', 'Grace'],
        jsonAsset: 'assets/json/lessons/immaculate_conception_of_mary.json',
      ),
    ),
    _DogmaItem(
      title: '4. The Assumption into Heaven',
      definition:
      'Defined by Pope Pius XII in 1950. Having completed the course of her earthly life, Mary was assumed body and soul into heavenly glory.',
      lesson: NovenaCombo(
        text: 'The Assumption of Mary into Heaven',
        imagePath: 'assets/Dogma/The Assumption of Mary into Heaven.jpg',
        category: 'Dogma',
        tags: const ['Mary', 'Assumption', 'Heaven'],
        jsonAsset: 'assets/json/lessons/assumption_of_mary.json',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Header
          Row(
            children: [
              const Icon(Icons.auto_awesome, color: Color(0xFF1E3A8A)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'The Four Marian Dogmas',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Core solemn truths defined by the Catholic Church regarding the Blessed Virgin Mary.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 16),

          // Dogma Cards List
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _dogmas.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final dogma = _dogmas[index];
                return Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: theme.colorScheme.outline.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dogma.title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E3A8A),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        dogma.definition,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration:
                                const Duration(milliseconds: 250),
                                reverseTransitionDuration:
                                const Duration(milliseconds: 200),
                                pageBuilder: (context, animation,
                                    secondaryAnimation) =>
                                    LessonDetailScreen(
                                        lessonItem: dogma.lesson),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          icon: const Icon(Icons.menu_book, size: 16),
                          label: const Text('Dive Deeper'),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 8),
                            textStyle: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _DogmaItem {
  final String title;
  final String definition;
  final NovenaCombo lesson;

  const _DogmaItem({
    required this.title,
    required this.definition,
    required this.lesson,
  });
}