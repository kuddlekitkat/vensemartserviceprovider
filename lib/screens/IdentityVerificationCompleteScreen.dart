import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'IdentityVerificationScreen.dart';

class IdentityVerificationComplete extends StatelessWidget {
  const IdentityVerificationComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 2),
        appBar: AppBar(
          title: AutoSizeText('Identity Verification'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 1.08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 13.0),
                          Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                          SizedBox(width: 13.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Security',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 2 *
                                        MediaQuery.of(context).size.height *
                                        0.01),
                              ),
                              AutoSizeText('Secure your account',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  IdentityVerificationScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 19.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 1.08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 13.0),
                          Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                          SizedBox(width: 13.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'Security',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 2 *
                                        MediaQuery.of(context).size.height *
                                        0.01),
                              ),
                              AutoSizeText('Secure your account',
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  IdentityVerificationScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 19.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
