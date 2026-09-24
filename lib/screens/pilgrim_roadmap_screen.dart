import 'package:flutter/material.dart';
import 'package:operation_001/models/roadmap_models.dart';
import 'package:operation_001/data/roadmap_repository.dart';
import 'package:operation_001/services/roadmap_router_service.dart';

class PilgrimRoadmapScreen extends StatefulWidget {
  final UserPersona persona;
  final Set<String> completedLessonIds;
  final Function(RoadmapLessonNode) onSelectLesson;
  final Function(int tabIndex)? onSwitchTab;
  final VoidCallback onResetProgress;
  final VoidCallback onChangePersona;

  const PilgrimRoadmapScreen({
    super.key,
    required this.persona,
    required this.completedLessonIds,
    required this.onSelectLesson,
    this.onSwitchTab,
    required this.onResetProgress,
    required this.onChangePersona,
  });

  @override
  State<PilgrimRoadmapScreen> createState() => _PilgrimRoadmapScreenState();
}

class _PilgrimRoadmapScreenState extends State<PilgrimRoadmapScreen> {
  late List<RoadmapPhase> _phases;

  @override
  void initState() {
    super.initState();
    _loadRoadmapData();
  }

  @override
  void didUpdateWidget(covariant PilgrimRoadmapScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.completedLessonIds != widget.completedLessonIds ||
        oldWidget.persona != widget.persona) {
      _loadRoadmapData();
    }
  }

  void _loadRoadmapData() {
    _phases = RoadmapRepository.getPhasesForPersona(
      persona: widget.persona,
      currentSeasonJsonAsset: 'assets/lessons/lent_conversion_fasting.json',
      currentSeasonTitle: 'Lent',
      completedLessonIds: widget.completedLessonIds,
    );
  }

  int get _totalNodes {
    int count = 0;
    for (final phase in _phases) {
      count += phase.nodes.length;
    }
    return count;
  }

  int get _completedNodesCount {
    int count = 0;
    for (final phase in _phases) {
      for (final node in phase.nodes) {
        if (widget.completedLessonIds.contains(node.id) ||
            node.status == NodeStatus.completed) {
          count++;
        }
      }
    }
    return count;
  }

  void _showSettingsSheet() {
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Text(
                  'Roadmap Settings',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Manage your pilgrim journey preferences and progress.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Icon(Icons.person_outline,
                        color: theme.colorScheme.primary),
                  ),
                  title: const Text('Change Pilgrim Path / Persona'),
                  subtitle: Text('Current: ${_getPersonaTitle(widget.persona)}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pop(sheetContext);
                    widget.onChangePersona();
                  },
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFFEE2E2),
                    child: Icon(Icons.restart_alt_rounded, color: Colors.red),
                  ),
                  title: const Text(
                    'Reset Progress',
                    style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('Clear all checkmarks and start over'),
                  onTap: () {
                    Navigator.pop(sheetContext);
                    _confirmResetDialog();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _confirmResetDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Reset Journey Progress?'),
          content: const Text(
            'This will clear all completed lesson checkmarks on your roadmap. This action cannot be undone.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pop(dialogContext);
                widget.onResetProgress();
              },
              child: const Text('Reset Progress'),
            ),
          ],
        );
      },
    );
  }

  String _getPersonaTitle(UserPersona persona) {
    switch (persona) {
      case UserPersona.newExplorer:
        return 'New Explorer';
      case UserPersona.ociaCandidate:
        return 'OCIA Candidate';
      case UserPersona.returningCatholic:
        return 'Returning Catholic';
      case UserPersona.seasonedDevout:
        return 'Seasoned Devout';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilgrim Roadmap'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            tooltip: 'Persona Settings',
            onPressed: _showSettingsSheet, // Activated
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPilgrimHeader(primaryColor),
            const SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _phases.length,
              itemBuilder: (context, index) {
                return _buildPhaseSection(_phases[index], primaryColor);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPilgrimHeader(Color primaryColor) {
    final total = _totalNodes;
    final completed = _completedNodesCount;
    final progress = total > 0 ? (completed / total) : 0.0;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: primaryColor.withValues(alpha: 0.15),
                  child: Icon(Icons.explore, color: primaryColor, size: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pilgrim Journey',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$completed of $total Roadmap Lessons Completed',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: primaryColor.withValues(alpha: 0.12),
                valueColor: AlwaysStoppedAnimation<Color>(
                  progress == 1.0 ? Colors.green : primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhaseSection(RoadmapPhase phase, Color primaryColor) {
    final mainNodes =
    phase.nodes.where((n) => n.nodeType == NodeType.mainSpine).toList();
    final sideChapels =
    phase.nodes.where((n) => n.nodeType == NodeType.sideChapel).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                phase.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              Text(
                phase.subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        ...mainNodes.map((node) => _buildNodeTile(node, false, primaryColor)),
        if (sideChapels.isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.only(left: 32, top: 8, bottom: 4),
            child: Text(
              'Side Chapels (Optional Detours)',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          ...sideChapels.map((node) => _buildNodeTile(node, true, primaryColor)),
        ],
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildNodeTile(
      RoadmapLessonNode node, bool isSideChapel, Color primaryColor) {
    final isCompleted = node.status == NodeStatus.completed ||
        widget.completedLessonIds.contains(node.id);
    final isLocked = node.status == NodeStatus.locked && !isCompleted;

    return Padding(
      padding: EdgeInsets.only(
        left: isSideChapel ? 32.0 : 0.0,
        bottom: 8.0,
      ),
      child: ListTile(
        onTap: isLocked
            ? null
            : () {
          RoadmapRouterService.instance.handleNodeTap(
            context: context,
            node: node,
            onSwitchTab: (index) {
              if (widget.onSwitchTab != null) {
                widget.onSwitchTab!(index);
              }
            },
            onNodeCompleted: () {
              widget.onSelectLesson(node);
              setState(() {
                _loadRoadmapData();
              });
            },
          );
        },
        leading: CircleAvatar(
          backgroundColor: isCompleted
              ? Colors.amber[700]
              : (isLocked ? Colors.grey[300] : primaryColor),
          child: Icon(
            isCompleted
                ? Icons.check
                : (isLocked
                ? Icons.lock
                : (isSideChapel ? Icons.church : Icons.play_arrow)),
            color: isLocked ? Colors.grey[600] : Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          node.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isCompleted
                ? Colors.grey[700]
                : (isLocked ? Colors.grey : Colors.black87),
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          node.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: isCompleted
                  ? Colors.grey[500]
                  : (isLocked ? Colors.grey[400] : Colors.grey[600])),
        ),
        trailing: isLocked
            ? null
            : const Icon(Icons.chevron_right, color: Colors.grey),
      ),
    );
  }
}