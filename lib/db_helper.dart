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
      version: 6, // Bumped to 6 for favorite_quotes table
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
    await _createNovenaProgressTable(db);
    await _createFavoriteQuotesTable(db);
    await _createIndexes(db);
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
    if (oldVersion < 4) {
      await _createNovenaProgressTable(db);
    }
    if (oldVersion < 5) {
      await _createIndexes(db);
    }
    if (oldVersion < 6) {
      await _createFavoriteQuotesTable(db);
    }
  }

  Future<void> _createIndexes(Database db) async {
    // Accelerates novena query filtering and title lookups
    await db.execute('''
      CREATE INDEX IF NOT EXISTS idx_novena_title_completed 
      ON novena_progress(novena_title, is_completed)
    ''');

    // Accelerates streak calculation and log filtering
    await db.execute('''
      CREATE INDEX IF NOT EXISTS idx_prayer_logs_completed_at 
      ON prayer_logs(completed_at)
    ''');
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

  Future<void> _createNovenaProgressTable(Database db) async {
    await db.execute('''
      CREATE TABLE novena_progress (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        novena_title TEXT NOT NULL,
        day_number INTEGER NOT NULL,
        is_completed INTEGER NOT NULL DEFAULT 0,
        completed_at TEXT,
        UNIQUE(novena_title, day_number) ON CONFLICT REPLACE
      )
    ''');
  }

  Future<void> _createFavoriteQuotesTable(Database db) async {
    await db.execute('''
      CREATE TABLE favorite_quotes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT NOT NULL UNIQUE,
        author TEXT NOT NULL
      )
    ''');
  }

  // --- FAVORITE QUOTES METHODS ---

  Future<int> insertFavoriteQuote(String text, String author) async {
    final db = await instance.database;
    return await db.insert(
      'favorite_quotes',
      {
        'text': text,
        'author': author,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> removeFavoriteQuote(String text) async {
    final db = await instance.database;
    return await db.delete(
      'favorite_quotes',
      where: 'text = ?',
      whereArgs: [text],
    );
  }

  Future<bool> isQuoteFavorite(String text) async {
    final db = await instance.database;
    final result = await db.query(
      'favorite_quotes',
      where: 'text = ?',
      whereArgs: [text],
    );
    return result.isNotEmpty;
  }

  Future<List<Map<String, dynamic>>> getFavoriteQuotes() async {
    final db = await instance.database;
    return await db.query('favorite_quotes', orderBy: 'id DESC');
  }

  // --- OPTIMIZED NOVENA PROGRESS METHODS ---

  /// Toggle or update completion status for a day
  Future<void> setNovenaDayCompletion({
    required String novenaTitle,
    required int dayNumber,
    required bool isCompleted,
  }) async {
    final db = await instance.database;
    await db.insert(
      'novena_progress',
      {
        'novena_title': novenaTitle,
        'day_number': dayNumber,
        'is_completed': isCompleted ? 1 : 0,
        'completed_at': isCompleted ? DateTime.now().toIso8601String() : null,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    if (isCompleted) {
      await logPrayerCompletion(
        prayerType: 'Novena',
        prayerName: '$novenaTitle - Day $dayNumber',
      );
    }
  }

  /// Check if a specific day is completed
  Future<bool> isNovenaDayCompleted(String novenaTitle, int dayNumber) async {
    final db = await instance.database;
    final maps = await db.query(
      'novena_progress',
      columns: ['is_completed'],
      where: 'LOWER(novena_title) = LOWER(?) AND day_number = ?',
      whereArgs: [novenaTitle.trim(), dayNumber],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return (maps.first['is_completed'] as int) == 1;
    }
    return false;
  }

  /// Get set of completed day numbers
  Future<Set<int>> getCompletedDaysForNovena(String novenaTitle) async {
    final db = await instance.database;
    final maps = await db.query(
      'novena_progress',
      columns: ['day_number'],
      where: 'LOWER(novena_title) = LOWER(?) AND is_completed = 1',
      whereArgs: [novenaTitle.trim()],
    );

    return maps.map((row) => row['day_number'] as int).toSet();
  }

  /// Get total completed days (e.g., 4 out of 9)
  Future<int> getNovenaCompletedCount(String novenaTitle) async {
    final db = await instance.database;
    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM novena_progress WHERE LOWER(novena_title) = LOWER(?) AND is_completed = 1',
      [novenaTitle.trim()],
    );
    return Sqflite.firstIntValue(result) ?? 0;
  }

  /// Fetches titles of novenas that have at least one completed day
  Future<List<String>> getActiveNovenaTitles() async {
    final db = await instance.database;
    final result = await db.rawQuery(
      'SELECT DISTINCT novena_title FROM novena_progress WHERE is_completed = 1',
    );
    return result.map((row) => row['novena_title'] as String).toList();
  }

  /// OPTIMIZED: Fetches all IN-PROGRESS novenas in 1 single database query
  Future<List<Map<String, dynamic>>> getActiveNovenasOverview() async {
    final db = await instance.database;

    final result = await db.rawQuery('''
      SELECT 
        novena_title as title,
        SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) as completedDays
      FROM novena_progress
      GROUP BY novena_title
      HAVING completedDays > 0 AND completedDays < 9
    ''');

    return result.map((row) {
      return {
        'title': row['title'] as String,
        'completedDays': row['completedDays'] as int,
        'totalDays': 9,
      };
    }).toList();
  }

  /// OPTIMIZED: Fetches all FULLY COMPLETED novenas in 1 single database query
  Future<List<Map<String, dynamic>>> getCompletedNovenasOverview() async {
    final db = await instance.database;

    final result = await db.rawQuery('''
      SELECT 
        novena_title as title,
        SUM(CASE WHEN is_completed = 1 THEN 1 ELSE 0 END) as completedDays
      FROM novena_progress
      GROUP BY novena_title
      HAVING completedDays >= 9
    ''');

    return result.map((row) {
      return {
        'title': row['title'] as String,
        'completedDays': row['completedDays'] as int,
        'totalDays': 9,
      };
    }).toList();
  }

  /// Reset novena progress and purge its prayer logs completely
  Future<int> resetNovenaProgress(String novenaTitle) async {
    final db = await instance.database;
    final cleanTitle = novenaTitle.trim();

    await db.delete(
      'prayer_logs',
      where: 'prayer_type = ? AND LOWER(prayer_name) LIKE LOWER(?)',
      whereArgs: ['Novena', '$cleanTitle - Day%'],
    );

    return await db.delete(
      'novena_progress',
      where: 'LOWER(novena_title) = LOWER(?)',
      whereArgs: [cleanTitle],
    );
  }

  /// Alias method for clearing novena progress
  Future<int> clearNovenaProgress(String novenaTitle) async {
    return await resetNovenaProgress(novenaTitle);
  }

  /// OPTIMIZED: Clears ALL in-progress novenas inside a single Transaction
  Future<void> clearAllInProgressNovenas() async {
    final db = await instance.database;
    final activeList = await getActiveNovenasOverview();

    await db.transaction((txn) async {
      for (var novena in activeList) {
        final cleanTitle = (novena['title'] as String).trim();
        await txn.delete(
          'prayer_logs',
          where: 'prayer_type = ? AND LOWER(prayer_name) LIKE LOWER(?)',
          whereArgs: ['Novena', '$cleanTitle - Day%'],
        );
        await txn.delete(
          'novena_progress',
          where: 'LOWER(novena_title) = LOWER(?)',
          whereArgs: [cleanTitle],
        );
      }
    });
  }

  /// OPTIMIZED: Clears ALL completed novenas inside a single Transaction
  Future<void> clearAllCompletedNovenas() async {
    final db = await instance.database;
    final completedList = await getCompletedNovenasOverview();

    await db.transaction((txn) async {
      for (var novena in completedList) {
        final cleanTitle = (novena['title'] as String).trim();
        await txn.delete(
          'prayer_logs',
          where: 'prayer_type = ? AND LOWER(prayer_name) LIKE LOWER(?)',
          whereArgs: ['Novena', '$cleanTitle - Day%'],
        );
        await txn.delete(
          'novena_progress',
          where: 'LOWER(novena_title) = LOWER(?)',
          whereArgs: [cleanTitle],
        );
      }
    });
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
      limit: 1,
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
      final lastMonth =
      now.subtract(const Duration(days: 30)).toIso8601String();
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
    final startOfDay =
    DateTime(now.year, now.month, now.day).toIso8601String();
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