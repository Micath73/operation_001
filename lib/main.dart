import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';// Auto-generated localizations class
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:operation_001/pages/bible.dart';
import 'package:operation_001/pages/home.dart';
import 'package:operation_001/pages/mass.dart';
import 'package:operation_001/pages/more.dart';
import 'package:operation_001/controllers/saint_of_the_day_controller.dart';
import 'package:operation_001/controllers/language_controller.dart';
import 'package:operation_001/route_observer.dart';
import 'package:operation_001/theme.dart';
import 'package:operation_001/screens/pilgrim_roadmap_wrapper.dart';
import 'package:operation_001/models/roadmap_models.dart';
import 'package:operation_001/widgets/roadmap_lesson_viewer_sheet.dart';
import 'package:operation_001/screens/essential_prayers_sheet.dart';
import 'package:operation_001/screens/rosary_guide_sheet.dart';
import 'package:operation_001/rosary_screen.dart';
import 'package:operation_001/services/notification_service.dart';

// Global notifier for dynamic theme switching across all screens
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LanguageController.instance.initLanguage(); // Initialize saved language preference
  await SaintOfTheDayController.instance.initialize();

  // Initialize Notification Service
  await NotificationService.instance.initialize(
    onNotificationTap: (String? prayerTitle) {
      if (prayerTitle != null && prayerTitle.isNotEmpty) {
        // Deep-link routing logic to open AngelusScreen, ChapletScreen, or RosaryDetailScreen
      }
    },
  );

  runApp(const CatholicApp());
}

class CatholicApp extends StatelessWidget {
  const CatholicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, currentMode, _) {
        return ListenableBuilder(
          listenable: LanguageController.instance,
          builder: (context, _) {
            final langCtrl = LanguageController.instance;

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Catholic Devotional Hub',
              locale: langCtrl.currentLocale,
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: const [
                AppLocalizations.delegate, // Generated custom translations delegate
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              navigatorObservers: [appRouteObserver],
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: currentMode,
              home: const Home(),
            );
          },
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int _massInitialTab = 0; // Tracks whether to open Daily Readings (0) or Order of Mass (1)

  // Key to communicate directly with UserHome state
  final GlobalKey<UserHomeState> _homeKey = GlobalKey<UserHomeState>();

  void _switchTab(int tabIndex, {int innerMassTab = 0}) {
    setState(() {
      _selectedIndex = tabIndex;
      if (tabIndex == 2) {
        _massInitialTab = innerMassTab;
      }
    });
  }

  void _handleRoadmapLessonRoute(String assetPath) {
    // 1. Close any currently open modal bottom sheet
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }

    if (assetPath.contains('mass')) {
      _switchTab(2, innerMassTab: 1); // Open Mass -> Order of Mass
    } else if (assetPath.contains('bible')) {
      _switchTab(1);
    } else if (assetPath.contains('prayer_and_our_father_breakdown') ||
        assetPath.contains('our_father')) {
      // Switch tab to Home (Index 0)
      _switchTab(0);

      // Trigger opening the Catechism lesson in UserHome
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _homeKey.currentState?.openCatechismLesson(
          title: 'Prayer & The Our Father Breakdown',
          jsonAssetPath: assetPath,
          category: 'Catechism',
        );
      });
    } else if (assetPath.contains('rosary') || assetPath.contains('pray_rosary')) {
      // Show the Rosary Guide Sheet with both deep-dive actions
      RosaryGuideSheet.show(
        context,
        onGoToRosaryScreen: () {
          // Direct navigation to the Rosary Mysteries screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RosaryDetailScreen(
                title: 'Holy Rosary',
                steps: defaultRosaryList,
              ),
            ),
          );
        },
        onOpenApparitionLesson: () {
          // 1. Switch to Home Tab (Index 0)
          _switchTab(0);

          // 2. Open the Our Lady of the Rosary Apparition lesson in UserHome
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _homeKey.currentState?.openCatechismLesson(
              title: 'Our Lady of the Rosary (Pompeii & Lepanto)',
              jsonAssetPath: 'assets/json/lessons/our_lady_of_the_rosary_pompeii_and_lepanto.json',
              category: 'Apparitions',
            );
          });
        },
      );
    } else if (assetPath.contains('p1_sign_cross') ||
        assetPath.contains('sign_of_the_cross') ||
        assetPath.contains('essential_prayers')) {
      // Direct route to the interactive essential prayers sheet
      EssentialPrayersSheet.show(
        context,
        onOpenLesson: (lessonPath) {
          _handleRoadmapLessonRoute(lessonPath);
        },
      );
    } else {
      // Generic viewer for other lessons
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => RoadmapLessonViewerSheet(
          node: RoadmapLessonNode(
            id: 'deep_dive_lesson',
            title: 'Spiritual Breakdown',
            description: 'Line-by-line spiritual analysis.',
            category: 'Catechism',
            jsonAssetPath: assetPath,
          ),
          onCompleteLesson: () {},
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final pages = [
      UserHome(
        key: _homeKey,
        isDarkMode: isDark,
        onThemeChanged: (bool dark) {
          // Dynamically updates the global themeNotifier across the entire app
          themeNotifier.value = dark ? ThemeMode.dark : ThemeMode.light;
        },
      ),
      const UserBible(),
      UserMass(
        key: ValueKey(_massInitialTab), // Rebuilds when switching directly between Mass sub-tabs
        initialTabIndex: _massInitialTab,
      ),
      PilgrimRoadmapWrapper(
        onOpenLessonViewer: (String jsonAssetPath) {
          _handleRoadmapLessonRoute(jsonAssetPath);
        },
        onSwitchTab: (int tabIndex) {
          if (tabIndex == 0) {
            // Switch to Home tab and slide to Daily Prayers sub-tab
            _switchTab(0);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _homeKey.currentState?.switchToDailyPrayers();
            });
          } else {
            // If coming from Mass Etiquette or Roadmap, open Order of Mass (tab 1 inside MassScreen)
            _switchTab(tabIndex, innerMassTab: 1);
          }
        },
      ),
      const UserMore(),
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: isDark
                  ? Colors.black.withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: 0.08),
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: GNav(
              rippleColor: theme.colorScheme.primary.withValues(alpha: 0.15),
              hoverColor: theme.colorScheme.primary.withValues(alpha: 0.08),
              gap: 6,
              activeColor: theme.colorScheme.primary,
              iconSize: 22,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor:
              theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              tabs: const [
                GButton(
                  icon: Icons.home_rounded,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.menu_book_rounded,
                  text: 'Bible',
                ),
                GButton(
                  icon: Icons.church_rounded,
                  text: 'Mass',
                ),
                GButton(
                  icon: Icons.explore_rounded,
                  text: 'Journey',
                ),
                GButton(
                  icon: Icons.more_horiz_rounded,
                  text: 'More',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                // Regular bottom bar tap defaults Mass screen to Daily Readings (0)
                _switchTab(index, innerMassTab: 0);
              },
            ),
          ),
        ),
      ),
    );
  }
}