import 'package:flutter/material.dart';
import 'package:operation_001/repositories/saints_repository.dart';
import 'package:operation_001/models/saint_model.dart';

class SaintOfTheDayController extends ChangeNotifier with WidgetsBindingObserver {
  static final SaintOfTheDayController instance = SaintOfTheDayController._internal();
  factory SaintOfTheDayController() => instance;

  SaintOfTheDayController._internal() {
    WidgetsBinding.instance.addObserver(this);
  }

  final SaintsRepository _repository = SaintsRepository.instance;
  DailySaintsEntry? _todayEntry;
  DateTime? _lastLoadedDate;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  SaintModel? get primaryTodaySaint => _todayEntry?.primary;

  List<SaintModel> get allTodaySaints {
    final entry = _todayEntry;
    if (entry == null) return const [];
    return entry.saints;
  }

  bool get hasMultipleSaintsToday => (_todayEntry?.saints.length ?? 0) > 1;

  Future<void> initialize({DateTime? now}) async {
    final currentDate = now ?? DateTime.now();

    // Avoid redundant re-fetches if date hasn't changed
    if (_isLoadedForSameDay(currentDate)) return;

    _isLoading = true;
    notifyListeners();

    await _repository.load();
    _todayEntry = _repository.entryForToday(now: currentDate);
    _lastLoadedDate = currentDate;

    _isLoading = false;
    notifyListeners();
  }

  /// Automatically trigger check on app resume (e.g. crossing midnight)
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      final now = DateTime.now();
      if (!_isLoadedForSameDay(now)) {
        initialize(now: now);
      }
    }
  }

  bool _isLoadedForSameDay(DateTime now) {
    if (_lastLoadedDate == null) return false;
    return _lastLoadedDate!.year == now.year &&
        _lastLoadedDate!.month == now.month &&
        _lastLoadedDate!.day == now.day;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}