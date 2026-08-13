import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('operation_001_v2.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    // 1. Prayer History Table
    await db.execute('''
      CREATE TABLE prayer_logs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        prayer_type TEXT NOT NULL,
        prayer_name TEXT NOT NULL,
        completed_at TEXT NOT NULL,
        date_only TEXT NOT NULL
      )
    ''');

    // 2. Intentions & Petitions Table
    await db.execute('''
      CREATE TABLE prayer_intentions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        category TEXT NOT NULL,
        is_answered INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL,
        answered_at TEXT
      )
    ''');
  }

  // ================= PRAYER LOGS & TRACKING =================

  Future<void> logPrayerCompletion({
    required String prayerType,
    required String prayerName,
  }) async {
    final db = await instance.database;
    final now = DateTime.now();
    final dateOnly = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    await db.insert('prayer_logs', {
      'prayer_type': prayerType,
      'prayer_name': prayerName,
      'completed_at': now.toIso8601String(),
      'date_only': dateOnly,
    });
  }

  /// Get total accumulated count
  Future<int> getTotalPrayersCount() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT COUNT(*) as count FROM prayer_logs');
    return Sqflite.firstIntValue(result) ?? 0;
  }

  /// Accurate Streak Calculation (Consecutive distinct calendar days)
  Future<int> calculateStreak() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT DISTINCT date_only FROM prayer_logs ORDER BY date_only DESC
    ''');

    if (maps.isEmpty) return 0;

    final List<String> dates = maps.map((e) => e['date_only'] as String).toList();
    final DateTime now = DateTime.now();
    final String todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    final String yesterdayStr = "${now.subtract(const Duration(days: 1)).year}-${now.subtract(const Duration(days: 1)).month.toString().padLeft(2, '0')}-${now.subtract(const Duration(days: 1)).day.toString().padLeft(2, '0')}";

    // Check if streak is active (logged either today or yesterday)
    if (!dates.contains(todayStr) && !dates.contains(yesterdayStr)) {
      return 0;
    }

    int streak = 0;
    DateTime checkDate = dates.contains(todayStr) ? now : now.subtract(const Duration(days: 1));

    while (true) {
      final dateFormatted = "${checkDate.year}-${checkDate.month.toString().padLeft(2, '0')}-${checkDate.day.toString().padLeft(2, '0')}";
      if (dates.contains(dateFormatted)) {
        streak++;
        checkDate = checkDate.subtract(const Duration(days: 1));
      } else {
        break;
      }
    }

    return streak;
  }

  /// Filtered History Retrieval
  Future<List<Map<String, dynamic>>> getFilteredPrayerHistory(String filter) async {
    final db = await instance.database;
    final now = DateTime.now();

    String query = "SELECT * FROM prayer_logs ";
    List<dynamic> args = [];

    if (filter == 'today') {
      final todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
      query += "WHERE date_only = ?";
      args.add(todayStr);
    } else if (filter == 'yesterday') {
      final yesterday = now.subtract(const Duration(days: 1));
      final yestStr = "${yesterday.year}-${yesterday.month.toString().padLeft(2, '0')}-${yesterday.day.toString().padLeft(2, '0')}";
      query += "WHERE date_only = ?";
      args.add(yestStr);
    } else if (filter == 'last_week') {
      final weekAgo = now.subtract(const Duration(days: 7)).toIso8601String();
      query += "WHERE completed_at >= ?";
      args.add(weekAgo);
    } else if (filter == 'last_month') {
      final monthAgo = now.subtract(const Duration(days: 30)).toIso8601String();
      query += "WHERE completed_at >= ?";
      args.add(monthAgo);
    }

    query += " ORDER BY id DESC";
    return await db.rawQuery(query, args);
  }

  /// Reset today's prayers safely
  Future<void> resetTodaysPrayers() async {
    final db = await instance.database;
    final now = DateTime.now();
    final todayStr = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    await db.delete(
      'prayer_logs',
      where: 'date_only = ?',
      whereArgs: [todayStr],
    );
  }

  // ================= PRAYER INTENTIONS & PETITIONS =================

  Future<void> addIntention(String title, String category) async {
    final db = await instance.database;
    await db.insert('prayer_intentions', {
      'title': title,
      'category': category,
      'is_answered': 0,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  Future<List<Map<String, dynamic>>> getIntentions({required String category}) async {
    final db = await instance.database;
    return await db.query(
      'prayer_intentions',
      where: 'category = ? OR category = ?',
      whereArgs: [category, 'General'],
      orderBy: 'is_answered ASC, id DESC',
    );
  }

  Future<void> toggleIntentionAnswered(int id, bool isAnswered) async {
    final db = await instance.database;
    await db.update(
      'prayer_intentions',
      {
        'is_answered': isAnswered ? 1 : 0,
        'answered_at': isAnswered ? DateTime.now().toIso8601String() : null,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteIntention(int id) async {
    final db = await instance.database;
    await db.delete('prayer_intentions', where: 'id = ?', whereArgs: [id]);
  }
}