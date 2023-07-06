import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0.1),
            blurRadius: 1,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight / 8,
            width: screenWidth / 4.6,
            margin: EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              color: Color(0xff1456f1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
              ),
            ),
            child: Center(
              child: AutoSizeText(
                '14',
                style: TextStyle(
                    fontSize: 2.3 * MediaQuery.of(context).size.height * 0.01,
                    color: Colors.white),
              ),
            ),
          ),
          Container(
            height: screenHeight / 8,
            width: screenHeight / 3.5,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "Get 10% discount for  exciting customers and many "
                    "more discounts on the way",
                    style: TextStyle(
                        fontSize:
                            1.5 * MediaQuery.of(context).size.height * 0.01,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
