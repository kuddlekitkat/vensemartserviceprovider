import 'package:flutter/material.dart';

class ServiceRequestCard extends StatelessWidget {
  const ServiceRequestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
               children: const [
                 Text('New Service Request'),
                 Text('Garki, Area || '),
                 Text('From: aarondikko@gmail.com'),
                 Text('29 Oct 2022'),
               ],
             ),
           ),
           SizedBox(width: 20.0,),

           Column(
             mainAxisAlignment: MainAxisAlignment.end,

             children: [
               Container(
                 margin: EdgeInsets.only(bottom: 21.0),
                  width: MediaQuery.of(context).size.width/3.6,
                 height: MediaQuery.of(context).size.height/18,
                 decoration: BoxDecoration(
                   color: Color(0xff1456f1),
                   borderRadius: BorderRadius.circular(20.0)
                 ),
                 child: Center(child: Text('View',style: TextStyle(color: Colors.white)),),
               )
             ],
           )
         ]
       ),
    );
  }
}
