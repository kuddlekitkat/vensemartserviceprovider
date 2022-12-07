import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenheight/4.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0)
      ),
      padding: EdgeInsets.only(top: screenheight/15,left: screenwidth/8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text('Monthly Plan'),
               Container(
                 height: screenheight/10,
                 width: screenwidth/2,
                 child: Text('Monthly Plan for this package and enjoy one month'
                     ' unlimited access to daily job connections',style: TextStyle(fontSize: screenwidth/38),),
               ),
             ],
           ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Icon(Icons.bed),
              Container(
                height: screenheight/10,
                width: screenwidth/4,
                child: Text('1000',style: TextStyle(fontSize: screenwidth/25),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
