import 'package:flutter/material.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/screens/lesson_detail_screen.dart';

class EssentialPrayersSheet extends StatefulWidget {
  final Function(String lessonAssetPath)? onOpenLesson;

  const EssentialPrayersSheet({
    super.key,
    this.onOpenLesson,
  });

  static void show(
      BuildContext context, {
        Function(String lessonAssetPath)? onOpenLesson,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EssentialPrayersSheet(onOpenLesson: onOpenLesson),
    );
  }

  @override
  State<EssentialPrayersSheet> createState() => _EssentialPrayersSheetState();
}

class _EssentialPrayersSheetState extends State<EssentialPrayersSheet> {
  int _selectedGestureStep = 0;

  final List<Map<String, String>> _gestureSteps = [
    {
      'action': 'Touch Forehead',
      'words': '"In the name of the Father..."',
      'detail':
      'Place your right hand on your forehead, remembering God above all and dedicating your mind to Him.',
    },
    {
      'action': 'Touch Chest',
      'words': '"...and of the Son..."',
      'detail':
      'Bring your right hand down to the center of your chest/heart, honoring Christ who came down to Earth.',
    },
    {
      'action': 'Touch Left Shoulder',
      'words': '"...and of the Holy..."',
      'detail':
      'Touch your left shoulder, inviting the Holy Spirit into your daily struggles and actions.',
    },
    {
      'action': 'Touch Right Shoulder',
      'words': '"...Spirit. Amen."',
      'detail':
      'Cross over to touch your right shoulder, completing the cross that seals your body and soul.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          // Drag Handle Header
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: primaryColor.withValues(alpha: 0.15),
                  child: Icon(Icons.church_rounded, color: primaryColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Essential Daily Prayers',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Phase 1 • Foundations of Prayer',
                        style: theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- SECTION 1: SIGN OF THE CROSS WALKTHROUGH ---
                  _buildSectionHeader(
                      context, '1. The Sign of the Cross', Icons.front_hand_rounded),
                  const SizedBox(height: 8),
                  Text(
                    'The ancient gesture opening every Catholic prayer, dedicating mind, heart, and strength to the Holy Trinity.',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 12),
                  Card(
                    elevation: 0,
                    color: primaryColor.withValues(alpha: 0.08),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: primaryColor.withValues(alpha: 0.2)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(4, (index) {
                              final isSelected = _selectedGestureStep == index;
                              return ChoiceChip(
                                label: Text('Step ${index + 1}'),
                                selected: isSelected,
                                onSelected: (_) {
                                  setState(() => _selectedGestureStep = index);
                                },
                              );
                            }),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _gestureSteps[_selectedGestureStep]['action']!,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _gestureSteps[_selectedGestureStep]['words']!,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _gestureSteps[_selectedGestureStep]['detail']!,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // --- SECTION 2: THE OUR FATHER ---
                  _buildSectionHeader(
                      context, '2. The Our Father (Lord\'s Prayer)', Icons.menu_book_rounded),
                  const SizedBox(height: 8),
                  _buildPrayerCard(
                    context,
                    title: 'Our Father',
                    latinTitle: 'Pater Noster',
                    body:
                    'Our Father, who art in heaven, hallowed be thy name; thy kingdom come, thy will be done on earth as it is in heaven. Give us this day our daily bread, and forgive us our trespasses, as we forgive those who trespass against us; and lead us not into temptation, but deliver us from evil. Amen.',
                    lessonAssetPath:
                    'assets/json/lessons/prayer_and_our_father_breakdown.json',
                    lessonButtonText:
                    'Deep Dive: Line-by-Line Spiritual Breakdown',
                  ),

                  const SizedBox(height: 24),

                  // --- SECTION 3: HAIL MARY ---
                  _buildSectionHeader(
                      context, '3. The Hail Mary', Icons.favorite_rounded),
                  const SizedBox(height: 8),
                  _buildPrayerCard(
                    context,
                    title: 'Hail Mary',
                    latinTitle: 'Ave Maria',
                    body:
                    'Hail Mary, full of grace, the Lord is with thee. Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners, now and at the hour of our death. Amen.',
                  ),

                  const SizedBox(height: 24),

                  // --- SECTION 4: GLORY BE ---
                  _buildSectionHeader(
                      context, '4. The Glory Be', Icons.auto_awesome_rounded),
                  const SizedBox(height: 8),
                  _buildPrayerCard(
                    context,
                    title: 'Glory Be',
                    latinTitle: 'Gloria Patri',
                    body:
                    'Glory be to the Father, and to the Son, and to the Holy Spirit, as it was in the beginning, is now, and ever shall be, world without end. Amen.',
                  ),

                  const SizedBox(height: 24),

                  // --- SECTION 5: APOSTLES\' CREED ---
                  _buildSectionHeader(
                      context, '5. The Apostles\' Creed', Icons.shield_rounded),
                  const SizedBox(height: 8),
                  _buildPrayerCard(
                    context,
                    title: 'Apostles\' Creed',
                    latinTitle: 'Symbolum Apostolorum',
                    body:
                    'I believe in God, the Father Almighty, Creator of heaven and earth, and in Jesus Christ, His only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; He descended into hell; on the third day He rose again from the dead; He ascended into heaven, and is seated at the right hand of God the Father Almighty; from there He will come to judge the living and the dead. I believe in the Holy Spirit, the holy catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body, and life everlasting. Amen.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
      BuildContext context, String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPrayerCard(
      BuildContext context, {
        required String title,
        required String latinTitle,
        required String body,
        String? lessonAssetPath,
        String? lessonButtonText,
      }) {
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  latinTitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const Divider(height: 16),
            Text(
              body,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
            ),
            if (lessonAssetPath != null && lessonButtonText != null) ...[
              const SizedBox(height: 12),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 42),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.school_outlined, size: 18),
                label: Text(lessonButtonText),
                onPressed: () {
                  if (widget.onOpenLesson != null) {
                    widget.onOpenLesson!(lessonAssetPath);
                  } else {
                    final selectedLesson = NovenaCombo(
                      text: title,
                      imagePath:
                      'assets/Catechism/Prayer and The our father breakdown.jpg',
                      category: 'Catechism',
                      jsonAsset: lessonAssetPath,
                      tags: const ['Prayer', "Lord's Prayer", 'Gospel'],
                    );

                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 200),
                        reverseTransitionDuration:
                        const Duration(milliseconds: 150),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            LessonDetailScreen(lessonItem: selectedLesson),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}