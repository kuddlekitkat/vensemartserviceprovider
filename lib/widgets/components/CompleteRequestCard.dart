import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/model/completed_request.dart';


class CompletedRequestCard extends StatelessWidget {
  final Data? CompletedRequestModel;
  CompletedRequestCard({Key? key, required this.CompletedRequestModel}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    print('set me up $CompletedRequestModel');
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0.1),
            blurRadius: 1,
            color: Colors.black.withOpacity(0.1),
          ),
        ],

      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height/6,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(
              margin: EdgeInsets.only(top: 22,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text('New Completed Request'),
                  // Text('${CompletedRequestModel?.name}' ?? ''),
                  Flexible(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      strutStyle: StrutStyle(fontSize: 40.0),
                      text: TextSpan(
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
                          text: 'From ${CompletedRequestModel?.name} '),
                    ),
                  ),
                  Text('${CompletedRequestModel?.bookingDate}'),
                  Text('${CompletedRequestModel?.bookingTime}'),
                ],
              ),
            ),
            SizedBox(width: 20.0,),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                // Container(
                //   margin: EdgeInsets.only(bottom: 21.0),
                //   width: MediaQuery.of(context).size.width/3.6,
                //   height: MediaQuery.of(context).size.height/18,
                //   decoration: BoxDecoration(
                //       color: Color(0xff1456f1),
                //       borderRadius: BorderRadius.circular(20.0)
                //   ),
                //   child: Center(child: Text('View',style: TextStyle(color: Colors.white)),),
                // )
              ],
            )
          ]
      ),
    );
  }
}
