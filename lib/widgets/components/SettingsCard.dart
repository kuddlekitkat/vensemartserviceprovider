import 'package:flutter/material.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard({Key? key}) : super(key: key);

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {


  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {



    return Center(
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
                      onChanged: toggleSwitch,
                      value: isSwitched,
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
    );
  }
}
