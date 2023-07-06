import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/screens/AddressVerificationScreen.dart';
import 'package:vensemartserviceprovider/screens/NinVerificationScreen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class IdentityVerificationScreen extends StatelessWidget {
  const IdentityVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(234, 234, 234, 2),
        appBar: AppBar(
          backgroundColor: const Color(0xff1456f1),
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
              Center(
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
                              AutoSizeText(
                                'Nin Verification',
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NinVerificationScreen(),
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
                height: 10.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Center(
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
                              AutoSizeText(
                                'Address Verification',
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AddressVerificationScreen(),
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
        ),
      ),
    );
  }
}
