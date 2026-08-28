import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'daily_reading_model.dart';

class ReadingsDatabaseHelper {
  static final ReadingsDatabaseHelper instance = ReadingsDatabaseHelper._init();
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
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE daily_readings (
        date TEXT PRIMARY KEY,
        liturgicalTitle TEXT NOT NULL,
        liturgicalColor TEXT NOT NULL,
        firstReadingTitle TEXT NOT NULL,
        firstReadingText TEXT NOT NULL,
        psalmResponse TEXT NOT NULL,
        psalmText TEXT NOT NULL,
        secondReadingTitle TEXT,
        secondReadingText TEXT,
        gospelAcclamation TEXT NOT NULL,
        gospelTitle TEXT NOT NULL,
        gospelText TEXT NOT NULL
      )
    ''');
  }

  // Insert or update a single reading in local cache
  Future<void> insertReading(DailyReading reading) async {
    final db = await instance.database;
    await db.insert(
      'daily_readings',
      reading.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Insert a full batch (e.g. 7 to 30 days) using a fast transaction batch
  Future<void> insertBatchReadings(List<DailyReading> readings) async {
    final db = await instance.database;
    final batch = db.batch();
    for (final reading in readings) {
      batch.insert(
        'daily_readings',
        reading.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  // Fetch a reading by date string (Format: YYYY-MM-DD)
  Future<DailyReading?> getReadingByDate(String date) async {
    final db = await instance.database;
    final maps = await db.query(
      'daily_readings',
      where: 'date = ?',
      whereArgs: [date],
    );

    if (maps.isNotEmpty) {
      return DailyReading.fromJson(maps.first);
    } else {
      return null; // Return null on cache miss
    }
  }
}