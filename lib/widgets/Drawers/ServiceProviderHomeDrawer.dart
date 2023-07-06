import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/FpServiceLocationScreen.dart';
import 'package:vensemartserviceprovider/LoginScreen.dart';
import 'package:vensemartserviceprovider/core/session_manager.dart';
import 'package:vensemartserviceprovider/screens/AboutUsScreen.dart';
import 'package:vensemartserviceprovider/screens/AcceptRejectBookingsScreen.dart';
import 'package:vensemartserviceprovider/screens/ContactUsScreen.dart';
import 'package:vensemartserviceprovider/screens/CustomerSupportScreen.dart';
import 'package:vensemartserviceprovider/screens/FeedBackScreen.dart';
import 'package:vensemartserviceprovider/screens/ProfileEditScreen.dart';
import 'package:vensemartserviceprovider/screens/ServiceIntroScreenAlternate.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderHomeScreen.dart';
import 'package:vensemartserviceprovider/screens/SubscriptionPlanListScreen.dart';
import 'package:vensemartserviceprovider/screens/Veriffy.dart';
import 'package:vensemartserviceprovider/screens/VerifyFlow.dart';

import '../../screens/ServiceLocationScreenAlternate.dart';
import '../../screens/provider/provider_services.dart';

class ServiceProviderHomeDrawer extends StatefulWidget {
  const ServiceProviderHomeDrawer({Key? key}) : super(key: key);

  @override
  State<ServiceProviderHomeDrawer> createState() =>
      _ServiceProviderHomeDrawerState();
}

class _ServiceProviderHomeDrawerState extends State<ServiceProviderHomeDrawer> {
  ProviderServices? providerServices;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ninController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  bool isSwitched = false;

  void goOnline() {
    providerServices?.goOnline(map: {
      "number": "${providerServices?.userDetailModel?.data?.mobile}",
    }, context: context);
    setState(() {
      providerServices?.userDetailModel?.data?.isOnline = 1;
    });
  }

