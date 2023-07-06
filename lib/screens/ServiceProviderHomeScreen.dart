import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/screens/OffersScreen.dart';
import 'package:vensemartserviceprovider/screens/ProfileScreen.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderRequestScreen.dart';
import 'package:vensemartserviceprovider/widgets/AppBars/ServiceProviderHomeAppBar.dart';
import 'package:vensemartserviceprovider/widgets/Drawers/ServiceProviderHomeDrawer.dart';
import 'package:vensemartserviceprovider/widgets/full_page/ServiceProviderHome.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../firebase_services/firebase_services_class.dart';
import '../widgets/AppBars/ProfileAppBar.dart';
import '../widgets/AppBars/RequestAppBar.dart';
import 'ServiceProviderRequestScreenAlternate.dart';

class ServiceProviderHomeScreen extends StatefulWidget {
  const ServiceProviderHomeScreen({super.key});
  static const routeName = '/home';
  static const String _title = 'Flutter Code Sample';

  @override
  State<ServiceProviderHomeScreen> createState() =>
      _ServiceProviderHomeScreenState();
}

class _ServiceProviderHomeScreenState extends State<ServiceProviderHomeScreen> {
  @override
  void initState() {
    firebaseService.firebasePushNotification(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: ServiceProviderHomeScreen._title,
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    ServiceProviderHome(),
    OffersScreen(),
    ServiceProviderRequestScreenAlternate(),
    ProfileScreen(),
  ];

  static final List<Widget> _appBars = [
    const ServiceProviderHomeAppBar(),
    const ServiceProviderHomeAppBar(),
    const RequestAppBar(),
    const ProfileAppBar(),
  ];

  static final List<Widget> _drawers = [
    const ServiceProviderHomeDrawer(),
    const ServiceProviderHomeDrawer(),
    const ServiceProviderHomeDrawer(),
    const ServiceProviderHomeDrawer(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late DateTime currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 10)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context!).removeCurrentSnackBar();

      ScaffoldMessenger.of(context!).removeCurrentSnackBar();
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
        content: AutoSizeText('press back again to exit app'),
      ));
      return Future.value(false);
    }
    return Future.value(true);
  }

  var presscount = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        presscount++;

        if (presscount == 3) {
          exit(0);
        } else {
          var snackBar = SnackBar(
            content: Text(
              'Press again to exit app',
              style: TextStyle(
                //ios : 1.5
                fontSize: 2.0 * MediaQuery.of(context).size.height * 0.01,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return false;
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56), // 56 is default height
          child: _appBars[_selectedIndex],
        ),
        drawer: PreferredSize(
          preferredSize: const Size.fromHeight(56), // 56 is default height
          child: _drawers[_selectedIndex],
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Promotion',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_chart),
              label: 'Request',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
