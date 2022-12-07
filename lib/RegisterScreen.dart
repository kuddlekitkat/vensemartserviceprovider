import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderHomeScreen.dart';

import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {

    var isChecked = false;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color(0xff1456f1);
      }
      return Colors.grey;
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff1456f1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 12.0,bottom: 4.0),
              child: Text('Sign up',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 40,color: Colors.white),),
            ),

            Container(
              height: MediaQuery.of(context).size.height/1.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),),),
              child: Column(
                children: [
                  SizedBox(height: 25.0,),

                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: TextFormField(
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
                          hintText: 'username',
                          prefixIcon: Icon(Icons.person),
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          fillColor: Color.fromRGBO(250,250,254,1)),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: TextFormField(
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
                          hintText: 'email',
                          prefixIcon: Icon(Icons.email_rounded),
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          fillColor: Color.fromRGBO(250,250,254,1)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: TextFormField(
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
                          hintText: ' +2348101013370',
                          prefixIcon: Container(

                            height: 40,
                            width: 45,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(234, 234, 234, 3),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))
                            ),
                            child: Center(
                              child: Container(
                                height: 20,
                                width: 30,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/flag.png')
                                    )
                                ),
                              ),
                            ),
                          ),
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          fillColor: Color.fromRGBO(250,250,254,1)),
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.all(12.0),
                    child: TextFormField(
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
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          fillColor: Color.fromRGBO(250,250,254,1)),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text('By checking the box,agree to our ',style: TextStyle(fontSize: 10),),

                      Text('terms and conditions',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w600,fontSize: 10),),

                    ],
                  ),

                  SizedBox(height: 5.0,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => ServiceProviderHomeScreen(),
                        ),
                      );

                    },
                    child: Container(
                      height: screenHeight/13,
                      width: screenWidth/1.07,
                      decoration: BoxDecoration(
                        color: Color(0xff1456f1),
                        borderRadius: BorderRadius.circular(40.0),

                      ),
                      child: Center(child: Text('Register', style: TextStyle(color: Colors.white,fontSize: 20.0),)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ',style: TextStyle(fontSize: 14),),

                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );

                        },
                        child: Text('signin',style: TextStyle(
                            color: Color(0xff1456f1),
                            fontSize: 14
                        ),),
                      )
                    ],
                  ),
                ],
              ),
            ),

          ],
        )


    );
  }
}