  void goOffline() {
    providerServices?.goOffline(map: {
      "number": "${providerServices?.userDetailModel?.data?.mobile}",
    }, context: context);
    setState(() {
      providerServices?.userDetailModel?.data?.isOnline = 0;
    });
  }

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getUserDetails();
    if (providerServices?.userDetailModel?.data?.isOnline == 1) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is ON';
      });
    }

    super.initState();
  }

  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
        goOnline();
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      goOffline();
      print('Switch Button is OFF');
    }
  }

  bool onSwitch() {
    if (providerServices?.userDetailModel?.data?.isOnline == 1) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Consumer<ProviderServices>(builder: (_, provider, __) {
          if (provider.serviceHomeModel?.data == null) {
            return SpinKitCircle(
              color: Colors.blue[900],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 80,
                        width: double.infinity,
                        color: Color(0xff1456f1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 40.0),
                        child: CircleAvatar(
                          radius: 50.0,
                          // backgroundImage: NetworkImage("${provider.userDetailModel?.data?.profile} ?? '' "),
                          child: CachedNetworkImage(
                            memCacheWidth: 45,
                            memCacheHeight: 60,
                            maxHeightDiskCache: 60,
                            maxWidthDiskCache: 45,
                            imageUrl: provider.userDetailModel?.data?.profile
                                    .toString() ??
                                'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png',
                            imageBuilder: (context, imageProvider) => Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.height / 3,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 140,
                        left: 20,
                        child: Row(
                          children: [
                            Text(
                              '${provider.userDetailModel?.data?.name ?? 'name'}',
                              style:
                                  //ios : 1.5
                                  TextStyle(
                                      fontSize: 2.0 *
                                          MediaQuery.of(context).size.height *
                                          0.01,
                                      fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' (${provider.userDetailModel?.data?.level ?? 'getting level'} level )',
                              style: TextStyle(
                                  //ios : 1.0
                                   //ios : 1.5
                                  fontSize: 2.0 *
                                      MediaQuery.of(context).size.height *
                                      0.01,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Container(
                  //     padding: EdgeInsets.only(left: 20.0),
                  //     child: Row(
                  //       children: [
                  //         AutoSizeText('Your Profile', style: TextStyle(
                  //              //ios : 1.5
                  //                 fontSize: 2.0 *
                  // MediaQuery.of(context).size.height *
                  // 0.01,.0, fontWeight: FontWeight.normal),),
                  //       ],
                  //     )),

                  Container(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Text(
                            'Availability',
                            style: TextStyle(
                                 //ios : 1.5
                                  fontSize: 2.0 *
                                    MediaQuery.of(context).size.height *
                                    0.01,
                                fontWeight: FontWeight.normal),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(right: 19.0),
                              child: Transform.scale(
                                  scale: 1,
                                  child: Row(
                                    children: [
                                      Switch(
                                        onChanged: toggleSwitch,
                                        value: providerServices?.userDetailModel
                                                    ?.data?.isOnline ==
                                                1
                                            ? true
                                            : false,
                                        activeColor: Colors.white,
                                        activeTrackColor: Colors.green,
                                        inactiveThumbColor: Colors.grey,
                                        inactiveTrackColor: Colors.grey,
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      )),

                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Color.fromRGBO(237, 234, 234, 22),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ServiceProviderHomeScreen(),
                                ),
                              );
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ServiceProviderHomeScreen(),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: Icon(Icons.menu),
                                title: AutoSizeText(
                                  'Home',
                                  style: TextStyle(
                                       //ios : 1.5
                                  fontSize: 2.0 *
                                          MediaQuery.of(context).size.height *
                                          0.01),
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileEditScreen(),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Icon(Icons.person),
                              title: AutoSizeText(
                                'Profile',
                                style: TextStyle(
                                     //ios : 1.5
                                  fontSize: 2.0 *
                                        MediaQuery.of(context).size.height *
                                        0.01),
                              ),
                            ),
                          ),

                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => VerifyFlow(),
                          //       ),
                          //     );
                          //   },
                          //   child: const ListTile(
                          //     leading: Icon(Icons.person),
                          //     title: AutoSizeText('Profile'),
                          //   ),
                          // ),

                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => VeriffyScreen(),
                          //       ),
                          //     );
                          //   },
                          //   child: const ListTile(
                          //     leading: Icon(Icons.person),
                          //     title: AutoSizeText('Veriffy'),
                          //   ),
                          // ),
                          //

                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => VerifyFlow(),
                          //       ),
                          //     );
                          //   },
                          //   child: const ListTile(
                          //     leading: Icon(Icons.person),
                          //     title: AutoSizeText('Verify User'),
                          //   ),
                          // ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ServiceIntroScreenAlternate(),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Icon(Icons.home_repair_service),
                              title: AutoSizeText(
                                'Modify Service',
                                style: TextStyle(
                                     //ios : 1.5
                                  fontSize: 2.0 *
                                        MediaQuery.of(context).size.height *
                                        0.01),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ServiceLocationScreenAlternate(),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Icon(Icons.location_city_outlined),
                              title: AutoSizeText(
                                'Modify Address',
                                style: TextStyle(
                                     //ios : 1.5
                                  fontSize: 2.0 *
                                        MediaQuery.of(context).size.height *
                                        0.01),
                              ),
                            ),
                          ),

                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) =>
                          //             SubscriptionPlanListScreen(),
                          //       ),
                          //     );
                          //   },
                          //   child: const ListTile(
                          //     leading: Icon(Icons.compare_arrows),
                          //     title: AutoSizeText('My Subscription'),
                          //   ),
                          // ),

                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) =>
                          //             SubscriptionPlanListScreen(),
                          //       ),
                          //     );
                          //   },
                          //   child: const ListTile(
                          //     leading: Icon(Icons.account_balance_wallet),
                          //     title: AutoSizeText('Payment'),
                          //   ),
                          // ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ContactScreen(),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Icon(Icons.phone),
                              title: AutoSizeText(
                                'Contact',
                                style: TextStyle(
                                     //ios : 1.5
                                  fontSize: 2.0 *
                                        MediaQuery.of(context).size.height *
                                        0.01),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AboutUsScreen(),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Icon(Icons.info),
                              title: AutoSizeText(
                                'About',
                                style: TextStyle(
                                     //ios : 1.5
                                  fontSize: 2.0 *
                                        MediaQuery.of(context).size.height *
                                        0.01),
                              ),
                            ),
                          ),

                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => FeedBackScreen(),
                          //       ),
                          //     );
                          //   },
                          //   child: const ListTile(
                          //     leading: Icon(Icons.chat),
                          //     title: AutoSizeText('Feedback'),
                          //   ),
                          // ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CustomerSupportScreen(),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Icon(Icons.support_agent),
                              title: AutoSizeText(
                                'Support',
                                style: TextStyle(
                                     //ios : 1.5
                                  fontSize: 2.0 *
                                        MediaQuery.of(context).size.height *
                                        0.01),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              SessionManager.instance.logOut();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: Icon(
                                Icons.logout_outlined,
                                color: Colors.redAccent,
                              ),
                              title: AutoSizeText(
                                'Logout',
                                style: TextStyle(
                                     //ios : 1.5
                                  fontSize: 2.0 *
                                        MediaQuery.of(context).size.height *
                                        0.01),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
