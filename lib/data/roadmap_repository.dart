import '../models/roadmap_models.dart';

class RoadmapRepository {
  /// Generates the tailored list of phases based on selected persona and current season asset.
  static List<RoadmapPhase> getPhasesForPersona({
    required UserPersona persona,
    required String currentSeasonJsonAsset,
    required String currentSeasonTitle,
    Set<String> completedLessonIds = const {},
  }) {
    List<RoadmapPhase> rawPhases = [
      _buildPhase1Arrival(),
      _buildPhase2Rhythm(currentSeasonJsonAsset, currentSeasonTitle),
      _buildPhase3Encounter(),
      _buildPhase4Foundations(),
      _buildPhase5Deepening(),
    ];

    // Adjust sequence per persona
    switch (persona) {
      case UserPersona.ociaCandidate:
      // Move Sacramental Encounter up right after Arrival for Easter Vigil preparation
        rawPhases = [
          rawPhases[0], // Phase 1: Arrival
          rawPhases[2], // Phase 3: Encounter (moved to Phase 2)
          rawPhases[1], // Phase 2: Rhythm (moved to Phase 3)
          rawPhases[3], // Phase 4: Foundations
          rawPhases[4], // Phase 5: Deepening
        ];
        break;

      case UserPersona.returningCatholic:
      // Skip Phase 1 basic prayer tutorials for returning Catholics
        rawPhases = rawPhases.sublist(1);
        break;

      case UserPersona.seasonedDevout:
      // All lessons unlocked for exploration
        break;

      case UserPersona.newExplorer:
      default:
      // Standard chronological sequencing
        break;
    }

    // Recalculate node completion statuses and lock states
    return _applyNodeStatuses(rawPhases, completedLessonIds, persona);
  }

  // --- Phase Definitions ---

  static RoadmapPhase _buildPhase1Arrival() {
    return const RoadmapPhase(
      phaseNumber: 1,
      id: 'phase_1_arrival',
      title: 'Phase 1: Arrival',
      subtitle: 'Starting Your Conversation with God',
      goal: 'Pray comfortably today and overcome Mass anxiety.',
      nodes: [
        RoadmapLessonNode(
          id: 'p1_sign_cross',
          title: 'The Sign of the Cross',
          description: 'The ancient doorway to every Catholic prayer.',
          jsonAssetPath: 'assets/data/roadmap/p1_sign_cross.json',
          category: 'Foundations',
        ),
        RoadmapLessonNode(
          id: 'p1_mass_etiquette',
          title: 'Mass Etiquette & Walkthrough',
          description: 'When to sit, stand, kneel, and how to participate seamlessly.',
          jsonAssetPath: 'assets/data/roadmap/p1_mass_etiquette.json',
          category: 'Foundations',
          unlocksRewardDescription: 'Unlocks Visitor Mass Guide Sheet',
        ),
      ],
    );
  }

  static RoadmapPhase _buildPhase2Rhythm(
      String seasonAsset,
      String seasonTitle,
      ) {
    return RoadmapPhase(
      phaseNumber: 2,
      id: 'phase_2_rhythm',
      title: 'Phase 2: Rhythm',
      subtitle: 'Living in Sacred Time & Marian Prayer',
      goal: 'Build a regular prayer rhythm with Our Lady and the Church calendar.',
      nodes: [
        const RoadmapLessonNode(
          id: 'rosary_guide',
          title: 'How to Pray the Holy Rosary',
          description: 'Step-by-step introduction to meditating on the Mysteries.',
          jsonAssetPath: 'assets/lessons/holy_rosary.json',
          category: 'Foundations',
        ),
        RoadmapLessonNode(
          id: 'p2_liturgical_season',
          title: 'Current Liturgical Season: $seasonTitle',
          description: 'How the Church prays today in this season of grace.',
          jsonAssetPath: 'assets/json/lessons/lent_conversion_and_fasting.json',
          category: 'Liturgical Year',
        ),
        // Side Chapel Branch (Apparitions)
        const RoadmapLessonNode(
          id: 'our_lady_guadalupe',
          title: 'Our Lady of Guadalupe',
          description: 'The narrative of Tepeyac Hill and the Tilma.',
          jsonAssetPath: 'assets/json/lessons/our_lady_of_guadalupe_mexico_1531.json',
          category: 'Marian Apparitions',
          nodeType: NodeType.sideChapel,
        ),
        const RoadmapLessonNode(
          id: 'our_lady_fatima',
          title: 'Our Lady of Fátima',
          description: 'The call to prayer, penance, and the First Saturdays.',
          jsonAssetPath: 'assets/json/lessons/our_lady_of_fatima_portugal_1917.json',
          category: 'Marian Apparitions',
          nodeType: NodeType.sideChapel,
        ),
      ],
    );
  }

