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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(234, 234, 234, 3),

          leading: IconButton(
            icon: CircleAvatar(
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
          color: Color.fromRGBO(234, 234, 234, 3),
          padding: EdgeInsets.all(20.0),
          child: SafeArea(
            child: Container(
              height: screenheight,
              width: screenwidth,
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12.0),
                      color: Colors.white,
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
    );

  }
}
