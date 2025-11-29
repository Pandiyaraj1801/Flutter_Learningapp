import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:learnapp/firebase/push_notification/services/local_notification.dart';

class MsgServices {
  /// Private Constructor
  MsgServices._privateConstructor();

  /// Create the instance to assign the private constructor for using Single-Ton class
  static final MsgServices _msgInstance = MsgServices._privateConstructor();

  /// Getter method to get the same instance to access that
  static MsgServices get getMsgInstance => _msgInstance;

  /// Create the firebase instance
  FirebaseMessaging instance = FirebaseMessaging.instance;

  /// Initiate the FCM token
  Future<void> initFcm() async {
    /// Ask the notification enable to give permission
    await instance.requestPermission();

    /// Get the FCM token
    String? token = await instance.getToken();
    print("FCM Token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      LocalNotificationService.display(msg);
    });

    FirebaseMessaging.onMessageOpenedApp.listen(handler);
  }
}

Future<void> handler(RemoteMessage msg) async {}
