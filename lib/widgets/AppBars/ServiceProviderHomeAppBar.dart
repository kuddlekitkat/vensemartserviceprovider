import 'package:flutter/material.dart';

class ServiceProviderHomeAppBar extends StatelessWidget {
  const ServiceProviderHomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.sort),color: Colors.black,),
        title: Center(child: const Text('Home',style: TextStyle(color: Colors.black),)),
        backgroundColor: Colors.white,
        elevation: 0.00,
        actions: [

          IconButton(onPressed: (){

          }, icon: Icon(Icons.search,color: Colors.black,),),


          Icon(Icons.doorbell,color: Colors.black,),
          SizedBox(width: 12,),
        ],
      ),
    );
  }
}
