import 'package:flutter/material.dart';

// Unified Package Imports
import 'package:operation_001/models/roadmap_models.dart';
import 'package:operation_001/new_prayer_template_page.dart';
import 'package:operation_001/novena_combo.dart';
import 'package:operation_001/rosary_screen.dart'; // Contains RosaryDetailScreen & defaultRosaryList
import 'package:operation_001/screens/essential_prayers_sheet.dart';
import 'package:operation_001/screens/lesson_detail_screen.dart';
import 'package:operation_001/screens/liturgical_season_sheet.dart';
import 'package:operation_001/screens/mass_etiquette_sheet.dart';
import 'package:operation_001/screens/rosary_guide_sheet.dart';
import 'package:operation_001/widgets/roadmap_lesson_viewer_sheet.dart';
import 'package:operation_001/screens/marian_dogmas_sheet.dart';
import 'package:operation_001/screens/doctors_of_church_sheet.dart';

class RoadmapRouterService {
  RoadmapRouterService._();
  static final RoadmapRouterService instance = RoadmapRouterService._();
  static Function(String assetPath)? onOpenLessonViewer;

  /// Primary entry point when a roadmap node is tapped
  void handleNodeTap({
    required BuildContext context,
    required RoadmapLessonNode node,
    required Function(int tabIndex) onSwitchTab,
    required VoidCallback onNodeCompleted,
    Function(String assetPath)? onOpenLessonViewer,
  }) {
    switch (node.id) {
    // ----------------------------------------------------------------------
    // PHASE 1: ARRIVAL
    // ----------------------------------------------------------------------
      case 'p1_sign_cross':
      case 'essential_prayers':
        _openEssentialPrayersSheet(
          context,
          node,
          onNodeCompleted,
        );
        break;

      case 'p1_our_father':
        _openLessonOrSheet(
          context: context,
          node: node,
          subtitle: 'The Our Father: Line-by-Line Breakdown',
          onNodeCompleted: onNodeCompleted,
        );
        break;

      case 'p1_mass_etiquette':
        _openMassEtiquetteSheet(
          context,
          node,
          onSwitchTab,
          onNodeCompleted,
        );
        break;

    // ----------------------------------------------------------------------
    // PHASE 2: RHYTHM
    // ----------------------------------------------------------------------
      case 'rosary_guide':
      case 'p2_rosary_how':
      case 'p2_rosary':
      case 'holy_rosary':
        _openRosaryHubSheet(
          context,
          node,
          onSwitchTab,
          onNodeCompleted,
        );
        break;

      case 'p2_liturgical_season':
      case 'dynamic_current_season':
        _openLiturgicalSeasonSheet(
          context,
          node,
          onSwitchTab,
          onNodeCompleted,
        );
        break;

      case 'our_lady_guadalupe':
      case 'p2_guadalupe':
        _openApparitionLesson(
          context: context,
          lesson: NovenaCombo(
            text: 'Our Lady of Guadalupe (Mexico, 1531)',
            imagePath: 'assets/Marian & Sacred Apparitions/Our Lady of Guadalupe.jpg',
            category: 'Apparitions',
            tags: const ['Guadalupe', 'Mary', 'Apparition'],
            jsonAsset: 'assets/json/lessons/our_lady_of_guadalupe_mexico_1531.json',
          ),
          onNodeCompleted: onNodeCompleted,
        );
        break;

      case 'our_lady_fatima':
      case 'p2_fatima':
        _openApparitionLesson(
          context: context,
          lesson: NovenaCombo(
            text: 'Our Lady of Fátima (Portugal, 1917)',
            imagePath: 'assets/Marian & Sacred Apparitions/our lady of fatima.jpg',
            category: 'Apparitions',
            tags: const ['Fatima', 'Rosary', 'Apparition'],
            jsonAsset: 'assets/json/lessons/our_lady_of_fatima_portugal_1917.json',
          ),
          onNodeCompleted: onNodeCompleted,
        );
        break;

    // ----------------------------------------------------------------------
    // PHASE 3: ENCOUNTER
    // ----------------------------------------------------------------------
      case 'p3_mass_explained':
      case 'holy_mass_explained':
        _openDevotionLesson(
          context: context,
          lesson: NovenaCombo(
            text: 'The Holy Mass Explained',
            imagePath: 'assets/Devotions & Sacraments/holy mass.jpg',
            category: 'Devotions',
            jsonAsset: 'assets/json/lessons/holy_mass_explained.json',
            tags: const ['Mass', 'Eucharist', 'Liturgy'],
          ),
          onNodeCompleted: onNodeCompleted,
        );
        break;

      case 'sacrament_reconciliation':
      case 'p3_reconciliation':
        _openDevotionLesson(
          context: context,
          lesson: NovenaCombo(
            text: 'Sacrament of Reconciliation',
            imagePath: 'assets/Devotions & Sacraments/reconcillation.jpg',
            category: 'Devotions',
            jsonAsset: 'assets/json/lessons/sacrament_of_reconciliation.json',
            tags: const ['Confession', 'Sacrament', 'Forgiveness'],
          ),
          onNodeCompleted: onNodeCompleted,
        );
        break;

      case 'p3_adoration':
      case 'eucharistic_adoration':
        _openDevotionLesson(
          context: context,
          lesson: NovenaCombo(
            text: 'Eucharistic Adoration & Holy Hour',
            imagePath: 'assets/Devotions & Sacraments/Adoration.jpg',
            category: 'Devotions',
            jsonAsset: 'assets/json/lessons/eucharistic_adoration.json',
            tags: const ['Adoration', 'Monstrance', 'Prayer'],
          ),
          onNodeCompleted: onNodeCompleted,
        );
        break;

      case 'p3_scapular':
      case 'scapulars_and_sacramentals':
        _openDevotionLesson(
          context: context,
          lesson: NovenaCombo(
            text: 'Scapulars',
            imagePath: 'assets/Devotions & Sacraments/scapular.jpg',
            category: 'Devotions',
            jsonAsset: 'assets/json/lessons/scapulars.json',
            tags: const ['Sacramentals', 'Scapular', 'Devotion'],
          ),
          onNodeCompleted: onNodeCompleted,
        );
        break;
    // ----------------------------------------------------------------------
    // PHASE 4: FOUNDATIONS
    // ----------------------------------------------------------------------
      case 'p4_creed':
      case 'apostles_creed':
        _openCatechismLesson(
          context: context,
          lesson: NovenaCombo(
            text: 'The Apostles’ Creed: Summary of Faith',
            imagePath: 'assets/Catechism/the apostles creed.jpg',
            category: 'Catechism',
            jsonAsset: 'assets/json/lessons/apostles_creed_summary_of_faith.json',
            tags: const ['Creed', 'Faith', 'Doctrine'],
          ),
          onNodeCompleted: onNodeCompleted,
        );
        break;

      case 'p4_trinity':
      case 'holy_trinity':
        _openCatechismLesson(
          context: context,
          lesson: NovenaCombo(
            text: 'The Trinity: One God in Three Persons',
            imagePath: 'assets/Holy Trinity.jpg',
            category: 'Catechism',
            jsonAsset: 'assets/json/lessons/trinity_one_god_three_persons.json',
            tags: const ['Trinity', 'God', 'Creed'],
          ),
          onNodeCompleted: onNodeCompleted,
        );
        break;
    // ----------------------------------------------------------------------
    // PHASE 5: DEEPENING
    // ----------------------------------------------------------------------
      case 'p5_marian_dogmas':
      case 'marian_dogmas':
        MarianDogmasSheet.show(context);
        onNodeCompleted();
        break;

      case 'p5_doctors_church':
      case 'doctors_of_church':
        DoctorsOfChurchSheet.show(
          context,
          onOpenSaintsHub: () {
            // Tab 1 or Tab 2 depending on where your spiritual lessons hub is
            onSwitchTab(1);
          },
        );
        onNodeCompleted();
        break;

      default:
        _openGenericSheet(context, node, onNodeCompleted);
        break;
    }
  }

