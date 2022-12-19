import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'ServiceIntroScreen.dart';
import 'screens/provider/provider_services.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

    TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();
  ProviderServices? providerServices;

  final _globalFormKey = GlobalKey<FormState>();
  String otpNumber = '';

  void verifyOtp(context) async {
    if (_globalFormKey.currentState!.validate()) {
      otpNumber = controller1.text.trim() +
          controller2.text.trim() +
          controller3.text.trim() +
          controller4.text.trim();
      setState(() {});
      providerServices?.verifyOTP(context: context, otpNumber: otpNumber);
    }
  }

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key:_globalFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 45.0),
                  height: 200,
                  child:Row(
                    children: [
        
                      Container(
                        height: 65,
                        margin: EdgeInsets.only(right: 20),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: TextField(
                            autofocus: true,
                            controller: controller1,
                            onChanged: (value) {
                              var last;
                              var first;
                              if (value.length == 1 && last == false) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.length == 0 && first == false) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            showCursor: false,
                            readOnly: false,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Colors.black12),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Colors.purple),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
        
                      Container(
                        height: 65,
                        margin: EdgeInsets.only(right: 20),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: TextField(
                            controller: controller2,
                            autofocus: true,
                            onChanged: (value) {
                              var last;
                              var first;
                              if (value.length == 1 && last == false) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.length == 0 && first == false) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            showCursor: false,
                            readOnly: false,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Colors.black12),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Colors.purple),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
        
                      Container(
                        height: 65,
                        margin: EdgeInsets.only(right: 20),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: TextField(
                            controller: controller3,
                            autofocus: true,
                            onChanged: (value) {
                              var last;
                              var first;
                              if (value.length == 1 && last == false) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.length == 0 && first == false) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            showCursor: false,
                            readOnly: false,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Colors.black12),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Colors.purple),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
        
                      Container(
                        height: 65,
                        margin: EdgeInsets.only(right: 20),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: TextField(
                            controller: controller4,
                            autofocus: true,
                            onChanged: (value) {
                              var last;
                              var first;
                              if (value.length == 1 && last == false) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.length == 0 && first == false) {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            showCursor: false,
                            readOnly: false,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Colors.black12),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 2, color: Colors.purple),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
              ),
        
        
              SizedBox(height: 20.0,),
               GestureDetector(
                  onTap: () => verifyOtp(context),
                  child: Consumer<ProviderServices>(
                    builder: (_, provider, __) => Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: provider.isLoading == true
                            ? const SpinKitCircle(
                                color: Colors.white,
                              )
                            : const Center(
                                child: Text('Verify Token',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500)),
                              )),
                  ))
            ],
          ),
        )
    );




  }
}
