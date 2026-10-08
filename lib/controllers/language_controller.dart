import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends ChangeNotifier {
  static final LanguageController instance = LanguageController._internal();
  LanguageController._internal();

  static const String _prefKey = 'app_language_code';

  // Default to Amharic ('am')
  Locale _currentLocale = const Locale('am');

  Locale get currentLocale => _currentLocale;
  bool get isAmharic => _currentLocale.languageCode == 'am';

  /// Initializes the saved language preference from SharedPreferences on app startup
  Future<void> initLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString(_prefKey);
    if (savedCode != null) {
      _currentLocale = Locale(savedCode);
      notifyListeners();
    }
  }

  /// Sets a specific language code ('am' or 'en')
  Future<void> setLanguage(String languageCode) async {
    if (_currentLocale.languageCode == languageCode) return;

    _currentLocale = Locale(languageCode);
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKey, languageCode);
  }

  /// Toggles between English and Amharic
  Future<void> toggleLanguage() async {
    await setLanguage(isAmharic ? 'en' : 'am');
  }
}