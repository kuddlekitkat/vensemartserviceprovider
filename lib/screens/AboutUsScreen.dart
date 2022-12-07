import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 3),
             body: Container(
               color: Colors.yellow,
               padding: EdgeInsets.all(20.0),
               child: SingleChildScrollView(
               child:SafeArea(
                 child: Container(
                   height: screenheight,
                   width: screenwidth,
                   color: Colors.green,
                   padding: EdgeInsets.all(20.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                      Container(
                        margin: EdgeInsets.all(12.0),
                        color: Colors.grey,
                        child: Column(
                          children: const [
                            Text('About Us'),
                            SizedBox(height: 12.0,),
                            Text('About Us is the true way of knowing if someone knows what they are doing or not'),

                       ]

                        ),
                      ),

                   ]
                   ),
                 ),
               ),
               ),
             ),
      ),
    );
  }
}
