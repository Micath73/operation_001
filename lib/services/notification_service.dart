import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  NotificationService._internal();
  static final NotificationService instance = NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  Future<void> initialize({
    required void Function(String? payload) onNotificationTap,
  }) async {
    if (_isInitialized) return;

    tz.initializeTimeZones();

    const androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        onNotificationTap(response.payload);
      },
    );

    _isInitialized = true;
  }

  Future<bool> requestPermissions() async {
    final androidImplementation =
    _notificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    final bool? androidGranted =
    await androidImplementation?.requestNotificationsPermission();

    final iosImplementation =
    _notificationsPlugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();

    final bool? iosGranted = await iosImplementation?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );

    return (androidGranted ?? false) || (iosGranted ?? false);
  }

  /// Schedules a daily repeating notification at a specific hour & minute
  Future<void> scheduleDailyReminder({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
    required String payloadTarget,
  }) async {
    final scheduledDate = _nextInstanceOfTime(hour, minute);

    const androidDetails = AndroidNotificationDetails(
      'catholic_prayer_reminders',
      'Prayer Reminders',
      channelDescription:
      'Daily alerts for Angelus, Hour of Mercy, and Holy Rosary',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, // Repeats daily!
      payload: payloadTarget,
    );
  }

  Future<void> cancelReminder(int id) async {
    await _notificationsPlugin.cancel(id);
  }

  Future<void> cancelAllReminders() async {
    await _notificationsPlugin.cancelAll();
  }

  tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  /// Helper to set default Catholic prayer schedule
  Future<void> setupDefaultCatholicReminders() async {
    final hasPermission = await requestPermissions();
    if (!hasPermission) return;

    // 1. Morning Angelus (6:00 AM)
    await scheduleDailyReminder(
      id: 101,
      title: '🔔 Morning Angelus',
      body: 'The Angel of the Lord declared unto Mary. Pause and begin your day with God.',
      hour: 6,
      minute: 0,
      payloadTarget: 'Angelus',
    );

    // 2. Midday Angelus (12:00 PM)
    await scheduleDailyReminder(
      id: 102,
      title: '🔔 Noon Angelus',
      body: 'Pause at midday to honor the Incarnation of Our Lord.',
      hour: 12,
      minute: 0,
      payloadTarget: 'Angelus',
    );

    // 3. Hour of Mercy (3:00 PM)
    await scheduleDailyReminder(
      id: 103,
      title: '🩸 The Hour of Mercy (3:00 PM)',
      body: 'At this hour, Christ breathed His last on the Cross. Pray the Divine Mercy Chaplet.',
      hour: 15,
      minute: 0,
      payloadTarget: 'Divine Mercy Chaplet',
    );

    // 4. Evening Rosary & Compline (8:30 PM)
    await scheduleDailyReminder(
      id: 104,
      title: '📿 Evening Rosary & Rest',
      body: 'Close your day in peace. Reflect on the Sacred Mysteries of the Rosary.',
      hour: 20,
      minute: 30,
      payloadTarget: 'Rosary',
    );
  }
}