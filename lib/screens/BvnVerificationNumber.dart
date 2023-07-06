import 'dart:async';
import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

import '../apiservices/validator.dart';
import '../widgets/image_picker_widget.dart';

class BvnVerificationNumber extends StatefulWidget {
  const BvnVerificationNumber({Key? key}) : super(key: key);

  @override
  State<BvnVerificationNumber> createState() => _BvnVerificationNumberState();
}

class _BvnVerificationNumberState extends State<BvnVerificationNumber> {
  TextEditingController nameController = TextEditingController();

  TextEditingController bvnController = TextEditingController();

  // TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController ninController = TextEditingController();
  // TextEditingController dobController = TextEditingController();
  // TextEditingController genderController = TextEditingController();
  // TextEditingController addressController = TextEditingController();

  ProviderServices? providerServices;
  final _globalFormKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);

    super.initState();
  }

  void VerifyUser(context) async {
    if (_globalFormKey.currentState!.validate()) {
      providerServices?.verifyUser(map: {
        "number": nameController.text.trim(),
        "otp": bvnController.text.trim(),
      }, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
        appBar: AppBar(
          backgroundColor: const Color(0xff1456f1),
          title: const Text("Get Verified Using BVN"),
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
        body: Form(
          key: _globalFormKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: const AutoSizeText('Mobile Number'),
                  ),
                  const SizedBox(height: 4.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: nameController,
                      validator: Validators.validatePhone(),
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
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          fillColor: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 14.0),

                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: const AutoSizeText('OTP'),
                  ),
                  const SizedBox(height: 4.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
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
                      controller: bvnController,
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
                        setState(() {});
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),

                  // const AutoSizeText('Subject'),
                  // const SizedBox(height: 4.0),
                  // TextFormField(
                  //
                  //   controller: emailController,
                  //   validator: Validators.validateString(),
                  //   decoration: InputDecoration(
                  //     // label: Text(
                  //     //     provider.userDetailsModel?.data?.email ?? ''),
                  //       border: const OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(10.0),
                  //         ),
                  //         borderSide: BorderSide(
                  //           width: 0,
                  //           style: BorderStyle.none,
                  //         ),
                  //       ),
                  //       filled: true,
                  //       hintStyle: new TextStyle(color: Colors.grey[600]),
                  //       fillColor: Colors.white),
                  // ),
                  // const SizedBox(height: 14.0),
                  // const AutoSizeText('Complaint'),
                  // const SizedBox(height: 4.0),
                  // TextFormField(
                  //   maxLines: 6,
                  //   minLines: 3,
                  //   controller: phoneController,
                  //   validator: Validators.validateString(),
                  //   decoration: InputDecoration(
                  //     // label: Text(
                  //     //     provider.userDetailsModel?.data?.mobile ?? ''),
                  //       border: const OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(
                  //           Radius.circular(10.0),
                  //         ),
                  //         borderSide: BorderSide(
                  //           width: 0,
                  //           style: BorderStyle.none,
                  //         ),
                  //       ),
                  //       filled: true,
                  //       hintStyle: new TextStyle(color: Colors.grey[600]),
                  //       fillColor: Colors.white),
                  // ),
                  // const SizedBox(height: 14.0),

                  const SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () => VerifyUser(context),
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
                                      'Get Verified',
                                      style: TextStyle(
                                          color: Colors.white,
                                          //ios : 1.5
                                          fontSize: 2.0 *
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
