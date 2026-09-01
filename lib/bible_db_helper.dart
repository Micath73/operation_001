import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:operation_001/bible_model.dart';

class BibleDatabaseHelper {
  static final BibleDatabaseHelper instance = BibleDatabaseHelper._init();
  static Database? _database;
  static String? _currentCustomDbPath;

  BibleDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null && _database!.isOpen) return _database!;

    // If a custom downloaded DB path is active and valid, use it
    if (_currentCustomDbPath != null &&
        File(_currentCustomDbPath!).existsSync()) {
      _database = await openDatabase(_currentCustomDbPath!, version: 1);
      return _database!;
    }

    _database = await _initBibleDB();
    return _database!;
  }

  Future<Database> _initBibleDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bible.db');

    final exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
        ByteData data = await rootBundle.load('assets/db/bible.db');
        List<int> bytes = data.buffer.asUint8List(
          data.offsetInBytes,
          data.lengthInBytes,
        );
        await File(path).writeAsBytes(bytes, flush: true);
      } catch (e) {
        // Fallback or log if asset copy fails
      }
    }

    return await openDatabase(path, version: 1);
  }

  /// Switches active connection to a downloaded DB file path
  Future<void> openDownloadedDatabase(String fullPath) async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
    }
    _currentCustomDbPath = fullPath;
    _database = await openDatabase(fullPath, version: 1);
  }

  /// Resets active connection back to default bundled database
  Future<void> resetToDefaultDatabase() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
    }
    _currentCustomDbPath = null;
    _database = await _initBibleDB();
  }

  /// Resolves exact table name depending on bundled or custom DB format
  Future<String> _getVersesTableName(Database db) async {
    try {
      await db.query('CPDV_verses', limit: 1);
      return 'CPDV_verses';
    } catch (_) {
      return 'verses';
    }
  }

  /// Resolves exact books table name
  Future<String> _getBooksTableName(Database db) async {
    try {
      await db.query('CPDV_books', limit: 1);
      return 'CPDV_books';
    } catch (_) {
      return 'books';
    }
  }

  /// Fetches all 73 books ordered by ID
  Future<List<Map<String, dynamic>>> getBooks() async {
    final db = await instance.database;
    final tableName = await _getBooksTableName(db);
    return await db.query(tableName, orderBy: 'id ASC');
  }

  /// Fetches all unique available chapters for a specific book ID
  Future<List<int>> getChaptersForBook(int bookId) async {
    final db = await instance.database;
    final tableName = await _getVersesTableName(db);

    final List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT DISTINCT chapter FROM $tableName WHERE book_id = ? ORDER BY chapter ASC',
      [bookId],
    );
    return maps.map((m) => m['chapter'] as int).toList();
  }

  /// Fetches verses for a given book and chapter
  Future<List<BibleVerse>> getChapterVerses(int bookId, int chapter) async {
    final db = await instance.database;
    final tableName = await _getVersesTableName(db);

    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'book_id = ? AND chapter = ?',
      whereArgs: [bookId, chapter],
      orderBy: 'verse ASC',
    );

    return maps.map((map) => BibleVerse.fromMap(map)).toList();
  }

  /// Searches verses matching query text across active database
  Future<List<BibleVerse>> searchVerses(String query, bool isAmharic) async {
    if (query.trim().isEmpty) return [];

    final db = await instance.database;
    final tableName = await _getVersesTableName(db);

    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'text LIKE ?',
      whereArgs: ['%$query%'],
      limit: 50,
    );

    return maps.map((map) => BibleVerse.fromMap(map)).toList();
  }
}