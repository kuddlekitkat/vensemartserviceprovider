import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData starting;
  final Function tapped;
  const ProfileCard(
      {required this.title,
      required this.description,
      required this.starting,
      required this.tapped});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Icon(
                starting,
                size: 35,
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                height: 50,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize:
                              2 * MediaQuery.of(context).size.height * 0.01),
                    ),
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
