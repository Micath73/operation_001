import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'daily_reading_model.dart';

class ReadingsDatabaseHelper {
  static final ReadingsDatabaseHelper instance =
  ReadingsDatabaseHelper._init();
  static Database? _database;

  ReadingsDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('readings_cache.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
      onUpgrade: _onUpgradeDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE daily_readings (
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

    // Index on date column for sub-millisecond lookup performance
    await db.execute(
      'CREATE INDEX IF NOT EXISTS idx_daily_readings_date ON daily_readings(date)',
    );

    await _seedInitialData(db);
  }

  Future<void> _onUpgradeDB(
      Database db,
      int oldVersion,
      int newVersion,
      ) async {
    if (oldVersion < 2) {
      // Create index for existing databases migrating from v1
      await db.execute(
        'CREATE INDEX IF NOT EXISTS idx_daily_readings_date ON daily_readings(date)',
      );
    }
  }

  Future<void> _seedInitialData(Database db) async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/json/default_readings.json',
      );
      final List<dynamic> jsonList = jsonDecode(jsonString);

      final batch = db.batch();
      for (final item in jsonList) {
        if (item is Map<String, dynamic>) {
          final reading = DailyReading.fromMap(item);
          batch.insert(
            'daily_readings',
            reading.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        }
      }
      await batch.commit(noResult: true);
    } catch (e) {
      if (kDebugMode) {
        print("⚠️ [SEED FAILED] Could not pre-load initial JSON readings: $e");
      }
    }
  }

  /// Inserts or updates a single reading in SQLite.
  Future<void> insertReading(DailyReading reading) async {
    final db = await database;
    await db.insert(
      'daily_readings',
      reading.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Batch inserts multiple readings in a single atomic transaction.
  Future<void> insertBatchReadings(List<DailyReading> readings) async {
    if (readings.isEmpty) return;
    final db = await database;
    final batch = db.batch();

    for (final reading in readings) {
      batch.insert(
        'daily_readings',
        reading.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  /// Fetches reading by ISO date string (YYYY-MM-DD).
  Future<DailyReading?> getReadingByDate(String date) async {
    final db = await database;
    final maps = await db.query(
      'daily_readings',
      where: 'date = ?',
      whereArgs: [date],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return DailyReading.fromMap(maps.first);
    }
    return null;
  }

  /// Clears database cache and optionally re-seeds default readings from assets.
  Future<void> clearReadingsCache({bool reseedDefaultData = true}) async {
    final db = await database;
    await db.delete('daily_readings');
    if (reseedDefaultData) {
      await _seedInitialData(db);
    }
  }

  /// Closes database connection safely on app shutdown.
  Future<void> close() async {
    final db = _database;
    if (db != null && db.isOpen) {
      await db.close();
      _database = null;
    }
  }
}