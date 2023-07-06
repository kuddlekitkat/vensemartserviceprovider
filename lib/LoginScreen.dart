import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'dart:io';
import 'ForgotPasswordScreen.dart';
import 'RegisterScreen.dart';
import 'apiservices/auth_repo.dart';
import 'apiservices/validator.dart';

class LoginScreen extends StatefulWidget {
  static var routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ProviderServices? providerServices;
  final _globalFormKey = GlobalKey<FormState>();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String? deviceToken;
  var deviceInfo;
  String? device = '';
  late bool _passwordVisible;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    _getId();
    // _firebaseMessaging.getToken().then((token) {
    //   deviceToken = token;
    //   print("token is $token");
    // });

    initOneSignal(context);
    _passwordVisible = false;
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

  Future<void> initOneSignal(BuildContext context) async {
    /// Set App Id.
    await OneSignal.shared.setAppId("859c37cb-5f88-4423-b7f7-d1f28cf4d4ea");

    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;
    deviceToken = osUserID;
    // We will update this once he logged in and goes to dashboard.
    ////updateUserProfile(osUserID);
    // Store it into shared prefs, So that later we can use it.
    // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    await OneSignal.shared.promptUserForPushNotificationPermission(
      fallbackToSettings: true,
    );
  }

  void signIn(context) async {
    if (_globalFormKey.currentState!.validate()) {
      providerServices?.signIn(map: {
        "username": emailController.text,
        "password": passwordController.text,
        "type": "3",
        "device_id": device!,
        "device_type": Platform.isIOS ? "iPhone" : "android",
        "device_name": deviceInfo.toString(),
        "device_token": "$deviceToken",
      }, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var isChecked = false;
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
      return Colors.red;
    }

    return Scaffold(
        backgroundColor: const Color(0xff25D366),
        body: Form(
          key: _globalFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 12.0, bottom: 4.0),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 2.5 * MediaQuery.of(context).size.height * 0.01,
                      color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 12.0, bottom: 4.0),
                child: Text(
                  'Back',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 2.5 * MediaQuery.of(context).size.height * 0.01,
                      color: Colors.white),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.0),
                      child: AutoSizeText('Email'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 9,
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.0),
                      child: AutoSizeText('password'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 9,
                      child: Container(
                        margin: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          obscureText: !_passwordVisible,
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
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark),
                              ),
                              hintStyle: TextStyle(color: Colors.grey[600]),
                              fillColor:
                                  const Color.fromRGBO(250, 250, 254, 1)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 2.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                  fontSize: 1.8 *
                                      MediaQuery.of(context).size.height *
                                      0.01,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1456f1)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => signIn(context),
                      child: Consumer<ProviderServices>(
                        builder: (_, value, __) => Center(
                          child: Container(
                            height: screenHeight / 14.7,
                            width: screenWidth / 1.10,
                            decoration: BoxDecoration(
                              color: const Color(0xff25D366),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            child: value.isLoading == true
                                ? const SpinKitCircle(
                                    color: Colors.white,
                                  )
                                : Center(
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 2.2 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10.0,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText('Don\'t have an account? ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 2.5 *
                                  MediaQuery.of(context).size.height *
                                  0.01,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'signup',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 2.5 *
                                    MediaQuery.of(context).size.height *
                                    0.01,
                                color: Color(0xff1456f1)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
