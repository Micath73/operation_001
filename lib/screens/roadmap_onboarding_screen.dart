import 'package:flutter/material.dart';
import '../models/roadmap_models.dart';
import '../services/roadmap_preferences_service.dart';

class RoadmapOnboardingScreen extends StatefulWidget {
  final Function(UserPersona persona) onPersonaSelected;

  const RoadmapOnboardingScreen({
    super.key,
    required this.onPersonaSelected,
  });

  @override
  State<RoadmapOnboardingScreen> createState() => _RoadmapOnboardingScreenState();
}

class _RoadmapOnboardingScreenState extends State<RoadmapOnboardingScreen> {
  UserPersona? _selectedPersona;

  final Map<UserPersona, Map<String, String>> _personaDetails = {
    UserPersona.newExplorer: {
      'title': 'New to Catholicism / Exploring',
      'subtitle': 'Start from scratch with basic prayers, Mass orientation, and fundamental theology.',
    },
    UserPersona.ociaCandidate: {
      'title': 'Preparing to Enter Church (OCIA)',
      'subtitle': 'Prioritizes Sacramental formation and Eucharist preparation for Easter Vigil.',
    },
    UserPersona.returningCatholic: {
      'title': 'Returning Catholic',
      'subtitle': 'Skips basic prayer tutorials and opens directly into liturgical rhythm and sacraments.',
    },
    UserPersona.seasonedDevout: {
      'title': 'Practicing / Deepening Faith',
      'subtitle': 'All phases unlocked as a structured recommendation and study engine.',
    },
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Begin Your Journey'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Where are you starting from?',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'We will tailor your Pilgrim Trail to match your state in life and sacramental needs.',
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: UserPersona.values.map((persona) {
                  final info = _personaDetails[persona]!;
                  final isSelected = _selectedPersona == persona;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedPersona = persona;
                        });
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : Colors.grey[300]!,
                            width: isSelected ? 2 : 1,
                          ),
                          color: isSelected
                              ? theme.colorScheme.primary.withValues(alpha: 0.05)
                              : Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            Radio<UserPersona>(
                              value: persona,
                              groupValue: _selectedPersona,
                              onChanged: (val) {
                                if (val != null) setState(() => _selectedPersona = val);
                              },
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    info['title']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    info['subtitle']!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _selectedPersona == null
                    ? null
                    : () async {
                  await RoadmapPreferencesService.saveUserPersona(_selectedPersona!);
                  widget.onPersonaSelected(_selectedPersona!);
                },
                child: const Text('Set Pilgrim Path'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}