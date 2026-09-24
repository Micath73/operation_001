import 'package:shared_preferences/shared_preferences.dart';
import '../models/roadmap_models.dart';

class RoadmapPreferencesService {
  static const String _keyPersona = 'pilgrim_user_persona';
  static const String _keyCompletedLessons = 'pilgrim_completed_lessons';
  static const String _keyActiveDaysCount = 'pilgrim_active_days_count';

  /// Save the user's selected starting persona.
  static Future<void> saveUserPersona(UserPersona persona) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyPersona, persona.name);
  }

  /// Load stored persona or return default [UserPersona.newExplorer].
  static Future<UserPersona> getUserPersona() async {
    final prefs = await SharedPreferences.getInstance();
    final String? personaName = prefs.getString(_keyPersona);
    if (personaName == null) return UserPersona.newExplorer;

    return UserPersona.values.firstWhere(
          (e) => e.name == personaName,
      orElse: () => UserPersona.newExplorer,
    );
  }

  /// Save completed lesson IDs list.
  static Future<void> saveCompletedLesson(String lessonId) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> current = prefs.getStringList(_keyCompletedLessons) ?? [];
    if (!current.contains(lessonId)) {
      current.add(lessonId);
      await prefs.setStringList(_keyCompletedLessons, current);
    }
  }

  /// Get set of completed lesson IDs.
  static Future<Set<String>> getCompletedLessonIds() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? list = prefs.getStringList(_keyCompletedLessons);
    return list != null ? list.toSet() : {};
  }

  /// Resets and clears all completed lesson IDs.
  static Future<void> clearCompletedLessons() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyCompletedLessons);
  }

  /// Completely clears roadmap preferences (persona & progress).
  static Future<void> resetAllData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyPersona);
    await prefs.remove(_keyCompletedLessons);
    await prefs.remove(_keyActiveDaysCount);
  }
}