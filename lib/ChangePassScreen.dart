import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

class ChangePassScreen extends StatefulWidget {
  String userPhone;
  ChangePassScreen({required this.userPhone});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  late bool _passwordVisible;
  late bool _passwordVisible1;
  final formKey = GlobalKey<FormState>();

  ProviderServices? providerServices;

  final _globalFormKey = GlobalKey<FormState>();
  String otpNumber = '';

  void changePassword(context) async {
    if (_globalFormKey.currentState!.validate()) {
      setState(() {});
      providerServices?.changePassword(map: {
        "phone_number": widget.userPhone,
        "code": controller2.text.trim(),
        "password": controller3.text.trim(),
        "confirm_password": controller4.text.trim(),
      }, context: context);
    }
  }

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    _passwordVisible = false;
    _passwordVisible1 = false;

    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 1),
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title: Text("Change Password"),
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
          child: Form(
            key: _globalFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 14.0),
                  AutoSizeText('OTP'),
                  SizedBox(height: 8.0),
                  PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    obscureText: false,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      // if (v!.length < 3) {
                      //   return "I'm from validator";
                      // } else {
                      //   return null;
                      // }
                    },
                    pinTheme: PinTheme(
                      inactiveFillColor: Colors.white,
                      activeColor: Colors.white,
                      disabledColor: Colors.grey,
                      selectedFillColor: Colors.white70,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 60,
                      activeFillColor: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,

                    errorAnimationController: errorController,
                    controller: controller2,
                    keyboardType: TextInputType.number,

                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                  SizedBox(height: 14.0),
                  const AutoSizeText('New password'),
                  SizedBox(height: 4.0),
                  TextFormField(
                    controller: controller3,
                    obscureText: !_passwordVisible,
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
                        hintStyle: new TextStyle(color: Colors.grey[600]),
                        fillColor: Colors.white),
                  ),
                  SizedBox(height: 14.0),
                  const AutoSizeText('Confirm password'),
                  SizedBox(height: 4.0),
                  TextFormField(
                    controller: controller4,
                    obscureText: !_passwordVisible,
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
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible1 = !_passwordVisible1;
                            });
                          },
                          icon: Icon(
                              _passwordVisible1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark),
                        ),
                        hintStyle: new TextStyle(color: Colors.grey[600]),
                        fillColor: Colors.white),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: () => changePassword(context),
                    child: Consumer<ProviderServices>(
                      builder: (_, value, __) => Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 1.10,
                          decoration: BoxDecoration(
                            color: const Color(0xff1456f1),
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          child: value.isLoading == true
                              ? const SpinKitCircle(
                                  color: Colors.white,
                                )
                              : Center(
                                  child: Text(
                                    'Change Password',
                                    style: TextStyle(
                                        color: Colors.white,
                                        //ios : 1.5
                                        fontSize: 2.0 *
                                            MediaQuery.of(context).size.height *
                                            0.01,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
