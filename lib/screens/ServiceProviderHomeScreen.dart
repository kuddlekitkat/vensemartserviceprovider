import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/screens/OffersScreen.dart';
import 'package:vensemartserviceprovider/screens/ProfileScreen.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderRequestScreen.dart';
import 'package:vensemartserviceprovider/widgets/AppBars/ServiceProviderHomeAppBar.dart';
import 'package:vensemartserviceprovider/widgets/Drawers/ServiceProviderHomeDrawer.dart';
import 'package:vensemartserviceprovider/widgets/full_page/ServiceProviderHome.dart';

import '../widgets/AppBars/ProfileAppBar.dart';
import '../widgets/AppBars/RequestAppBar.dart';



class ServiceProviderHomeScreen extends StatelessWidget {
  const ServiceProviderHomeScreen({super.key});
  static const routeName = '/home';
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
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
    ServiceProviderRequestScreen(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
    );
  }
}
