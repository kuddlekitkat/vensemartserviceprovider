
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/LoginScreen.dart';
import 'package:vensemartserviceprovider/OnboardingScreen.dart';
import 'package:vensemartserviceprovider/RegisterScreen.dart';
import 'package:vensemartserviceprovider/screens/AboutUsScreen.dart';
import 'package:vensemartserviceprovider/screens/Enable2FAuthScreen.dart';
import 'package:vensemartserviceprovider/screens/FeedBackScreen.dart';
import 'package:vensemartserviceprovider/screens/ProfileScreen.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderConnectedDevices.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderHomeScreen.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderRequestScreen.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderSecurityScreen.dart';
import 'package:vensemartserviceprovider/screens/SubscriptionPlanListScreen.dart';
import 'package:vensemartserviceprovider/screens/WithdrawalHistoryScreen.dart';

import 'apiservices/provider/provider.dart';
import 'core/injector.dart';
import 'core/session_manager.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeCore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
    
          // ServicesHomeScreen.routeName: (ctx) => ServicesHomeScreen(),
          // LoginScreen.routeName: (ctx) => ServicesHomeScreen(),
          // AvailableServicesListScreen.routeName: (ctx) => AvailableServicesListScreen(),
    
    
        },
      ),
    );
  }
}


