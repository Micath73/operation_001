import 'package:flutter/material.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/repositories/saints_repository.dart';
import 'package:operation_001/screens/lesson_detail_screen.dart';
import 'package:operation_001/screens/saint_detail_screen.dart';
import 'package:operation_001/screens/saints_directory_screen.dart';

class DoctorsOfChurchSheet extends StatelessWidget {
  final VoidCallback? onOpenSaintsHub;

  const DoctorsOfChurchSheet({
    Key? key,
    this.onOpenSaintsHub,
  }) : super(key: key);

  static void show(BuildContext context, {VoidCallback? onOpenSaintsHub}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DoctorsOfChurchSheet(onOpenSaintsHub: onOpenSaintsHub),
    );
  }

  static final List<_DoctorItem> _doctors = [
    _DoctorItem(
      saintId: 'st_augustine', // Matches 08_august.json
      name: 'St. Augustine of Hippo',
      title: 'Doctor of Grace',
      dates: '354 – 430 AD',
      description:
      'One of the most significant theologians in Church history. Author of Confessions and The City of God, defining Christian doctrines on grace, original sin, and the Church.',
      lesson: NovenaCombo(
        text: 'St. Augustine of Hippo',
        imagePath: 'assets/saints/st_augustine.jpg',
        category: 'Doctors of the Church',
        tags: const ['Doctor', 'Grace', 'Theology', 'Augustine'],
        jsonAsset: 'assets/saints/08_august.json',
      ),
    ),
    _DoctorItem(
      saintId: 'st_ambrose', // Matches 12_december.json
      name: 'St. Ambrose of Milan',
      title: 'The Honey-Tongued Preacher',
      dates: '340 – 397 AD',
      description:
      'Bishop of Milan who stood firm against imperial overreach, transformed Western liturgical music, and whose eloquent preaching brought St. Augustine to the faith.',
      lesson: NovenaCombo(
        text: 'St. Ambrose of Milan',
        imagePath: 'assets/saints/placeholder.jpg',
        category: 'Doctors of the Church',
        tags: const ['Doctor', 'Liturgy', 'Preaching', 'Ambrose'],
        jsonAsset: 'assets/saints/12_december.json',
      ),
    ),
    _DoctorItem(
      saintId: 'st_jerome', // Matches 09_september.json
      name: 'St. Jerome',
      title: 'Doctor of Sacred Scripture',
      dates: '347 – 420 AD',
      description:
      'Scholarly hermit who spent decades in Bethlehem translating the Bible from Hebrew and Greek into Latin (The Vulgate). Famously noted: "Ignorance of Scripture is ignorance of Christ."',
      lesson: NovenaCombo(
        text: 'St. Jerome',
        imagePath: 'assets/saints/st_jerome.jpg',
        category: 'Doctors of the Church',
        tags: const ['Doctor', 'Scripture', 'Vulgate', 'Jerome'],
        jsonAsset: 'assets/saints/09_september.json',
      ),
    ),
    _DoctorItem(
      saintId: 'st_gregory', // Matches 09_september.json
      name: 'St. Gregory the Great',
      title: 'The Father of Christian Worship',
      dates: '540 – 604 AD',
      description:
      'Pope who reformed Church administration, codified liturgical worship, revitalized missionary work across Europe, and standardized Gregorian Chant.',
      lesson: NovenaCombo(
        text: 'St. Gregory the Great',
        imagePath: 'assets/saints/gregory_the_great.jpg',
        category: 'Doctors of the Church',
        tags: const ['Doctor', 'Pope', 'Liturgy', 'Gregory'],
        jsonAsset: 'assets/saints/09_september.json',
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
          // Top Drag Bar Handle
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
              const Icon(Icons.menu_book_rounded, color: Color(0xFF1E3A8A)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Doctors of the Church',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Saintly theologians and teachers whose writings have profoundly shaped Christian doctrine across the ages (37 recognized total).',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 16),

          // List of Doctors
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: _doctors.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final doctor = _doctors[index];
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              doctor.name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF1E3A8A),
                              ),
                            ),
                          ),
                          Text(
                            doctor.dates,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        doctor.title,
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: const Color(0xFFB45309),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        doctor.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.35,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: () => _openDoctorProfile(context, doctor),
                          icon: const Icon(Icons.auto_stories, size: 16),
                          label: const Text('Read Profile'),
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

          // Gateway CTA - Always opens SaintsDirectoryScreen
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(context); // Close bottom sheet
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SaintsDirectoryScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.verified_user_outlined),
              label: const Text('Explore Saints of the Day & Library'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _openDoctorProfile(BuildContext context, _DoctorItem doctor) async {
    // Ensure all months are loaded before searching by ID
    await SaintsRepository.instance.ensureLoaded();

    final matchedSaint = SaintsRepository.instance.getSaintById(doctor.saintId);

    if (context.mounted) {
      if (matchedSaint != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SaintDetailScreen(saint: matchedSaint),
          ),
        );
      } else {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 250),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) =>
                LessonDetailScreen(lessonItem: doctor.lesson),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      }
    }
  }
}

class _DoctorItem {
  final String saintId;
  final String name;
  final String title;
  final String dates;
  final String description;
  final NovenaCombo lesson;

  const _DoctorItem({
    required this.saintId,
    required this.name,
    required this.title,
    required this.dates,
    required this.description,
    required this.lesson,
  });
}