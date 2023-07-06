import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/OnboardingScreen.dart';
import 'package:vensemartserviceprovider/screens/ProfileScreen.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderHomeScreen.dart';
import 'apiservices/provider/provider.dart';
import 'core/injector.dart';
import 'core/session_manager.dart';

AndroidNotificationChannel channel = const AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title// description
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeCore();
  await FlutterConfig.loadEnvVariables();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
  OneSignal.shared.setAppId("859c37cb-5f88-4423-b7f7-d1f28cf4d4ea");
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.getProviders,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vensemart Service Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SessionManager.instance.authToken.isNotEmpty
            ? const ServiceProviderHomeScreen()
            : const OnboardingScreen(),
        routes: {
          ServiceProviderHomeScreen.routeName: (ctx) =>
              const ServiceProviderHomeScreen(),
          '/profileScreen': (context) => const ProfileScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          // '/second': (context) => const SecondScreen(),

          // AvailableServicesListScreen.routeName: (ctx) => AvailableServicesListScreen(),
        },
      ),
    );
  }
}
