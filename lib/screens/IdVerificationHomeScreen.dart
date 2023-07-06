import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/screens/AddressVerificationScreen.dart';
import 'package:vensemartserviceprovider/screens/BvnVerification.dart';
import 'package:vensemartserviceprovider/screens/BvnVerificationNumber.dart';
import 'package:vensemartserviceprovider/screens/NinVerificationScreen.dart';
import 'package:vensemartserviceprovider/screens/Verification.dart';
import 'package:auto_size_text/auto_size_text.dart';

class IdVerificationHomeScreen extends StatelessWidget {
  const IdVerificationHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 2),
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title: const Text("Identity Verification"),
          leading: IconButton(
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Center(
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: screenHeight / 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Verification(),
                    ),
                  );
                },
                child: Center(
                  child: Container(
                    height: screenHeight / 10,
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
                                AutoSizeText(
                                  'Phone Verification',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 2 *
                                          MediaQuery.of(context).size.height *
                                          0.01),
                                ),
                                AutoSizeText('Secure your account',
                                    style: TextStyle(color: Colors.grey)),
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
                height: 10.0,
              ),

              const SizedBox(
                height: 5.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BvnVerification(),
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
                            SizedBox(width: 13.0),
                            Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            SizedBox(width: 13.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'BVN Verification',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 2 *
                                          MediaQuery.of(context).size.height *
                                          0.01),
                                ),
                                const AutoSizeText('Secure your account',
                                    style: TextStyle(color: Colors.grey)),
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

              // InkWell(
              //   onTap: (){
              //
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const BvnVerificationNumber(),
              //       ),
              //     );
              //   },
              //   child: Center(
              //     child: Container(
              //       height: MediaQuery.of(context).size.height / 10,
              //       width: MediaQuery.of(context).size.width /1.08,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(12.0),
              //       ),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //
              //           Row(
              //             children: [
              //
              //               SizedBox(width: 13.0),
              //               Icon(Icons.home,color: Colors.black,),
              //               SizedBox(width: 13.0),
              //               Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: const [
              //                   AutoSizeText('BVN Verification',style: TextStyle(color: Colors.black,fontSize: 2  * MediaQuery.of(context).size.height * 0.01),),
              //                   AutoSizeText('Secure your account',style: TextStyle(color: Colors.grey)),
              //                 ],
              //               ),
              //
              //             ],
              //           ),
              //
              //
              //           const Padding(
              //             padding: EdgeInsets.only(right: 19.0),
              //             child: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
              //           ),
              //
              //
              //         ],
              //       ),
              //
              //
              //
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
