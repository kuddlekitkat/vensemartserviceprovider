import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

import 'LoginScreen.dart';
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

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    super.initState();
  }

  void signUp(context) async {
    if (_globalFormKey.currentState!.validate() && isChecked == true) {
      phoneNumber = phnoeNumberController.text.trim();
      setState(() {});
      providerServices?.register(map: {
        "type": "3",
        "device_id": "12312313213",
        "device_type": "ios",
        "device_name": "iphone 12",
        "device_token":
            "fWmhg-bbSfGEqOoHZkKCmj:APA91bGpk7jbGRVP75GFgf0g65_mDjYpWI259vsgAlcm_3EXqVI-h4n069lhPC1euSKSuUfDolkUZnW6OXIN7oQc3YpMeUPYUeXi9AgHAGEg_SE9xmtlrRhdnf2PSVpEM73flWRxivxV",
        "name": usernameController.text.trim(),
        "email": emailController.text.trim(),
        "mobile": phnoeNumberController.text.trim(),
        "password": passwordController.text.trim(),
        "state": "FCT",
        "town": "Abuja"
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
        return Color(0xff1456f1);
      }
      return Colors.grey;
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff1456f1),
        body: Form(
          key: _globalFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 12.0, bottom: 4.0),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.4,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      margin: EdgeInsets.all(12.0),
                      child: TextFormField(
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
                            hintText: 'username',
                            prefixIcon: Icon(Icons.person),
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Color.fromRGBO(250, 250, 254, 1)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(12.0),
                      child: TextFormField(
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
                            prefixIcon: Icon(Icons.email_rounded),
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Color.fromRGBO(250, 250, 254, 1)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(12.0),
                      child: TextFormField(
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
                            hintText: ' +2348101013370',
                            prefixIcon: Container(
                              height: 40,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(234, 234, 234, 3),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0))),
                              child: Center(
                                child: Container(
                                  height: 20,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/flag.png'))),
                                ),
                              ),
                            ),
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Color.fromRGBO(250, 250, 254, 1)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: passwordController,
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
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye),
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Color.fromRGBO(250, 250, 254, 1)),
                      ),
                    ),
                    Row(
                      children: [
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
                        Text(
                          'By checking the box,agree to our ',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          'terms and conditions',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                              fontSize: 10),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    GestureDetector(
                      onTap: () => signUp(context),
                      child: Consumer<ProviderServices>(
                        builder: (_, provider, __) => Container(
                          height: screenHeight / 13,
                          width: screenWidth / 1.07,
                          decoration: BoxDecoration(
                            color: const Color(0xff1456f1),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: provider.isLoading == true
                              ? const SpinKitCircle(
                                  color: Colors.white,
                                )
                              : const Center(
                                  child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'signin',
                            style: TextStyle(
                                color: Color(0xff1456f1), fontSize: 14),
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
