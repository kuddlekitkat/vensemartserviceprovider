import 'package:flutter/material.dart';

class RequestAppBar extends StatelessWidget {
  const RequestAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title:  Text("Request Screen"),
          leading: IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.sort),color: Colors.black,),
        ),
      ),
    );
  }
}