  static RoadmapPhase _buildPhase3Encounter() {
    return const RoadmapPhase(
      phaseNumber: 3,
      id: 'phase_3_encounter',
      title: 'Phase 3: Encounter',
      subtitle: 'The Sacramental Life',
      goal: 'Understand the channels of grace instituted by Christ.',
      nodes: [
        RoadmapLessonNode(
          id: 'holy_mass_explained',
          title: 'The Holy Mass Explained',
          description: 'Theological breakdown of the Liturgy of the Word and Eucharist.',
          jsonAssetPath: 'assets/json/lessons/holy_mass_explained.json',
          category: 'Devotions',
        ),
        RoadmapLessonNode(
          id: 'sacrament_reconciliation',
          title: 'Sacrament of Reconciliation',
          description: 'Understanding grace, mercy, and absolution.',
          jsonAssetPath: 'assets/json/lessons/sacrament_of_reconciliation.json',
          category: 'Devotions',
          unlocksRewardDescription: 'Unlocks Guided Examination of Conscience Tool',
        ),
        RoadmapLessonNode(
          id: 'eucharistic_adoration',
          title: 'Eucharistic Adoration & Holy Hour',
          description: 'Sitting in silent contemplation before the Real Presence.',
          jsonAssetPath: 'assets/json/lessons/eucharistic_adoration.json',
          category: 'Devotions',
        ),
        // Side Chapel Branch (Sacramentals)
        RoadmapLessonNode(
          id: 'scapulars_and_sacramentals',
          title: 'Brown Scapular & Sacramentals',
          description: 'Sacred signs that dispose us to receive grace.',
          jsonAssetPath: 'assets/json/lessons/scapulars.json',
          category: 'Devotions',
          nodeType: NodeType.sideChapel,
        ),
      ],
    );
  }

  static RoadmapPhase _buildPhase4Foundations() {
    return const RoadmapPhase(
      phaseNumber: 4,
      id: 'phase_4_foundations',
      title: 'Phase 4: Foundations',
      subtitle: 'Catholic Doctrine & Creed',
      goal: 'Explore the intellectual grounds of the Catholic faith.',
      nodes: [
        RoadmapLessonNode(
          id: 'apostles_creed',
          title: 'The Apostles\' Creed',
          description: 'A line-by-line journey through the ancient summary of faith.',
          jsonAssetPath: 'assets/json/lessons/apostles_creed_summary_of_faith.json',
          category: 'Theology',
        ),
        RoadmapLessonNode(
          id: 'holy_trinity',
          title: 'The Mystery of the Holy Trinity',
          description: 'One God in three Divine Persons: Father, Son, and Holy Spirit.',
          jsonAssetPath: 'assets/json/lessons/trinity_one_god_three_persons.json',
          category: 'Theology',
        ),
      ],
    );
  }

  static RoadmapPhase _buildPhase5Deepening() {
    return const RoadmapPhase(
      phaseNumber: 5,
      id: 'phase_5_deepening',
      title: 'Phase 5: Deepening',
      subtitle: 'Marian Dogmas & Church Doctors',
      goal: 'Immerse in higher theology, saintly wisdom, and Church authority.',
      nodes: [
        RoadmapLessonNode(
          id: 'marian_dogmas',
          title: 'The Four Marian Dogmas',
          description: 'Mother of God, Perpetual Virginity, Immaculate Conception, Assumption.',
          jsonAssetPath: 'assets/lessons/marian_dogmas.json',
          category: 'Theology',
        ),
        RoadmapLessonNode(
          id: 'doctors_of_church',
          title: 'Doctors of the Church Overview',
          description: 'Great saints whose writings reshaped Christian intellect.',
          jsonAssetPath: 'assets/lessons/doctors_overview.json',
          category: 'History',
        ),
      ],
    );
  }

  // Dynamic helper to resolve node lock states and completion indicators
  static List<RoadmapPhase> _applyNodeStatuses(
      List<RoadmapPhase> phases,
      Set<String> completedIds,
      UserPersona persona,
      ) {
    bool previousPhaseCompleted = true;

    return phases.asMap().entries.map((entry) {
      final phaseIndex = entry.key;
      final phase = entry.value;

      bool previousMainSpineNodeCompleted = true;

      final updatedNodes = phase.nodes.map((node) {
        // 1. Explicitly check if node ID exists in completed set
        final isCompleted = completedIds.contains(node.id);

        if (isCompleted) {
          if (node.nodeType == NodeType.mainSpine) {
            previousMainSpineNodeCompleted = true;
          }
          return node.copyWith(status: NodeStatus.completed);
        }

        // 2. Seasoned Devout has everything unlocked in progress state
        if (persona == UserPersona.seasonedDevout) {
          return node.copyWith(status: NodeStatus.inProgress);
        }

        // 3. Side Chapels are available if the phase itself is unlocked
        if (node.nodeType == NodeType.sideChapel) {
          if (previousPhaseCompleted || phaseIndex == 0) {
            return node.copyWith(status: NodeStatus.inProgress);
          }
          return node.copyWith(status: NodeStatus.locked);
        }

        // 4. Main Spine sequential progression
        if ((previousPhaseCompleted || phaseIndex == 0) && previousMainSpineNodeCompleted) {
          previousMainSpineNodeCompleted = false; // Next uncompleted node gets unlocked
          return node.copyWith(status: NodeStatus.inProgress);
        }

        return node.copyWith(status: NodeStatus.locked);
      }).toList();

      final updatedPhase = RoadmapPhase(
        phaseNumber: phase.phaseNumber,
        id: phase.id,
        title: phase.title,
        subtitle: phase.subtitle,
        goal: phase.goal,
        nodes: updatedNodes,
      );

      // Phase is considered completed if all MAIN SPINE nodes in it are finished
      final mainSpineNodes = updatedPhase.nodes.where((n) => n.nodeType == NodeType.mainSpine);
      previousPhaseCompleted = mainSpineNodes.every((n) => n.status == NodeStatus.completed);

      return updatedPhase;
    }).toList();
  }
}