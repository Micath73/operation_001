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

    // If a custom downloaded DB is selected, open that instead
    if (_currentCustomDbPath != null && File(_currentCustomDbPath!).existsSync()) {
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

    if (exists) {
      print('DEBUG: Deleting existing cached database...');
      await deleteDatabase(path);
    }

    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (e) {
      print('DEBUG: Directory creation error: $e');
    }

    print('DEBUG: Copying fresh database from assets/db/bible.db...');
    try {
      // Direct POSIX string path for Flutter asset bundle loading
      ByteData data = await rootBundle.load('assets/db/bible.db');
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
      print('DEBUG: Database copied successfully! Size: ${bytes.length} bytes.');
    } catch (e) {
      print('DEBUG: ERROR copying asset database: $e');
    }

    return await openDatabase(path, version: 1);
  }

  /// Switches the active database connection to a downloaded DB file path
  Future<void> openDownloadedDatabase(String fullPath) async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
    }
    _currentCustomDbPath = fullPath;
    _database = await openDatabase(fullPath, version: 1);
    print('DEBUG: Switched active database to: $fullPath');
  }

  /// Resets the active database back to the default bundled assets database
  Future<void> resetToDefaultDatabase() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
    }
    _currentCustomDbPath = null;
    _database = await _initBibleDB();
    print('DEBUG: Reset database back to default bundled asset.');
  }

  /// Fetches all 73 books ordered by their database ID
  Future<List<Map<String, dynamic>>> getBooks() async {
    final db = await instance.database;
    final results = await db.query('CPDV_books', orderBy: 'id ASC');
    print('DEBUG: Fetched ${results.length} books from CPDV_books table.');
    return results;
  }

  /// Fetches all unique available chapters for a specific book ID
  Future<List<int>> getChaptersForBook(int bookId) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT DISTINCT chapter FROM CPDV_verses WHERE book_id = ? ORDER BY chapter ASC',
      [bookId],
    );
    return maps.map((m) => m['chapter'] as int).toList();
  }

  Future<List<BibleVerse>> getChapterVerses(int bookId, int chapter) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query(
      'CPDV_verses',
      where: 'book_id = ? AND chapter = ?',
      whereArgs: [bookId, chapter],
      orderBy: 'verse ASC',
    );

    return maps.map((map) => BibleVerse.fromMap(map)).toList();
  }

  Future<List<BibleVerse>> searchVerses(String query, bool isAmharic) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query(
      'CPDV_verses',
      where: 'text LIKE ?',
      whereArgs: ['%$query%'],
      limit: 50,
    );

    return maps.map((map) => BibleVerse.fromMap(map)).toList();
  }
}