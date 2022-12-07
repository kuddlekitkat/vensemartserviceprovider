import 'package:flutter/material.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 1),
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title:  Text("Profile Edit"),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name'),
                SizedBox(height: 4.0),
                TextField(
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
                Text('Email'),
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
                Text('Mobile Number'),
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
                Text('Nin'),
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
                Text('Date of birth'),
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
                Text('Gender'),
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
                Text('Address'),
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



                SizedBox(height: 30.0,),

                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height/15,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: Color(0xff1456f1),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: const Center(
                      child: Text( 'Update Date',style: TextStyle(color: Colors.white,fontSize: 22),),

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
