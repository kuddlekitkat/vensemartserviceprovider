import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/screens/IdentityVerificationCompleteScreen.dart';

class AddressVerificationScreen extends StatelessWidget {
  const AddressVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title:  Text("Address Verification"),
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('state'),
                SizedBox(height: 4.0),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[600]),
                      fillColor: Colors.white),

                ),
                SizedBox(height: 14.0),
                Text('LGA'),
                SizedBox(height: 4.0),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[600]),
                      fillColor: Colors.white),

                ),
                SizedBox(height: 14.0),
                Text('Home Address'),
                SizedBox(height: 4.0),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[600]),
                      fillColor: Colors.white),

                ),
                SizedBox(height: 14.0),
                Text('Shop Address'),
                SizedBox(height: 4.0),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[600]),
                      fillColor: Colors.white),

                ),

                SizedBox(height: 14.0),
                Text('Closest Landmark'),
                SizedBox(height: 4.0),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintStyle: new TextStyle(color: Colors.grey[600]),
                      fillColor: Colors.white),

                ),

                SizedBox(height: 15,),

                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ],
                ),





                SizedBox(height: 40.0,),



                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IdentityVerificationComplete(),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height/13,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                        color: Color(0xff1456f1),
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: const Center(
                        child: Text( 'Continue',style: TextStyle(color: Colors.white,fontSize: 22),),

                      ),
                    ),
                  ),
                )
              ],


            ),
          ),
        ),
      ),

    );

  }
}
