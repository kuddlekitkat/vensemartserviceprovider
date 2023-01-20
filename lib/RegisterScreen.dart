import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:vensemartserviceprovider/screens/TermsScreen.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

import 'LoginScreen.dart';

import 'apiservices/validator.dart';
import 'model/general_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ProviderServices? providerServices;
  final _globalFormKey = GlobalKey<FormState>();
  bool isChecked = false;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phnoeNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? deviceToken;
  var deviceInfo;
  String? device = '';

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    deviceInfo = DeviceInfoPlugin();
    // try and print deviceInfo to see all required stuffs then get the device name and pass it to the registration function
    _getId();
    _firebaseMessaging.getToken().then((token) {
      deviceToken = token;
      print("token is $token");
    });
    super.initState();
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      device = iosDeviceInfo.identifierForVendor;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      device = androidDeviceInfo.id;
      return androidDeviceInfo.id; // unique ID on Android
    }
    return device;
  }

  void signUp(context) async {
    if (_globalFormKey.currentState!.validate() && isChecked == true) {
      phoneNumber = phnoeNumberController.text.trim();
      setState(() {});
      providerServices?.register(map: {
        "type": "3",
        "device_id": device!,
        "device_type": Platform.isIOS ? "iPhone" : "android",
        "device_name": deviceInfo.toString(),
        "device_token": "$deviceToken",
        "name": usernameController.text.trim(),
        "email": emailController.text.trim(),
        "mobile": phnoeNumberController.text.trim(),
        "password": passwordController.text.trim(),
        "state": "FCT",
        "town": "Abuja"
      }, context: context);
    }
  }

  void sendLocation(context) async {
    if (true) {
      providerServices?.sendLocation(map: {
        "location": 'Wuse 2 Abuja',
        "location_lat": "7.4701862",
        "location_long": "9.078749"
      }, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color(0xff1456f1);
      }
      return Colors.grey;
    }

    return Scaffold(
        backgroundColor: const Color(0xff1456f1),
        body: Form(
          key: _globalFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 12.0, bottom: 4.0),
                child: const Text(
                  'Signup',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.65,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SizedBox(
                  height: 380,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Container(
                          margin: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            validator: Validators.validateString(),
                            controller: usernameController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                hintText: 'Full Name',
                                prefixIcon: const Icon(Icons.person_rounded),
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                fillColor:
                                    const Color.fromRGBO(250, 250, 254, 1)),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 80,
                        child: Container(
                          margin: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            validator: Validators.validateEmail(),
                            controller: emailController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                hintText: 'email',
                                prefixIcon: const Icon(Icons.email_rounded),
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                fillColor:
                                    const Color.fromRGBO(250, 250, 254, 1)),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 80,
                        child: Container(
                          margin: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            validator: Validators.validatePhone(),
                            controller: phnoeNumberController,
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                hintText: '08107463265',
                                prefixIcon: Container(
                                  height: 20,
                                  width: 25,
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(234, 234, 234, 3),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0))),
                                  child: Center(
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/flag.png'))),
                                    ),
                                  ),
                                ),
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                fillColor:
                                    const Color.fromRGBO(250, 250, 254, 1)),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 85,
                        child: Container(
                          margin: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: passwordController,
                            validator: Validators.validatePlainPassword(),
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                hintText: 'password',
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: const Icon(Icons.remove_red_eye),
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                fillColor:
                                    const Color.fromRGBO(250, 250, 254, 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                  print(isChecked);
                                });
                              },
                            ),
                            const Text(
                              'By checking the box,agree to our ',
                              style: TextStyle(fontSize: 10),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context!,
                                  MaterialPageRoute(
                                    builder: (context) => TermsScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'terms and conditions',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () => signUp(context),
                        child: Consumer<ProviderServices>(
                          builder: (_, value, __) => Center(
                            child: Container(
                              height: screenHeight / 14,
                              width: screenWidth / 1.10,
                              decoration: BoxDecoration(
                                color: const Color(0xff1456f1),
                                borderRadius: BorderRadius.circular(90.0),
                              ),
                              child: value.isLoading == true
                                  ? const SpinKitCircle(
                                      color: Colors.white,
                                    )
                                  : const Center(
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20.0)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              ' sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Color(0xff1456f1)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
