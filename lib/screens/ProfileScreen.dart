import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/FeedBackScreen.dart';
import 'package:vensemartserviceprovider/screens/IdentityVerificationScreen.dart';
import 'package:vensemartserviceprovider/screens/ProfileEditScreen.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderSecurityScreen.dart';
import 'package:vensemartserviceprovider/screens/SettingsScreen.dart';
import 'package:vensemartserviceprovider/screens/SubscriptionPlanListScreen.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

import '../LoginScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  ProviderServices? providerServices;


  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getUserDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 234, 234, 2),
      body: Consumer<ProviderServices>(
        builder: (_, provider, __) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 80,
                              width: double.infinity,
                              color: const Color(0xff1456f1),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 130.0, top: 25.0),
                              child: CircleAvatar(
                                radius: 50.0,
                                // backgroundImage: NetworkImage(
                                //     "${provider.userDetailModel?.data?.profile}"),
                                child: CachedNetworkImage(
                                  imageUrl: provider.userDetailModel?.data?.profile.toString() ?? '',
                                  imageBuilder: (context, imageProvider) => Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.cover),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),

                            ),
                            const Positioned(
                              top: 86,
                              left: 208,
                              child: Icon(
                                Icons.camera_enhance_rounded,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                            const Positioned(
                              top: 5,
                              left: 315,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Center(
                //   child: Container(
                //     height: MediaQuery
                //         .of(context)
                //         .size
                //         .height / 10,
                //     width: MediaQuery
                //         .of(context)
                //         .size
                //         .width / 1.08,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(12.0),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           children: [
                //             const SizedBox(width: 13.0),
                //             const Icon(
                //               Icons.home,
                //               color: Colors.black,
                //             ),
                //             const SizedBox(width: 13.0),
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: const [
                //                 Text(
                //                   'Security',
                //                   style:
                //                   TextStyle(color: Colors.black, fontSize: 19),
                //                 ),
                //                 Text('Secure your account',
                //                     style: TextStyle(color: Colors.grey)),
                //               ],
                //             ),
                //           ],
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) =>
                //                 const ServiceProviderSecurityScreen(),
                //               ),
                //             );
                //           },
                //           child: const Padding(
                //             padding: EdgeInsets.only(right: 19.0),
                //             child: Icon(
                //               Icons.keyboard_arrow_right,
                //               color: Colors.black,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 10,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 13.0),
                            const Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 13.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Profile',
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                                ),
                                const Text('Manage your profile',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileEditScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 19.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 10,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 13.0),
                            const Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 13.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'My Subscription',
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                                ),
                                Text('Manage your subscription',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10)),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (
                                    context) => const SubscriptionPlanListScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 19.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Center(
                //   child: Container(
                //     height: MediaQuery
                //         .of(context)
                //         .size
                //         .height / 10,
                //     width: MediaQuery
                //         .of(context)
                //         .size
                //         .width / 1.08,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(12.0),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           children: [
                //             const SizedBox(width: 13.0),
                //             const Icon(
                //               Icons.home,
                //               color: Colors.black,
                //             ),
                //             const SizedBox(width: 13.0),
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: const [
                //                 Text(
                //                   'Account Verification',
                //                   style:
                //                   TextStyle(color: Colors.black, fontSize: 19),
                //                 ),
                //                 Text('Verify your identity to be verified',
                //                     style: TextStyle(
                //                         color: Colors.grey, fontSize: 10)),
                //               ],
                //             ),
                //           ],
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (
                //                     context) => const IdentityVerificationScreen(),
                //               ),
                //             );
                //           },
                //           child: const Padding(
                //             padding: EdgeInsets.only(right: 19.0),
                //             child: Icon(
                //               Icons.keyboard_arrow_right,
                //               color: Colors.black,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                // Center(
                //   child: Container(
                //     height: MediaQuery
                //         .of(context)
                //         .size
                //         .height / 10,
                //     width: MediaQuery
                //         .of(context)
                //         .size
                //         .width / 1.08,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(12.0),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           children: [
                //             const SizedBox(width: 13.0),
                //             const Icon(
                //               Icons.home,
                //               color: Colors.black,
                //             ),
                //             const SizedBox(width: 13.0),
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: const [
                //                 Text(
                //                   'Feedback',
                //                   style:
                //                   TextStyle(color: Colors.black, fontSize: 19),
                //                 ),
                //                 Text(
                //                     'Report errors and bugs to improve the app',
                //                     style: TextStyle(
                //                         color: Colors.grey, fontSize: 10)),
                //               ],
                //             ),
                //           ],
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => const FeedBackScreen(),
                //               ),
                //             );
                //           },
                //           child: const Padding(
                //             padding: EdgeInsets.only(right: 19.0),
                //             child: Icon(
                //               Icons.keyboard_arrow_right,
                //               color: Colors.black,
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 10,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 13.0),
                            const Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 13.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Preferences',
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                                ),
                                Text('Customise vensemart to suit you',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10)),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 19.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 10,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 1.08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 13.0),
                            const Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 13.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Logout',
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                                ),
                                Text('Sign out from vensemart',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10)),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 19.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
