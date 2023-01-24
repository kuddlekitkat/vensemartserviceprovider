import 'package:firebase_messaging/firebase_messaging.dart';

final firebaseService = FirebaseServicesClass();

class FirebaseServicesClass {
  FirebaseServicesClass();

  Future<void> _onOpenAppMessageOnBackground(context) async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    print('psuh whaz ${initialMessage.toString()}');
    if (initialMessage != null) {}
  }

  firebasePushNotification(context) {
    _onOpenAppMessageOnBackground(context);
    // in the function notification can be received when the app is on foreground, meaning when the app is opened and currently in use
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification? androidNotification = message.notification?.android;
      if (notification != null && androidNotification != null) {
        print('push it again ${notification.toString()}');
      }
    });
  }
}
