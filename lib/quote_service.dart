import 'dart:convert';
import 'package:flutter/foundation.dart';
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
      final rawItem = data[index];

      if (rawItem is Map<String, dynamic>) {
        // Safe extraction supporting multiple common JSON key variations
        final String text = (rawItem['text'] ??
            rawItem['quote'] ??
            rawItem['content'] ??
            'Be not afraid, for I am with you always.')
            .toString();

        final String author = (rawItem['author'] ??
            rawItem['verse'] ??
            rawItem['reference'] ??
            'Isaiah 41:10')
            .toString();

        if (text.isNotEmpty) {
          return Quote(text: text, author: author);
        }
      }

      return _fallbackQuote();
    } catch (e, stack) {
      debugPrint("⚠️ QuoteService JSON Error on today's quote: $e");
      debugPrint(stack.toString());
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