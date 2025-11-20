import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    _plugin.initialize(settings);
  }

  static void display(RemoteMessage message) {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "channel_id",
          "channel_name",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      _plugin.show(
        id,
        message.notification?.title,
        message.notification?.body,
        notificationDetails,
      );
    } catch (e) {
      print(e);
    }
  }
}
