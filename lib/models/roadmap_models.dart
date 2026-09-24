import 'package:flutter/material.dart';

/// User persona declared at onboarding to tailor the roadmap path.
enum UserPersona {
  newExplorer,      // Full linear path (Arrival -> Rhythm -> Encounter -> Foundations -> Deepening)
  ociaCandidate,     // Accelerated sacramental path (Sacraments moved earlier for Easter Vigil prep)
  returningCatholic, // Skips basic prayer tutorials; starts at Rhythm/Encounter
  seasonedDevout,    // Unlocks all phases; acts as a structured recommendation engine
}

/// Status of a specific node on the Pilgrim Trail.
enum NodeStatus {
  completed,
  inProgress,
  locked,
}

/// Distinguishes between core main-path lessons and optional side-chapel detours.
enum NodeType {
  mainSpine,
  sideChapel,
}

/// Represents a single lesson node on the Pilgrim Path.
class RoadmapLessonNode {
  final String id;
  final String title;
  final String description;
  final String jsonAssetPath;
  final String category;
  final NodeType nodeType;
  final NodeStatus status;
  final List<String> prerequisiteIds;
  final String? unlocksRewardDescription; // e.g., "Unlocks Interactive Examination of Conscience"

  const RoadmapLessonNode({
    required this.id,
    required this.title,
    required this.description,
    required this.jsonAssetPath,
    required this.category,
    this.nodeType = NodeType.mainSpine,
    this.status = NodeStatus.locked,
    this.prerequisiteIds = const [],
    this.unlocksRewardDescription,
  });

  RoadmapLessonNode copyWith({
    NodeStatus? status,
  }) {
    return RoadmapLessonNode(
      id: id,
      title: title,
      description: description,
      jsonAssetPath: jsonAssetPath,
      category: category,
      nodeType: nodeType,
      status: status ?? this.status,
      prerequisiteIds: prerequisiteIds,
      unlocksRewardDescription: unlocksRewardDescription,
    );
  }
}

/// Represents a major stage/phase along the Pilgrim Trail.
class RoadmapPhase {
  final int phaseNumber;
  final String id;
  final String title;
  final String subtitle;
  final String goal;
  final List<RoadmapLessonNode> nodes;

  const RoadmapPhase({
    required this.phaseNumber,
    required this.id,
    required this.title,
    required this.subtitle,
    required this.goal,
    required this.nodes,
  });

  bool get isCompleted => nodes
      .where((n) => n.nodeType == NodeType.mainSpine)
      .every((n) => n.status == NodeStatus.completed);

  int get completedMainCount => nodes
      .where((n) => n.nodeType == NodeType.mainSpine && n.status == NodeStatus.completed)
      .length;

  int get totalMainCount =>
      nodes.where((n) => n.nodeType == NodeType.mainSpine).length;
}

/// Model tracking grace-based weekly habit progress (4 active days target).
class WeeklyHabitProgress {
  final int activeDaysThisWeek; // 0 to 7
  final int targetDays;         // Default: 4 days (avoids scrupulosity/streak anxiety)
  final int totalWeeksCompleted;

  const WeeklyHabitProgress({
    this.activeDaysThisWeek = 0,
    this.targetDays = 4,
    this.totalWeeksCompleted = 0,
  });

  bool get isWeeklyGoalMet => activeDaysThisWeek >= targetDays;
}