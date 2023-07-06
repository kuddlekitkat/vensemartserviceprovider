import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 234, 234, 1),
      appBar: AppBar(
        backgroundColor: const Color(0xff1456f1),
        title: Text("Update Profile"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText('Name'),
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
              AutoSizeText('Email'),
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
              AutoSizeText('Mobile Number'),
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
              AutoSizeText('Nin'),
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
              AutoSizeText('Date of birth'),
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
              AutoSizeText('Gender'),
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
              AutoSizeText('Address'),
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
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 15,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    color: Color(0xff1456f1),
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Center(
                    child: Text(
                      'Update Date',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              2.3 * MediaQuery.of(context).size.height * 0.01),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
