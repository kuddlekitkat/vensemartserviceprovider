import 'package:flutter/material.dart';

class ServiceProviderConnectedDevices extends StatelessWidget {
  const ServiceProviderConnectedDevices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title:  Text("Connected Devices"),
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Authorized Devices',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400),),
              Text('You can remove any of the devices below'),
              SizedBox(height: 10.0,),
              Container(
                height: 70,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8.0),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(
                       offset: Offset(0, 1),
                       blurRadius: 5,
                       color: Colors.black.withOpacity(0.1),
                     ),
                   ],
                 ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('iPhone 11 pro',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                          Text('Date authorized, July 22 2022 '),

                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: GestureDetector( onTap: (){

                      },child: Icon(Icons.delete,color: Colors.red,),),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
