import 'package:flutter/material.dart';
import 'package:operation_001/models/saint_model.dart';
import 'package:operation_001/repositories/saints_repository.dart';
import 'package:operation_001/screens/saints_directory_screen.dart';

class SaintDetailScreen extends StatelessWidget {
  final SaintModel saint;

  const SaintDetailScreen({
    super.key,
    required this.saint,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    // Fetch other saints sharing this saint's exact feast date
    final sameDaySaints = SaintsRepository.instance
        .getSaintsForFeastDate(saint.feastDate)
        .where((s) => s.id != saint.id)
        .toList();

    final imagePath = saint.imagePath.isNotEmpty
        ? saint.imagePath
        : 'assets/saints/placeholder.jpg';

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // COLLAPSIBLE HERO HEADER TAKING NEARLY 45% OF THE SCREEN
          SliverAppBar(
            expandedHeight: screenSize.height * 0.45,
            pinned: true,
            stretch: true,
            backgroundColor: theme.colorScheme.surface,
            foregroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                saint.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 4.0,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand, // <-- FIXED: Changed from Stack.expand to StackFit.expand
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/saints/placeholder.jpg',
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        errorBuilder: (context, secondError, secondStackTrace) {
                          return Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.church_rounded,
                                size: 64,
                                color: Color(0xFFC9A24B),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  // Gradient overlay to ensure app bar back button and title remain readable
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.5),
                          Colors.transparent,
                          Colors.black.withOpacity(0.85),
                        ],
                        stops: const [0.0, 0.4, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SCROLLABLE BODY CONTENT
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FEAST DATE & LITURGICAL RANK
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 18,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Feast Day: ${saint.feastDate} (${saint.liturgicalRank})',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // PATRONAGE
                  if (saint.patronage.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.verified_rounded,
                          size: 18,
                          color: theme.colorScheme.secondary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Patronage: ${saint.patronage.join(", ")}',
                            style: TextStyle(
                              fontSize: 14,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 16),

                  // QUOTE BLOCK
                  if (saint.quote != null && saint.quote!.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: theme.colorScheme.primary.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.format_quote_rounded,
                            color: theme.colorScheme.primary,
                            size: 28,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              saint.quote!,
                              style: TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                                height: 1.4,
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],

                  // BIOGRAPHY
                  Text(
                    'Biography',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    saint.shortBio,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),

                  // FULL STORY
                  if (saint.fullStory.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    Text(
                      'Life & Legacy',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      saint.fullStory,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],

                  // ALSO COMMEMORATED TODAY
                  if (sameDaySaints.isNotEmpty) ...[
                    const SizedBox(height: 28),
                    Text(
                      'Also Commemorated Today',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 48,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: sameDaySaints.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final otherSaint = sameDaySaints[index];
                          return ActionChip(
                            avatar: const Icon(Icons.person, size: 18),
                            label: Text(otherSaint.name),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SaintDetailScreen(saint: otherSaint),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),

      // BOTTOM DIRECTORY BUTTON
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 52,
            child: FilledButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SaintsDirectoryScreen(),
                  ),
                );
              },
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(Icons.search_rounded),
              label: const Text(
                'Browse All Saints Directory',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}