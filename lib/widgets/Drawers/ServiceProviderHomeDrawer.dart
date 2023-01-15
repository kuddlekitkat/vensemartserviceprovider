import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/LoginScreen.dart';
import 'package:vensemartserviceprovider/screens/AboutUsScreen.dart';
import 'package:vensemartserviceprovider/screens/AcceptRejectBookingsScreen.dart';
import 'package:vensemartserviceprovider/screens/FeedBackScreen.dart';
import 'package:vensemartserviceprovider/screens/ProfileEditScreen.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderHomeScreen.dart';
import 'package:vensemartserviceprovider/screens/SubscriptionPlanListScreen.dart';

import '../../screens/provider/provider_services.dart';

class ServiceProviderHomeDrawer extends StatefulWidget {
  const ServiceProviderHomeDrawer({Key? key}) : super(key: key);

  @override
  State<ServiceProviderHomeDrawer> createState() => _ServiceProviderHomeDrawerState();
}

class _ServiceProviderHomeDrawerState extends State<ServiceProviderHomeDrawer> {

  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Consumer<ProviderServices>(
    builder: (_, provider, __) {
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
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 40.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage("assets/images/profileimg.png"),
                  ),
                ),


                 Positioned(
                  top: 140,
                  left: 20,
                  child: Text('${provider.userDetailModel?.data?.name}', style: TextStyle(
                      fontSize: 22.0, fontWeight: FontWeight.bold),),
                ),


              ],
            ),

            Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Your Profile', style: TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.normal),)),
            SizedBox(height: 20.0,),
            Container(
              color: Color.fromRGBO(237, 234, 234, 22),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceProviderHomeScreen(),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileEditScreen(),
                            ),
                          );
                        },
                        child: const ListTile(
                          leading: Icon(Icons.menu),
                          title: Text('Home'),
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
                      child: const ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Profile'),
                      ),
                    ),

                    // const ListTile(
                    //   leading: Icon(Icons.notifications),
                    //   title: Text('Booking History'),
                    // ),

                    const ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifications'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubscriptionPlanListScreen(),
                          ),
                        );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.compare_arrows),
                        title: Text('My Subscription'),
                      ),
                    ),


                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubscriptionPlanListScreen(),
                          ),
                        );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.account_balance_wallet),
                        title: Text('Payment'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubscriptionPlanListScreen(),
                          ),
                        );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.phone),
                        title: Text('contact'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutUsScreen(),
                          ),
                        );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.info),
                        title: Text('About'),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeedBackScreen(),
                          ),
                        );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.chat),
                        title: Text('Feedback'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcceptRejectBookingsScreen(),
                          ),
                        );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.rate_review_rounded),
                        title: Text('Rate our app'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: const ListTile(
                        leading: Icon(
                          Icons.logout_outlined, color: Colors.redAccent,),
                        title: Text('Logout'),
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
        ),
      ),
    );
  }
}
