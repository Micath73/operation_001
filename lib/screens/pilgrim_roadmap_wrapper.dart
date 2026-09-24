import 'package:flutter/material.dart';
import 'package:operation_001/models/roadmap_models.dart';
import 'package:operation_001/services/roadmap_preferences_service.dart';
import 'package:operation_001/services/roadmap_router_service.dart';
import 'package:operation_001/screens/pilgrim_roadmap_screen.dart';
import 'package:operation_001/screens/roadmap_onboarding_screen.dart';

class PilgrimRoadmapWrapper extends StatefulWidget {
  final Function(String jsonAssetPath) onOpenLessonViewer;
  final Function(int tabIndex)? onSwitchTab;

  const PilgrimRoadmapWrapper({
    super.key,
    required this.onOpenLessonViewer,
    this.onSwitchTab,
  });

  @override
  State<PilgrimRoadmapWrapper> createState() => _PilgrimRoadmapWrapperState();
}

class _PilgrimRoadmapWrapperState extends State<PilgrimRoadmapWrapper> {
  UserPersona? _userPersona;
  Set<String> _completedLessonIds = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    RoadmapRouterService.onOpenLessonViewer = widget.onOpenLessonViewer;
    _initializeAppState();
  }

  Future<void> _initializeAppState() async {
    final persona = await RoadmapPreferencesService.getUserPersona();
    final completedIds = await RoadmapPreferencesService.getCompletedLessonIds();

    setState(() {
      _userPersona = persona;
      _completedLessonIds = completedIds;
      _isLoading = false;
    });
  }

  void _handlePersonaSelected(UserPersona selectedPersona) {
    setState(() {
      _userPersona = selectedPersona;
    });
  }

  Future<void> _handleLessonCompleted(RoadmapLessonNode node) async {
    await RoadmapPreferencesService.saveCompletedLesson(node.id);
    final updatedCompletedIds =
    await RoadmapPreferencesService.getCompletedLessonIds();

    if (mounted) {
      setState(() {
        _completedLessonIds = updatedCompletedIds;
      });
    }
  }

  Future<void> _handleResetProgress() async {
    await RoadmapPreferencesService.clearCompletedLessons();
    setState(() {
      _completedLessonIds = {};
    });
  }

  void _handleChangePersona() {
    setState(() {
      _userPersona = null; // Triggers onboarding screen view
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_userPersona == null) {
      return RoadmapOnboardingScreen(
        onPersonaSelected: _handlePersonaSelected,
      );
    }

    return PilgrimRoadmapScreen(
      persona: _userPersona!,
      completedLessonIds: _completedLessonIds,
      onSelectLesson: _handleLessonCompleted,
      onSwitchTab: widget.onSwitchTab,
      onResetProgress: _handleResetProgress,
      onChangePersona: _handleChangePersona,
    );
  }
}