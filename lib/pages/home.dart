import 'package:flutter/material.dart';
import 'package:operation_001/daily_prayer.dart';
import 'package:operation_001/daily_readings_screen.dart';
import 'package:operation_001/l10n/app_localizations.dart';
import 'package:operation_001/models/roadmap_models.dart';
import 'package:operation_001/quote.dart';
import 'package:operation_001/quote_service.dart';
import 'package:operation_001/dashboard_section.dart';
import 'package:operation_001/novena_section.dart';
import 'package:operation_001/novena_progress_card.dart';
import 'package:operation_001/novena_detail_screen.dart' hide NovenaData;
import 'package:operation_001/db_helper.dart';
import 'package:operation_001/novena_data.dart';
import 'package:operation_001/SavedQuotesScreen.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/screens/lesson_detail_screen.dart';
import 'package:operation_001/widgets/roadmap_lesson_viewer_sheet.dart';
import 'package:operation_001/widgets/app_drawer.dart';

class ActiveNovena {
  final String title;
  final String imagePath;

  ActiveNovena({
    required this.title,
    required this.imagePath,
  });
}

class UserHome extends StatefulWidget {
  final String? targetPrayerTitle;
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const UserHome({
    super.key,
    this.targetPrayerTitle,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  UserHomeState createState() => UserHomeState();
}

class UserHomeState extends State<UserHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Quote? todayQuote;
  bool isBookmarked = false;
  String? activeTargetPrayerTitle;

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
    _tabController = TabController(length: 2, vsync: this);
    activeTargetPrayerTitle = widget.targetPrayerTitle;
    _loadInitialData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void switchToDailyPrayers({String? targetPrayerTitle}) {
    if (targetPrayerTitle != null) {
      setState(() {
        activeTargetPrayerTitle = targetPrayerTitle;
      });
    }
    _tabController.animateTo(1);
  }

  void openCatechismLesson({
    required String title,
    required String jsonAssetPath,
    required String category,
  }) {
    final selectedLesson = NovenaCombo(
      text: title,
      imagePath: 'assets/Catechism/Prayer and The our father breakdown.jpg',
      category: category,
      jsonAsset: jsonAssetPath,
      tags: const ['Prayer', "Lord's Prayer", 'Gospel'],
    );

    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 150),
        pageBuilder: (context, animation, secondaryAnimation) =>
            LessonDetailScreen(lessonItem: selectedLesson),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
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

  String _getQuoteBackgroundImagePath() {
    int imageIndex = 1;

    if (todayQuote != null && todayQuote!.text.isNotEmpty) {
      final int charCodeSum =
      todayQuote!.text.codeUnits.reduce((a, b) => a + b);
      imageIndex = (charCodeSum % 20) + 1;
    } else {
      final now = DateTime.now();
      final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays + 1;
      imageIndex = (dayOfYear % 20) + 1;
    }

    return 'assets/nature/nature $imageIndex.jpg';
  }

  String _getHeaderTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    if (todayQuote == null) return l10n.dailyReflection;

    final authorLower = todayQuote!.author.toLowerCase();

    if (authorLower.contains('gospel') ||
        authorLower.contains('matthew') ||
        authorLower.contains('mark') ||
        authorLower.contains('luke') ||
        authorLower.contains('john')) {
      return l10n.theHolyGospel;
    } else if (authorLower.contains('saint') ||
        authorLower.contains('st.') ||
        authorLower.contains('pope')) {
      return l10n.wordsOfSaints;
    }

    return l10n.dailyReflection;
  }

  Future<void> _toggleBookmark() async {
    if (todayQuote == null) return;
    final l10n = AppLocalizations.of(context)!;

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
            isBookmarked ? l10n.savedQuoteSuccess : l10n.removedQuoteSuccess,
          ),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _openNovenaDetail(ActiveNovena novena, {int? targetDay}) async {
    final l10n = AppLocalizations.of(context)!;
    final bool isCompleted = completedNovenas.any(
          (item) => _isTitleMatch(novena.title, item.title),
    );

    if (isCompleted && targetDay == null) {
      final bool? shouldRestart = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(l10n.novenaCompletedTitle),
            content: Text(l10n.novenaCompletedBody(novena.title)),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l10n.viewProgress),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(l10n.restartFresh),
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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      drawer: AppNavigationDrawer(
        isDarkMode: widget.isDarkMode,
        onThemeChanged: widget.onThemeChanged,
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        edgeOffset: 100,
        color: theme.colorScheme.primary,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            SliverAppBar(
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                  ),
                  tooltip: 'Open Drawer',
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
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
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withValues(alpha: 0.7),
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
                  _getHeaderTitle(context),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    shadows: [
                      Shadow(
                        blurRadius: 6.0,
                        color: Colors.black.withValues(alpha: 0.8),
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      child: Image.asset(
                        _getQuoteBackgroundImagePath(),
                        key: ValueKey<String>(_getQuoteBackgroundImagePath()),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          debugPrint('⚠️ Quote background asset missing: $error');
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
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.40),
                            Colors.black.withValues(alpha: 0.55),
                            Colors.black.withValues(alpha: 0.75),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 40, 25, 100),
                      child: Center(
                        child: todayQuote == null
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  color: theme.colorScheme.secondary,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 4.0,
                                      color: Colors.black
                                          .withValues(alpha: 0.8),
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
                animation: _tabController.animation!,
                builder: (context, child) {
                  final double animationValue = _tabController.animation!.value;
                  final bool isFirstTab = animationValue < 0.5;

                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      if (isFirstTab) ...[
                        if (!isLoading) ...[
                          _buildNovenaAccordion(
                            context: context,
                            title: l10n.inProgressNovenas,
                            icon: Icons.hourglass_top_rounded,
                            items: inProgressNovenas,
                            headerColor: theme.colorScheme.primary,
                            isInitiallyExpanded: true,
                          ),
                          _buildNovenaAccordion(
                            context: context,
                            title: l10n.completedNovenas,
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
                          title: l10n.gospelOfTheDay,
                          description: l10n.gospelDescription,
                          buttonColor: theme.colorScheme.primary,
                          onPressed: () {
                            try {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DailyReadingsScreen(),
                                ),
                              );
                            } catch (e) {
                              debugPrint('Error navigating to DailyReadingsScreen: $e');
                            }
                          },
                        ),
                      ] else ...[
                        const SizedBox(height: 50),
                        Dailyprayer(
                          initialPrayerTitle: activeTargetPrayerTitle,
                        ),
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
    final l10n = AppLocalizations.of(context)!;

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
                  l10n.read,
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