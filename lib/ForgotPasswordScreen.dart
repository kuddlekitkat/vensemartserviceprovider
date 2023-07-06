import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

import 'apiservices/validator.dart';
import 'model/general_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
  final formKey = GlobalKey<FormState>();

  ProviderServices? providerServices;

  final _globalFormKey = GlobalKey<FormState>();

  void sendPasswordChange(context) async {
    if (_globalFormKey.currentState!.validate()) {
      TextEditingController phoneController = TextEditingController();
      phoneNumber = phoneController.text.trim();
      setState(() {});
      providerServices?.sendPasswordChange(
          context: context, phoneNumber: controller1.text.trim());
    }
  }

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
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
          title: const Text("Forgot Password?"),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 12.0, bottom: 4.0),
                  child: Text(
                    'Forgot',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 3 * MediaQuery.of(context).size.height * 0.01,
                        color: Color(0xff1456f1)),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 12.0, bottom: 4.0),
                  child: Text(
                    'Password ?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 3 * MediaQuery.of(context).size.height * 0.01,
                        color: Color(0xff1456f1)),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 12.0, bottom: 4.0),
                  child: Text(
                    'Please enter phone number registered with account',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize:
                            1.5 * MediaQuery.of(context).size.height * 0.01,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: controller1,
                  validator: Validators.validatePhone(),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Mobile Number',
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
                SizedBox(
                  height: 40.0,
                ),
                GestureDetector(
                  onTap: () => sendPasswordChange(context),
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
    );
  }
}
