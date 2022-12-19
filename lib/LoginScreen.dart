import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/apiservices/validator.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ProviderServices? providerServices;
  final _globalFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    super.initState();
  }

  void signIn(context) async {
    if (_globalFormKey.currentState!.validate()) {
      providerServices?.signIn(map: {
        "username": emailController.text,
        "password": passwordController.text,
        "type": "3",
        "device_id": "12312313213",
        "device_type": "ios",
        "device_name": "iphone 12",
        "device_token":
            "fWmhg-bbSfGEqOoHZkKCmj:APA91bGpk7jbGRVP75GFgf0g65_mDjYpWI259vsgAlcm_3EXqVI-h4n069lhPC1euSKSuUfDolkUZnW6OXIN7oQc3YpMeUPYUeXi9AgHAGEg_SE9xmtlrRhdnf2PSVpEM73flWRxivxV",
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
        return Colors.blueAccent;
      }
      return Colors.red;
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blueAccent,
        body: Form(
          key: _globalFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 12.0,bottom: 4.0),
                child: const Text('Welcome',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 40,color: Colors.white),),
              ),
        
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 12.0,bottom: 4.0),
                child: const Text('Back',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 40,color: Colors.white),),
              ),
        
              Container(
                height: MediaQuery.of(context).size.height/1.8,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),),),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25.0,),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.0),
                      child: Text('Email'),
                    ),
        
        
                    Container(
                      margin: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller:emailController,
                        validator:Validators.validateEmail(),
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
                            fillColor: const Color.fromRGBO(250,250,254,1)),
                      ),
                    ),
        
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.0),
                      child: Text('password'),
                    ),
                    Container(
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
                            fillColor: const Color.fromRGBO(250,250,254,1)),
                      ),
                    ),
        
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
        
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 13.0),
                          child: Text('Forgot password ?',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                        ),
        
                      ],
                    ),
        
        
                    GestureDetector(
                      onTap: () => signIn(context),
                      child: Consumer<ProviderServices>(
                        builder: (_, value, __) => Center(
                          child: Container(
                            height: screenHeight / 11,
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
                                      'Sign in',
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
        
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20.0)),
                        TextButton(onPressed: (){
        
                        },child: const Text('signup',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),)
                      ],
                    ),
                  ],
                ),
              ),
        
            ],
          ),
        )

    );
  }
}
