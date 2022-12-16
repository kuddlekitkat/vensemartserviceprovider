
import 'package:flutter/material.dart';
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


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vensemart Service Provider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterScreen(),
      routes: {

        // ServicesHomeScreen.routeName: (ctx) => ServicesHomeScreen(),
        // LoginScreen.routeName: (ctx) => ServicesHomeScreen(),
        // AvailableServicesListScreen.routeName: (ctx) => AvailableServicesListScreen(),


      },
    );
  }
}


