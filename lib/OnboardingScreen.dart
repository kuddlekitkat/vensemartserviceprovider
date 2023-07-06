import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'LoginScreen.dart';
import 'RegisterScreen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          right: 0,
          left: 0,
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.height / 1.01,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                ),
                image: DecorationImage(
                    image: AssetImage('assets/images/onboarding.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          top: 390,
          right: 0,
          left: 0,
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AutoSizeText(
                  'Welcome to Vensemart',
                  style: TextStyle(
                      fontSize: 2.3 * MediaQuery.of(context).size.height * 0.01,
                      color: Color(0xff1456f1),
                      fontWeight: FontWeight.bold),
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
                  child: Container(
                    height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Color(0xff003399),
                        borderRadius: BorderRadius.circular(400.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          width: 12.0,
                        ),
                        Icon(
                          Icons.email_rounded,
                          color: Colors.white,
                        ),
                        AutoSizeText(
                          'Sign in with email',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(400.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          width: 12.0,
                        ),
                        Icon(
                          Icons.email_sharp,
                          color: Colors.white,
                          size: 40,
                        ),
                        AutoSizeText(
                          'Sign up as a new user',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Don\'t have an account? ',
                      style: TextStyle(
                          fontSize:
                              2.0 * MediaQuery.of(context).size.height * 0.01,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => RegisterScreen()));
                        },
                        child: AutoSizeText(
                          'SIGNUP',
                          style: TextStyle(
                              fontSize: 2.0 *
                                  MediaQuery.of(context).size.height *
                                  0.01,
                              color: Color(0xff1456f1),
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
