import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

import '../apiservices/validator.dart';
import '../widgets/image_picker_widget.dart';

class BvnVerification extends StatefulWidget {
  const BvnVerification({Key? key}) : super(key: key);

  @override
  State<BvnVerification> createState() => _BvnVerificationState();
}

class _BvnVerificationState extends State<BvnVerification> {
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

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getUserDetails();
    super.initState();
  }

  void VerifyUser(context) async {
    if (_globalFormKey.currentState!.validate()) {
      providerServices?.verifyUser(map: {
        "number": nameController.text ?? '',
        "bvn": bvnController.text.trim(),
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
                  const AutoSizeText('Mobile Number'),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.number,
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
                  const SizedBox(height: 14.0),

                  const SizedBox(height: 10.0),
                  const AutoSizeText('Bvn'),
                  const SizedBox(height: 4.0),
                  TextFormField(
                    controller: bvnController,
                    keyboardType: TextInputType.number,
                    validator: Validators.validateString(),
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
                  const SizedBox(height: 14.0),

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
