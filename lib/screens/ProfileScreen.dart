import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/screens/FeedBackScreen.dart';
import 'package:vensemartserviceprovider/screens/IdentityVerificationScreen.dart';
import 'package:vensemartserviceprovider/screens/ProfileEditScreen.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderSecurityScreen.dart';
import 'package:vensemartserviceprovider/screens/SettingsScreen.dart';
import 'package:vensemartserviceprovider/screens/SubscriptionPlanListScreen.dart';

import '../LoginScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {





    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 234, 234, 2),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),

            Container(
              height: 150,

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Stack(
                      children:  [
                        Container(
                          height: 80,
                          width: double.infinity,
                          color: Color(0xff1456f1),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 130.0,top: 25.0),
                          child: CircleAvatar(
                            radius:50.0,
                            backgroundImage: AssetImage("assets/images/dp.png"),
                          ),
                        ),
                        Positioned(
                            top: 86,
                            left: 208,
                            child: Icon(Icons.camera_enhance_rounded,color: Colors.blue, size: 20,),),
                        Positioned(
                          top: 5,
                          left: 315,
                          child: Icon(Icons.edit,color: Colors.white, size: 20,),)


                      ],
                    ),

                  ],
                ),
              ),
            ),

            Center(
        child: Container(
        height: MediaQuery.of(context).size.height / 10,
        width: MediaQuery.of(context).size.width /1.08,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [

                SizedBox(width: 13.0),
                Icon(Icons.home,color: Colors.black,),
                SizedBox(width: 13.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Security',style: TextStyle(color: Colors.black,fontSize: 19),),
                    Text('Secure your account',style: TextStyle(color: Colors.grey)),
                  ],
                ),

              ],
            ),


            GestureDetector(
              onTap: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceProviderSecurityScreen(),
                  ),
                );

              },
              child: const Padding(
                padding: EdgeInsets.only(right: 19.0),
                child: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
              ),
            ),


          ],
        ),



      ),
    ),

            SizedBox(height: 10,),

            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width /1.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [

                        SizedBox(width: 13.0),
                        Icon(Icons.home,color: Colors.black,),
                        SizedBox(width: 13.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Profile',style: TextStyle(color: Colors.black,fontSize: 19),),
                            Text('Manage your profile',style: TextStyle(color: Colors.grey)),
                          ],
                        ),

                      ],
                    ),


                    GestureDetector(
                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileEditScreen(),
                          ),
                        );

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 19.0),
                        child: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                      ),
                    ),


                  ],
                ),



              ),
            ),


            SizedBox(height: 10,),

            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width /1.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [

                        SizedBox(width: 13.0),
                        Icon(Icons.home,color: Colors.black,),
                        SizedBox(width: 13.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('My Subscription',style: TextStyle(color: Colors.black,fontSize: 19),),
                            Text('Manage your subscription',style: TextStyle(color: Colors.grey)),
                          ],
                        ),

                      ],
                    ),


                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubscriptionPlanListScreen(),
                          ),
                        );

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 19.0),
                        child: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                      ),
                    ),


                  ],
                ),



              ),
            ),


            SizedBox(height: 10,),

            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width /1.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [

                        SizedBox(width: 13.0),
                        Icon(Icons.home,color: Colors.black,),
                        SizedBox(width: 13.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Account Verification',style: TextStyle(color: Colors.black,fontSize: 19),),
                            Text('Verify your identity to be verified',style: TextStyle(color: Colors.grey)),
                          ],
                        ),

                      ],
                    ),


                    GestureDetector(
                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IdentityVerificationScreen(),
                          ),
                        );

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 19.0),
                        child: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                      ),
                    ),


                  ],
                ),



              ),
            ),


            SizedBox(height: 10,),

            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width /1.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [

                        SizedBox(width: 13.0),
                        Icon(Icons.home,color: Colors.black,),
                        SizedBox(width: 13.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Feedback',style: TextStyle(color: Colors.black,fontSize: 19),),
                            Text('Report errors and bugs to improve the app',style: TextStyle(color: Colors.grey)),
                          ],
                        ),

                      ],
                    ),


                    GestureDetector(
                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeedBackScreen(),
                          ),
                        );

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 19.0),
                        child: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                      ),
                    ),


                  ],
                ),



              ),
            ),


            SizedBox(height: 10,),

            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width /1.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [

                        SizedBox(width: 13.0),
                        Icon(Icons.home,color: Colors.black,),
                        SizedBox(width: 13.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Preferences',style: TextStyle(color: Colors.black,fontSize: 19),),
                            Text('Customise vensemart to suit you',style: TextStyle(color: Colors.grey)),
                          ],
                        ),

                      ],
                    ),


                    GestureDetector(
                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsScreen(),
                          ),
                        );

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 19.0),
                        child: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                      ),
                    ),


                  ],
                ),



              ),
            ),


            SizedBox(height: 10,),

            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width /1.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [

                        SizedBox(width: 13.0),
                        Icon(Icons.home,color: Colors.black,),
                        SizedBox(width: 13.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Logout',style: TextStyle(color: Colors.black,fontSize: 19),),
                            Text('Sign out from vensemart',style: TextStyle(color: Colors.grey)),
                          ],
                        ),

                      ],
                    ),


                    GestureDetector(
                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 19.0),
                        child: Icon(Icons.keyboard_arrow_right,color: Colors.black,),
                      ),
                    ),


                  ],
                ),



              ),
            ),












          ],
        ),
      ),
    );
  }
}