  // --------------------------------------------------------------------------
  // MODAL & SHEET ROUTERS
  // --------------------------------------------------------------------------

  void _openEssentialPrayersSheet(
      BuildContext context,
      RoadmapLessonNode node,
      VoidCallback onNodeCompleted,
      ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return EssentialPrayersSheet(
          onOpenLesson: (assetPath) {
            final selectedLesson = NovenaCombo(
              text: 'Prayer & The Our Father Breakdown',
              imagePath:
              'assets/Catechism/Prayer and The our father breakdown.jpg',
              category: 'Catechism',
              jsonAsset: assetPath,
              tags: const ['Prayer', "Lord's Prayer", 'Gospel'],
            );

            Navigator.of(sheetContext).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 250),
                reverseTransitionDuration: const Duration(milliseconds: 200),
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
          },
        );
      },
    );

    onNodeCompleted();
  }

  void _openRosaryHubSheet(
      BuildContext context,
      RoadmapLessonNode node,
      Function(int tabIndex) onSwitchTab,
      VoidCallback onNodeCompleted,
      ) {
    RosaryGuideSheet.show(
      context,
      onGoToRosaryScreen: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RosaryDetailScreen(
              title: 'The Holy Rosary',
              steps: defaultRosaryList,
            ),
          ),
        );
      },
      onOpenApparitionLesson: () {
        final apparitionLesson = NovenaCombo(
          text: 'Our Lady of the Rosary (Pompei & Lepanto)',
          imagePath:
          'assets/Marian & Sacred Apparitions/our lady of rosary.jpg',
          category: 'Apparitions',
          tags: const ['Rosary', 'Mary', 'Victories'],
          jsonAsset:
          'assets/json/lessons/our_lady_of_the_rosary_pompeii_and_lepanto.json',
        );

        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 250),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) =>
                LessonDetailScreen(lessonItem: apparitionLesson),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
    );

    onNodeCompleted();
  }

  void _openConfessionPrepSheet(
      BuildContext context,
      RoadmapLessonNode node,
      VoidCallback onNodeCompleted,
      ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RoadmapLessonViewerSheet(
        node: node,
        onCompleteLesson: onNodeCompleted,
      ),
    );
  }

  void _openAdorationSheet(
      BuildContext context,
      RoadmapLessonNode node,
      VoidCallback onNodeCompleted,
      ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RoadmapLessonViewerSheet(
        node: node,
        onCompleteLesson: onNodeCompleted,
      ),
    );
  }

  void _openLiturgicalSeasonSheet(
      BuildContext context,
      RoadmapLessonNode node,
      Function(int tabIndex) onSwitchTab,
      VoidCallback onNodeCompleted,
      ) {
    LiturgicalSeasonSheet.show(
      context,
      onOpenLentLesson: () {
        final lentLesson = NovenaCombo(
          text: 'Lent: Conversion & Fasting',
          imagePath: 'assets/Liturgical Year/Lent.jpg',
          category: 'Liturgical',
          jsonAsset: 'assets/json/lessons/lent_conversion_and_fasting.json',
          tags: const ['Lent', 'Fasting', 'Penance'],
        );

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LessonDetailScreen(lessonItem: lentLesson),
          ),
        );
      },
      onOpenActOfContrition: () {
        // ✅ Push directly to NewPrayerTemplatePage for 'Act of Contrition'
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const NewPrayerTemplatePage(
              prayerTitle: 'Act of Contrition',
              prayerImage: 'assets/sunrise.jpeg',
            ),
          ),
        );
      },
    );

    onNodeCompleted();
  }

  void _openLessonOrSheet({
    required BuildContext context,
    required RoadmapLessonNode node,
    required String subtitle,
    required VoidCallback onNodeCompleted,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RoadmapLessonViewerSheet(
        node: node,
        onCompleteLesson: onNodeCompleted,
      ),
    );
  }

  void _openGenericSheet(
      BuildContext context,
      RoadmapLessonNode node,
      VoidCallback onNodeCompleted,
      ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RoadmapLessonViewerSheet(
        node: node,
        onCompleteLesson: onNodeCompleted,
      ),
    );
  }

  void _openMassEtiquetteSheet(
      BuildContext context,
      RoadmapLessonNode node,
      Function(int tabIndex) onSwitchTab,
      VoidCallback onNodeCompleted,
      ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) {
        return MassEtiquetteSheet(
          onGoToOrderOfMass: () {
            onSwitchTab(2);
          },
        );
      },
    ).then((_) {
      onNodeCompleted();
    });
  }
  void _openApparitionLesson({
    required BuildContext context,
    required NovenaCombo lesson,
    required VoidCallback onNodeCompleted,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) =>
            LessonDetailScreen(lessonItem: lesson),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ).then((_) {
      onNodeCompleted();
    });
  }
  void _openDevotionLesson({
    required BuildContext context,
    required NovenaCombo lesson,
    required VoidCallback onNodeCompleted,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) =>
            LessonDetailScreen(lessonItem: lesson),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ).then((_) {
      onNodeCompleted();
    });
  }
  void _openCatechismLesson({
    required BuildContext context,
    required NovenaCombo lesson,
    required VoidCallback onNodeCompleted,
  }) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (context, animation, secondaryAnimation) =>
            LessonDetailScreen(lessonItem: lesson),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    ).then((_) {
      onNodeCompleted();
    });
  }
}