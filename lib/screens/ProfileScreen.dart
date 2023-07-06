import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/IdVerificationHomeScreen.dart';
import 'package:vensemartserviceprovider/screens/ProfileEditScreen.dart';
import 'package:vensemartserviceprovider/screens/SubscriptionPlanListScreen.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../LoginScreen.dart';
import '../core/session_manager.dart';
import 'ServiceDetailDisplay.dart';

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
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(234, 234, 234, 2),
        body: Consumer<ProviderServices>(builder: (_, provider, __) {
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
                                  imageUrl: provider
                                          .userDetailModel?.data?.profile
                                          .toString() ??
                                      '',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            // const Positioned(
                            //   top: 86,
                            //   left: 208,
                            //   child: Icon(
                            //     Icons.camera_enhance_rounded,
                            //     color: Colors.blue,
                            //     size: 20,
                            //   ),
                            // ),
                            // const Positioned(
                            //   top: 5,
                            //   left: 315,
                            //   child: Icon(
                            //     Icons.edit,
                            //     color: Colors.white,
                            //     size: 20,
                            //   ),
                            // )
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
                //                   TextStyle(color: Colors.black, fontSize: 2  * MediaQuery.of(context).size.height * 0.01),
                //                 ),
                //                 AutoSizeText('Secure your account',
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileEditScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 1.08,
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
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                        color: Colors.black,
                                        //ios : 1.5
                                        fontSize: 2.0 *
                                            MediaQuery.of(context).size.height *
                                            0.01),
                                  ),
                                  AutoSizeText('Manage your profile',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 1.3 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01)),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 19.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const SubscriptionPlanListScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 1.08,
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
                                  Text(
                                    'My Subscription',
                                    style: TextStyle(
                                        color: Colors.black,
                                        //ios : 1.5
                                        fontSize: 2.0 *
                                            MediaQuery.of(context).size.height *
                                            0.01),
                                  ),
                                  AutoSizeText('Manage your subscription',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 1.3 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01)),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 19.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
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
                //                   TextStyle(color: Colors.black, fontSize: 2  * MediaQuery.of(context).size.height * 0.01),
                //                 ),
                //                 AutoSizeText('Verify your identity to be verified',
                //                     style: TextStyle(
                //                         color: Colors.grey, 1.5 * MediaQuery.of(context).size.height * 0.01)),
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
                //                   TextStyle(color: Colors.black, fontSize: 2  * MediaQuery.of(context).size.height * 0.01),
                //                 ),
                //                 Text(
                //                     'Report errors and bugs to improve the app',
                //                     style: TextStyle(
                //                         color: Colors.grey, 1.5 * MediaQuery.of(context).size.height * 0.01)),
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
                // const SizedBox(
                //   height: 10,
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ServiceDetailDisplay(),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 1.08,
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
                                  Text(
                                    'Service Details',
                                    style: TextStyle(
                                        color: Colors.black,
                                        //ios : 1.5
                                        fontSize: 2.0 *
                                            MediaQuery.of(context).size.height *
                                            0.01),
                                  ),
                                  AutoSizeText('View Service Details',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 1.3 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01)),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 19.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IdVerificationHomeScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 1.08,
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
                                  Row(
                                    children: [
                                      Text(
                                        'Verify',
                                        style: TextStyle(
                                            color: Colors.black,
                                            //ios : 1.5
                                            fontSize: 2.0 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                      ),
                                      const SizedBox(
                                        width: 20.0,
                                      ),

                                      // const Text(
                                      //   'Status : ',
                                      //   style: TextStyle(
                                      //       color: Colors.black,  //ios : 1.5
                                      //fontSize: 2.0 *
                                      // MediaQuery.of(context).size.height *
                                      // 0.01,),
                                      // ),
                                      Text(
                                          ' ${provider.userDetailModel?.data?.isPhoneVerified == 1 || provider.userDetailModel?.data?.status == true ? 'Verified' : 'unverified'}',
                                          style: provider.userDetailModel?.data
                                                          ?.isPhoneVerified ==
                                                      1 ||
                                                  provider.userDetailModel?.data
                                                          ?.status ==
                                                      true
                                              ? TextStyle(
                                                  color: Colors.green,
                                                  //ios : 1.5
                                                  fontSize: 2.0 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.01,
                                                  fontWeight: FontWeight.w600)
                                              : const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Get Verified',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 1.3 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 19.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Center(
                //   child: Container(
                //     height: MediaQuery.of(context).size.height / 10,
                //     width: MediaQuery.of(context).size.width / 1.08,
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
                //                   'Address Details',
                //                   style: TextStyle(
                //                       color: Colors.black, fontSize: 2  * MediaQuery.of(context).size.height * 0.01),
                //                 ),
                //                 AutoSizeText('View your Address Details',
                //                     style: TextStyle(
                //                         color: Colors.grey, 1.5 * MediaQuery.of(context).size.height * 0.01)),
                //               ],
                //             ),
                //           ],
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => ServiceLocationDisplay(),
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
                // const SizedBox(
                //   height: 10,
                // ),
                InkWell(
                  onTap: () {
                    SessionManager.instance.logOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                    ;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 1.08,
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
                                  Text(
                                    'Logout',
                                    style: TextStyle(
                                        color: Colors.black,
                                        //ios : 1.5
                                        fontSize: 2.0 *
                                            MediaQuery.of(context).size.height *
                                            0.01),
                                  ),
                                  AutoSizeText('Sign out from vensemart',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          //ios : 1.5
                                          fontSize: 2.0 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01)),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 19.0),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                //ios
                // InkWell(
                //   onTap: () {
                //     showAlertDialog(context);
                //   },
                //   child: Center(
                //     child: Container(
                //       height: MediaQuery.of(context).size.height / 10,
                //       width: MediaQuery.of(context).size.width / 1.08,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(12.0),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Row(
                //             children: [
                //               const SizedBox(width: 13.0),
                //               const Icon(
                //                 Icons.delete_forever,
                //                 color: Colors.red,
                //               ),
                //               const SizedBox(width: 13.0),
                //               Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Row(
                //                     children: [
                //                       Text(
                //                         'Delete Account',
                //                         style: TextStyle(
                //                             color: Colors.black,
                //                             //ios : 1.5
                //                             fontSize: 2.0 *
                //                                 MediaQuery.of(context)
                //                                     .size
                //                                     .height *
                //                                 0.01),
                //                       ),
                //                       SizedBox(
                //                         width: 20.0,
                //                       ),
                //                       // Text(
                //                       //   'Status : ',
                //                       //   style: TextStyle(
                //                       //     color: Colors.black,
                //                       //      //ios : 1.5
                //                       //fontSize: 2.0 *
                //                       //         MediaQuery.of(context)
                //                       //             .size
                //                       //             .height *
                //                       //         0.01,
                //                       //   ),
                //                       // ),
                //                     ],
                //                   ),
                //                   Row(
                //                     children: [
                //                       Container(
                //                         width:
                //                             MediaQuery.of(context).size.width /
                //                                 2.5,
                //                         child: Text(
                //                           'Select only if you want to delete account details',
                //                           style: TextStyle(
                //                               color: Colors.grey,
                //                               //ios : 1.5
                //                               fontSize: 2.0 *
                //                                   MediaQuery.of(context)
                //                                       .size
                //                                       .height *
                //                                   0.01),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //           const Padding(
                //             padding: EdgeInsets.only(right: 19.0),
                //             child: Icon(
                //               Icons.keyboard_arrow_right,
                //               color: Colors.black,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void deleteAccount() {
    providerServices?.deleteAccount(map: {
      "user_id": "${providerServices?.userDetailModel?.data?.id}",
    }, context: context);
    SessionManager.instance.logOut();
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("YES", style: TextStyle(color: Colors.red)),
      onPressed: () {
        deleteAccount();
      },
    );
    Widget continueButton = TextButton(
      child: const Text(
        "NO",
        style: TextStyle(color: Colors.green),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Account Deletion Disclaimer"),
      content: Text("Would you like to delete your account forever?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
