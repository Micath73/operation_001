import 'dart:convert';
import 'package:http/http.dart' as http;
import 'daily_reading_model.dart';
import 'readings_database_helper.dart';

class ReadingsService {
  final ReadingsDatabaseHelper _dbHelper = ReadingsDatabaseHelper.instance;

  /// Core Cache-First Fetch Engine 🧠
  /// 1. Checks local SQLite database first (100% Offline) 📴
  /// 2. If missing, fetches from API 🌐
  /// 3. Saves network response into SQLite cache for future offline access 💾
  Future<DailyReading?> getReadingForDate(DateTime date) async {
    // Format date string as YYYY-MM-DD
    final String dateKey =
        "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

    // Step 1: Check Local Database Cache
    DailyReading? localReading = await _dbHelper.getReadingByDate(dateKey);

    if (localReading != null) {
      // Cache Hit! Returning local data immediately ⚡
      return localReading;
    }

    // Step 2: Cache Miss - Attempt REST API Fetch 🌐
    try {
      final remoteReading = await _fetchFromApi(dateKey);

      if (remoteReading != null) {
        // Step 3: Save fetched data to SQLite for future offline use 💾
        await _dbHelper.insertReading(remoteReading);
        return remoteReading;
      }
    } catch (e) {
      // Handles network error/no internet gracefully
      return null;
    }

    return null;
  }

  /// Private method to handle the raw HTTP request
  Future<DailyReading?> _fetchFromApi(String dateKey) async {
    final url = Uri.parse('https://a-catholic-readings-api.example.com/readings/$dateKey');

    final response = await http.get(url).timeout(
      const Duration(seconds: 8),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return DailyReading.fromJson(jsonData);
    }

    return null;
  }
}