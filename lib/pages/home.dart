import 'package:flutter/material.dart';
import 'package:operation_001/daily_prayer.dart';
import 'package:operation_001/quote.dart';
import 'package:operation_001/dashboard_section.dart';
import 'package:operation_001/novena_section.dart';
import 'package:operation_001/novena_progress_card.dart';
import 'package:operation_001/novena_detail_screen.dart' hide NovenaData;
import 'package:operation_001/db_helper.dart';
import 'package:operation_001/novena_data.dart';

class ActiveNovena {
  final String title;
  final String imagePath;

  ActiveNovena({
    required this.title,
    required this.imagePath,
  });
}

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  List<Quote> quotes = [
    Quote(
      text:
      'O lord for your mercy never abandons me, for your immaculate mercy embraces me. I shall not fear my fear, i shall not falter. For you are by my side my Lord, I shall not Fall! My heart rejoices in your love, trembles in your presence. When all looks dim and dark, your name illuminates my path. I take pride in being your son, for nothing else makes me happy in this world.Amen',
      author: 'Bible',
    ),
  ];

  final List<ActiveNovena> novenaLibrary = [
    ActiveNovena(title: "Sacred Heart", imagePath: "assets/SacredHeart.jpg"),
    ActiveNovena(title: "Divine Mercy Chaplet", imagePath: "assets/img_3.png"),
    ActiveNovena(title: "Arch Angel Michael", imagePath: "assets/Michael.jpg"),
    ActiveNovena(title: "Holy Trinity", imagePath: "assets/Trinity.jpg"),
    ActiveNovena(title: "Pentecost", imagePath: "assets/Pentecost.jpg"),
    ActiveNovena(title: "Pope Leo", imagePath: "assets/Leo.jpg"),
  ];

  List<ActiveNovena> inProgressNovenas = [];
  List<ActiveNovena> completedNovenas = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAllNovenas();
  }

  Future<void> _fetchAllNovenas() async {
    final activeOverview =
    await DatabaseHelper.instance.getActiveNovenasOverview();
    final completedOverview =
    await DatabaseHelper.instance.getCompletedNovenasOverview();

    if (mounted) {
      setState(() {
        // Map in-progress novenas (1-8 days done)
        inProgressNovenas = novenaLibrary.where((item) {
          return activeOverview.any((map) => _isTitleMatch(item.title, map['title'] as String));
        }).toList();

        // Map fully completed novenas (9 days done)
        completedNovenas = novenaLibrary.where((item) {
          return completedOverview.any((map) => _isTitleMatch(item.title, map['title'] as String));
        }).toList();

        isLoading = false;
      });
    }
  }

  bool _isTitleMatch(String libTitle, String dbTitle) {
    final cleanDb = dbTitle.trim().toLowerCase();
    final cleanLib = libTitle.trim().toLowerCase();
    return cleanDb == cleanLib ||
        cleanLib.contains(cleanDb) ||
        cleanDb.contains(cleanLib);
  }

  Future<void> _openNovenaDetail(ActiveNovena novena, {int? targetDay}) async {
    // Check if this novena is marked completed (9/9 days)
    final bool isCompleted = completedNovenas.any(
          (item) => _isTitleMatch(novena.title, item.title),
    );

    // Prompt to restart when tapping a completed novena from the catalog
    if (isCompleted && targetDay == null) {
      final bool? shouldRestart = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Novena Completed!'),
            content: Text(
              'You have already completed the ${novena.title}. Would you like to clear your previous progress and start a fresh cycle?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('View Progress'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Restart Fresh'),
              ),
            ],
          );
        },
      );

      if (shouldRestart == true) {
        await DatabaseHelper.instance.resetNovenaProgress(novena.title);
        if (mounted) {
          await _fetchAllNovenas();
        }
      }
    }

    if (!mounted) return;

    final story = NovenaData.getStoryForTitle(novena.title);
    final days = NovenaData.getDaysForTitle(novena.title);

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NovenaDetailScreen(
          title: novena.title,
          novenaImage: novena.imagePath,
          storyText: story,
          days: days,
          initialDay: targetDay ?? 1,
          autoStart: targetDay != null,
        ),
      ),
    );

    if (mounted) {
      await _fetchAllNovenas();
    }
  }

  Widget _buildNovenaAccordion({
    required BuildContext context,
    required String title,
    required IconData icon,
    required List<ActiveNovena> items,
    required Color headerColor,
    required bool isInitiallyExpanded,
  }) {
    final theme = Theme.of(context);

    // Completely hides accordion wrapper if zero items exist
    if (items.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.15),
          ),
        ),
        color: theme.colorScheme.surfaceContainer,
        child: Theme(
          data: theme.copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: ValueKey('${title}_${items.length}'), // Key forces rebuild on count change
            initiallyExpanded: isInitiallyExpanded,
            leading: Icon(icon, color: headerColor),
            title: Text(
              '$title (${items.length})',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            children: items.map((novena) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: NovenaProgressCard(
                  novenaTitle: novena.title,
                  imagePath: novena.imagePath,
                  onCleared: _fetchAllNovenas, // Linked callback to purge & rebuild
                  onTap: () async {
                    await _openNovenaDetail(novena);
                  },
                  onPrayPressed: (targetDay) async {
                    await _openNovenaDetail(novena, targetDay: targetDay);
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: Icon(
                  Icons.menu,
                  color: theme.colorScheme.onPrimary,
                ),
                expandedHeight: MediaQuery.of(context).size.height * 0.4,
                backgroundColor: theme.colorScheme.primary,
                pinned: true,
                stretch: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: TabBar(
                    labelColor: theme.colorScheme.onPrimary,
                    unselectedLabelColor:
                    theme.colorScheme.onPrimary.withOpacity(0.7),
                    indicatorColor: theme.colorScheme.secondary,
                    indicatorWeight: 3,
                    tabs: const [
                      Tab(icon: Icon(Icons.church)),
                      Tab(icon: Icon(Icons.wb_sunny)),
                    ],
                  ),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(bottom: 70),
                  centerTitle: true,
                  title: Text(
                    'The Word of God',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.primaryContainer,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 40, 25, 100),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: quotes
                                .map(
                                  (quote) => Text(
                                '"${quote.text}"',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                  color: theme.colorScheme.onPrimary
                                      .withOpacity(0.8),
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: AnimatedBuilder(
                  animation: tabController.animation!,
                  builder: (context, child) {
                    final double animationValue = tabController.animation!.value;
                    final bool isFirstTab = animationValue < 0.5;

                    return Column(
                      children: [
                        const SizedBox(height: 20),

                        if (isFirstTab) ...[
                          if (!isLoading) ...[
                            // 1. In-Progress Accordion
                            _buildNovenaAccordion(
                              context: context,
                              title: "In Progress Novenas",
                              icon: Icons.hourglass_top_rounded,
                              items: inProgressNovenas,
                              headerColor: theme.colorScheme.primary,
                              isInitiallyExpanded: true,
                            ),

                            // 2. Completed Accordion
                            _buildNovenaAccordion(
                              context: context,
                              title: "Completed Novenas",
                              icon: Icons.check_circle_rounded,
                              items: completedNovenas,
                              headerColor: Colors.green,
                              isInitiallyExpanded: false,
                            ),
                          ],

                          const SizedBox(height: 12),

                          // All Available Novenas Catalog
                          NovenaSection(
                            onNovenaChanged: _fetchAllNovenas,
                          ),
                          const SizedBox(height: 25),
                          MyUniversalCard(
                            title: "Gospel Of The Day",
                            description:
                            "Reflect your day with this Gospel verse",
                            buttonColor: theme.colorScheme.primary,
                            onPressed: () {},
                          ),
                        ] else ...[
                          const SizedBox(height: 50),
                          Dailyprayer(),
                          const SizedBox(height: 50),
                        ],

                        const SizedBox(height: 20),
                        const DashboardSection(),
                        const SizedBox(height: 100),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MyUniversalCard extends StatelessWidget {
  final String title;
  final String description;
  final Color buttonColor;
  final VoidCallback onPressed;

  const MyUniversalCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: theme.colorScheme.surfaceContainerHigh,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.15),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  'Read',
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}