import 'package:flutter/material.dart';

import 'LoginScreen.dart';
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
                height: 500,
                width: 500,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/images/onboarding.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
            ),
            Positioned(
              top: 390,
              right: 0,
              left: 0,
              child: Container(
                height: 400,
                width: 400,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0),topRight: Radius.circular(50.0))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Welcome to Vensemart',style: TextStyle(fontSize: 22.0,color: Color(0xff1456f1),fontWeight: FontWeight.bold),),

                    GestureDetector(
                      onTap: (){

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
                            borderRadius: BorderRadius.circular(400.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            SizedBox(width: 12.0,),
                            Icon(Icons.email_rounded,color: Colors.white,),
                            Text('Sign in with email',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),),
                            SizedBox(width: 12.0,),
                            SizedBox(width: 12.0,),
                            SizedBox(width: 12.0,),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
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
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(400.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            SizedBox(width: 12.0,),
                            Icon(Icons.facebook_sharp,color: Colors.white,size: 40,),
                            Text('Sign in with facebook',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),),
                            SizedBox(width: 12.0,),
                            SizedBox(width: 12.0,),
                            SizedBox(width: 12.0,),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Text('Don\'t have an account?',style: TextStyle(fontSize: 10.0,color: Colors.blue,fontWeight: FontWeight.bold),),
                        Text('SIGNUP',style: TextStyle(fontSize: 12.0,color: Colors.blue,fontWeight: FontWeight.bold),),
                      ],
                    ),

                  ],
                ),
              ),
            ),

          ],
        )
    );

  }
}
