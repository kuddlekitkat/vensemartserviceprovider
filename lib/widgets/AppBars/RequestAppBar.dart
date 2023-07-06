import 'package:flutter/material.dart';

class RequestAppBar extends StatelessWidget {
  const RequestAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff1456f1),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Text(
          '.',
          style: TextStyle(backgroundColor: Colors.blue),
        ),
        // child: Scaffold(
        //   appBar: AppBar(
        //     backgroundColor: Color(0xff1456f1),
        //     title:  Text("Request Screen"),
        //     leading: IconButton(onPressed: (){
        //       Scaffold.of(context).openDrawer();
        //     }, icon: Icon(Icons.sort),color: Colors.black,),
        //   ),
        // ),
      ),
    );
  }
}
