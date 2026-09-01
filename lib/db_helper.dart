import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('prayers.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 3,
      onCreate: _createDB,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE prayer_logs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        prayer_type TEXT NOT NULL,
        prayer_name TEXT NOT NULL,
        completed_at TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE intentions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category TEXT NOT NULL,
        intention TEXT NOT NULL,
        is_answered INTEGER NOT NULL DEFAULT 0,
        created_at TEXT NOT NULL
      )
    ''');

    await _createReadingsTable(db);
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await _createReadingsTable(db);
    }
    if (oldVersion < 3) {
      await db.execute(
        'ALTER TABLE readings ADD COLUMN gospelAcclamation TEXT',
      );
    }
  }

  Future<void> _createReadingsTable(Database db) async {
    await db.execute('''
      CREATE TABLE readings (
        id TEXT PRIMARY KEY,
        date TEXT NOT NULL,
        liturgicalTitle TEXT NOT NULL,
        liturgicalColor TEXT NOT NULL,
        firstReadingTitle TEXT NOT NULL,
        firstReadingText TEXT NOT NULL,
        psalmResponse TEXT NOT NULL,
        psalmText TEXT NOT NULL,
        secondReadingTitle TEXT,
        secondReadingText TEXT,
        gospelAcclamation TEXT,
        gospelTitle TEXT NOT NULL,
        gospelText TEXT NOT NULL
      )
    ''');
  }

  // --- DAILY READINGS METHODS ---

  Future<int> insertReading(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert(
      'readings',
      row,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getReadingByDate(String date) async {
    final db = await instance.database;
    final maps = await db.query(
      'readings',
      where: 'date = ?',
      whereArgs: [date],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  // --- PRAYER LOGS & INTENTIONS METHODS ---

  Future<int> logPrayerCompletion({
    required String prayerType,
    required String prayerName,
  }) async {
    final db = await instance.database;
    return await db.insert('prayer_logs', {
      'prayer_type': prayerType,
      'prayer_name': prayerName,
      'completed_at': DateTime.now().toIso8601String(),
    });
  }

  Future<int> getTotalPrayersCount() async {
    final db = await instance.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM prayer_logs',
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  Future<int> calculateStreak() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT DISTINCT DATE(completed_at) as date 
      FROM prayer_logs 
      ORDER BY date DESC
    ''');

    if (maps.isEmpty) return 0;

    int streak = 0;
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime expectedDate = today;

    final firstLoggedDate = DateTime.parse(maps.first['date']);
    if (firstLoggedDate.isBefore(today)) {
      expectedDate = today.subtract(const Duration(days: 1));
      if (firstLoggedDate.isBefore(expectedDate)) return 0;
    }

    for (var map in maps) {
      final logDate = DateTime.parse(map['date']);
      if (logDate.year == expectedDate.year &&
          logDate.month == expectedDate.month &&
          logDate.day == expectedDate.day) {
        streak++;
        expectedDate = expectedDate.subtract(const Duration(days: 1));
      } else {
        break;
      }
    }
    return streak;
  }

  Future<List<Map<String, dynamic>>> getFilteredPrayerHistory(
      String filter,
      ) async {
    final db = await instance.database;
    DateTime now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);
    String whereClause = '';
    List<dynamic> whereArgs = [];

    if (filter == 'today') {
      whereClause = 'completed_at >= ?';
      whereArgs = [todayStart.toIso8601String()];
    } else if (filter == 'yesterday') {
      final startOfYesterday = todayStart.subtract(const Duration(days: 1));
      whereClause = 'completed_at >= ? AND completed_at < ?';
      whereArgs = [
        startOfYesterday.toIso8601String(),
        todayStart.toIso8601String(),
      ];
    } else if (filter == 'last_week') {
      final lastWeek = now.subtract(const Duration(days: 7)).toIso8601String();
      whereClause = 'completed_at >= ?';
      whereArgs = [lastWeek];
    } else if (filter == 'last_month') {
      final lastMonth = now.subtract(const Duration(days: 30)).toIso8601String();
      whereClause = 'completed_at >= ?';
      whereArgs = [lastMonth];
    }

    return await db.query(
      'prayer_logs',
      where: whereClause.isEmpty ? null : whereClause,
      whereArgs: whereArgs.isEmpty ? null : whereArgs,
      orderBy: 'completed_at DESC',
    );
  }

  Future<int> resetTodaysPrayers() async {
    final db = await instance.database;
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day).toIso8601String();
    return await db.delete(
      'prayer_logs',
      where: 'completed_at >= ?',
      whereArgs: [startOfDay],
    );
  }

  Future<List<Map<String, dynamic>>> getIntentions({
    required String category,
  }) async {
    final db = await instance.database;
    return await db.query(
      'intentions',
      where: 'category = ?',
      whereArgs: [category],
      orderBy: 'created_at DESC',
    );
  }

  Future<int> addIntention({
    required String category,
    required String intention,
  }) async {
    final db = await instance.database;
    return await db.insert('intentions', {
      'category': category,
      'intention': intention,
      'is_answered': 0,
      'created_at': DateTime.now().toIso8601String(),
    });
  }

  Future<int> toggleIntentionAnswered(int id, bool isAnswered) async {
    final db = await instance.database;
    return await db.update(
      'intentions',
      {'is_answered': isAnswered ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteIntention(int id) async {
    final db = await instance.database;
    return await db.delete('intentions', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> close() async {
    final db = await instance.database;
    await db.close();
    _database = null;
  }
}