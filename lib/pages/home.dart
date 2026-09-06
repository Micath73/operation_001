import 'package:flutter/material.dart';
import 'package:operation_001/daily_prayer.dart';
import 'package:operation_001/quote.dart';
import 'package:operation_001/quote_service.dart';
import 'package:operation_001/dashboard_section.dart';
import 'package:operation_001/novena_section.dart';
import 'package:operation_001/novena_progress_card.dart';
import 'package:operation_001/novena_detail_screen.dart' hide NovenaData;
import 'package:operation_001/db_helper.dart';
import 'package:operation_001/novena_data.dart';
import 'package:operation_001/SavedQuotesScreen.dart';

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
  Quote? todayQuote;
  bool isBookmarked = false;

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
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    final loadedQuote = await QuoteService.getTodayQuote();
    bool bookmarkedStatus = false;

    if (loadedQuote != null) {
      bookmarkedStatus =
      await DatabaseHelper.instance.isQuoteFavorite(loadedQuote.text);
    }

    if (mounted) {
      setState(() {
        todayQuote = loadedQuote;
        isBookmarked = bookmarkedStatus;
      });
    }
    await _fetchAllNovenas();
  }

  Future<void> _handleRefresh() async {
    await _loadInitialData();
  }

  Future<void> _fetchAllNovenas() async {
    final activeOverview =
    await DatabaseHelper.instance.getActiveNovenasOverview();
    final completedOverview =
    await DatabaseHelper.instance.getCompletedNovenasOverview();

    if (mounted) {
      setState(() {
        inProgressNovenas = novenaLibrary.where((item) {
          return activeOverview
              .any((map) => _isTitleMatch(item.title, map['title'] as String));
        }).toList();

        completedNovenas = novenaLibrary.where((item) {
          return completedOverview
              .any((map) => _isTitleMatch(item.title, map['title'] as String));
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

  // Pick background image dynamically based on quote hash code or day of year
  String _getQuoteBackgroundImagePath() {
    int imageIndex = 1;

    if (todayQuote != null && todayQuote!.text.isNotEmpty) {
      final int charCodeSum = todayQuote!.text.codeUnits.reduce((a, b) => a + b);
      imageIndex = (charCodeSum % 20) + 1;
    } else {
      final now = DateTime.now();
      final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;
      imageIndex = (dayOfYear % 20) + 1;
    }

    // Matching "assets/nature 1.jpg" up to "assets/nature 20.jpg"
    return 'assets/nature/nature $imageIndex.jpg';
  }

  // Dynamic header title matching both Gospel readings and Saint quotes
  String _getHeaderTitle() {
    if (todayQuote == null) return 'Daily Reflection';

    final authorLower = todayQuote!.author.toLowerCase();

    if (authorLower.contains('gospel') ||
        authorLower.contains('matthew') ||
        authorLower.contains('mark') ||
        authorLower.contains('luke') ||
        authorLower.contains('john')) {
      return 'The Holy Gospel';
    } else if (authorLower.contains('saint') ||
        authorLower.contains('st.') ||
        authorLower.contains('pope')) {
      return 'Words of the Saints';
    }

    return 'Daily Reflection';
  }

  Future<void> _toggleBookmark() async {
    if (todayQuote == null) return;

    final newBookmarkState = !isBookmarked;

    if (newBookmarkState) {
      await DatabaseHelper.instance.insertFavoriteQuote(
        todayQuote!.text,
        todayQuote!.author,
      );
    } else {
      await DatabaseHelper.instance.removeFavoriteQuote(todayQuote!.text);
    }

    if (mounted) {
      setState(() {
        isBookmarked = newBookmarkState;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isBookmarked
                ? 'Saved quote to favorites!'
                : 'Removed quote from favorites.',
          ),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _openNovenaDetail(ActiveNovena novena, {int? targetDay}) async {
    final bool isCompleted = completedNovenas.any(
          (item) => _isTitleMatch(novena.title, item.title),
    );

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
            key: ValueKey('${title}_${items.length}'),
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
                  onCleared: _fetchAllNovenas,
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
    final String imagePath = _getQuoteBackgroundImagePath();

    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          final tabController = DefaultTabController.of(context);

          return RefreshIndicator(
            onRefresh: _handleRefresh,
            edgeOffset: 100,
            color: theme.colorScheme.primary,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              slivers: [
                SliverAppBar(
                  leading: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(
                        Icons.bookmarks_rounded,
                        color: Colors.white,
                      ),
                      tooltip: 'View Saved Quotes',
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SavedQuotesScreen(),
                          ),
                        );
                        _loadInitialData();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: Colors.white,
                      ),
                      tooltip: 'Bookmark Quote',
                      onPressed: _toggleBookmark,
                    ),
                  ],
                  expandedHeight: MediaQuery.of(context).size.height * 0.4,
                  backgroundColor: theme.colorScheme.primary,
                  pinned: true,
                  stretch: true,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(60),
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white.withOpacity(0.7),
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
                      _getHeaderTitle(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        shadows: [
                          Shadow(
                            blurRadius: 6.0,
                            color: Colors.black.withOpacity(0.8),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Smooth Cross-Fade Animation for Background Image
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 800),
                          switchInCurve: Curves.easeIn,
                          switchOutCurve: Curves.easeOut,
                          child: Image.asset(
                            imagePath,
                            key: ValueKey<String>(imagePath),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              // Fallback Gradient if asset image is missing
                              return Container(
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
                              );
                            },
                          ),
                        ),
                        // Dark Overlay to Dim Background for Maximum Text Readability
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0.40),
                                Colors.black.withOpacity(0.55),
                                Colors.black.withOpacity(0.75),
                              ],
                            ),
                          ),
                        ),
                        // Quote Display Section
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 40, 25, 100),
                          child: Center(
                            child: todayQuote == null
                                ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                                : SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '"${todayQuote!.text}"',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      height: 1.5,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.0,
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 6.0,
                                          color: Colors.black,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    '— ${todayQuote!.author}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      color: theme
                                          .colorScheme.secondaryContainer,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 4.0,
                                          color: Colors.black
                                              .withOpacity(0.8),
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: AnimatedBuilder(
                    animation: tabController.animation!,
                    builder: (context, child) {
                      final double animationValue =
                          tabController.animation!.value;
                      final bool isFirstTab = animationValue < 0.5;

                      return Column(
                        children: [
                          const SizedBox(height: 20),
                          if (isFirstTab) ...[
                            if (!isLoading) ...[
                              _buildNovenaAccordion(
                                context: context,
                                title: "In Progress Novenas",
                                icon: Icons.hourglass_top_rounded,
                                items: inProgressNovenas,
                                headerColor: theme.colorScheme.primary,
                                isInitiallyExpanded: true,
                              ),
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
            ),
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