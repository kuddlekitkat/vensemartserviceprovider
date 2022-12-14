import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/screens/ChangePasswordScreen.dart';
import 'package:vensemartserviceprovider/screens/Enable2FAuthScreen.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderConnectedDevices.dart';
import 'package:vensemartserviceprovider/widgets/components/SecurityCard.dart';

class ServiceProviderSecurityScreen extends StatelessWidget {
  const ServiceProviderSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 2),
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title:  Text("Security"),
          leading:  IconButton(
            icon:  CircleAvatar(
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
          child: Column(
            children: [
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
                              Text('Change Password',style: TextStyle(color: Colors.black,fontSize: 19),),
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
                              builder: (context) => ChangePasswordScreen(),
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

              SizedBox(height: 10.0,),
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
                              Text('2 factor authentication',style: TextStyle(color: Colors.black,fontSize: 19),),
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
                              builder: (context) => Enable2FAuthScreen(),
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

              SizedBox(height: 10.0,),
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
                              Text('Connected Devices',style: TextStyle(color: Colors.black,fontSize: 19),),
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
                              builder: (context) => ServiceProviderConnectedDevices(),
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
      ),
    );
  }
}
