import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:operation_001/quote.dart';

class QuoteService {
  static Future<Quote> getTodayQuote() async {
    try {
      final String response =
      await rootBundle.loadString('assets/json/quotes.json');
      final List<dynamic> data = jsonDecode(response);

      if (data.isEmpty) {
        return _fallbackQuote();
      }

      // Calculate current day number of the year (1..365/366)
      final now = DateTime.now();
      final startOfYear = DateTime(now.year, 1, 1);
      final dayOfYear = now.difference(startOfYear).inDays + 1;

      // Wrap around using modulo arithmetic
      final index = dayOfYear % data.length;

      return Quote(
        text: data[index]['text'] as String,
        author: data[index]['author'] as String,
      );
    } catch (_) {
      return _fallbackQuote();
    }
  }

  static Quote _fallbackQuote() {
    return Quote(
      text: 'Be not afraid, for I am with you always.',
      author: 'Isaiah 41:10',
    );
  }
}