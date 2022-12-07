import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:vensemartserviceprovider/widgets/components/SecurityCard.dart';

import '../widgets/components/SettingsCard.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;


  var textValue = 'Switch is OFF';

  void toggleSwitch1(bool value) {

    if(isSwitched1 == false)
    {
      setState(() {
        isSwitched1 = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched1 = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitch2(bool value) {

    if(isSwitched2 == false)
    {
      setState(() {
        isSwitched2 = true;

      });
      print('Switch Button2 is ON');
    }
    else
    {
      setState(() {
        isSwitched2 = false;

      });
      print('Switch Button is OFF');
    }
  }

  void toggleSwitch3(bool value) {

    if(isSwitched3 == false)
    {
      setState(() {
        isSwitched3 = true;

      });
      print('Switch Button3 is ON');
    }
    else
    {
      setState(() {
        isSwitched3 = false;

      });
      print('Switch Button3 is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 3),
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title:  Text("Settings"),
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
        body: Container(
          color: Colors.white,
          child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                SizedBox(height: 20),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 16,
                width: MediaQuery.of(context).size.width /1.08,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0),topRight: Radius.circular(12.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [

                        SizedBox(width: 13.0),
                        Icon(Icons.whatsapp,color: Colors.green,),
                        SizedBox(width: 13.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Change Password'),
                            Text('Create new Password'),
                          ],
                        ),

                      ],
                    ),




                    GestureDetector(
                      onTap: (){



                      },
                      child:  Padding(
                        padding: EdgeInsets.only(right: 19.0),
                        child: Transform.scale(
                            scale: 1,
                            child: Switch(
                              onChanged: toggleSwitch1,
                              value: isSwitched1,
                              activeColor: Colors.blue,
                              activeTrackColor: Colors.yellow,
                              inactiveThumbColor: Colors.redAccent,
                              inactiveTrackColor: Colors.orange,
                            )
                        ),

                      ),
                    ),


                  ],
                ),



              ),
            ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width /1.08,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: [

                          SizedBox(width: 13.0),
                          Icon(Icons.chat,color: Colors.greenAccent,),
                          SizedBox(width: 13.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Change Password'),
                              Text('Create new Password'),
                            ],
                          ),

                        ],
                      ),




                      GestureDetector(
                        onTap: (){



                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 19.0),
                          child: Transform.scale(
                              scale: 1,
                              child: Switch(
                                onChanged: toggleSwitch2,
                                value: isSwitched2,
                                activeColor: Colors.blue,
                                activeTrackColor: Colors.yellow,
                                inactiveThumbColor: Colors.redAccent,
                                inactiveTrackColor: Colors.orange,
                              )
                          ),
                        ),
                      ),

                    ],
                  ),



                ),
              ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 16,
                width: MediaQuery.of(context).size.width /1.08,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0),bottomRight: Radius.circular(12.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [

                        SizedBox(width: 13.0),
                        Icon(Icons.notifications,color: Colors.red,),
                        SizedBox(width: 13.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Change Password'),
                            Text('Create new Password'),
                          ],
                        ),

                      ],
                    ),




                    GestureDetector(
                      onTap: (){

                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 19.0),
                        child: Transform.scale(
                            scale: 1,
                            child: Switch(
                              onChanged: toggleSwitch3,
                              value: isSwitched3,
                              activeColor: Colors.blue,
                              activeTrackColor: Colors.yellow,
                              inactiveThumbColor: Colors.redAccent,
                              inactiveTrackColor: Colors.orange,
                            )
                        ),

                      ),
                    ),


                  ],
                ),



              ),
            ),



              ]

          ),
        ),
      ),
    );
  }
}
