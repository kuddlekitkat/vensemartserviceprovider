import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/model/upcoming_request.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ServiceRequestCard extends StatelessWidget {
  Data? UpcomingRequest;
  ServiceRequestCard({Key? key, required this.UpcomingRequest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('set me up $UpcomingRequest');
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
      height: MediaQuery.of(context).size.height / 6,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 22, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText('New Service Request'),
                  AutoSizeText('${UpcomingRequest?.name ?? 'no name'}' ?? ''),
                  AutoSizeText('From: ${UpcomingRequest?.email ?? 'no email'}'),
                  AutoSizeText('${UpcomingRequest?.bookingDate ?? 'no date'}'),
                  AutoSizeText('${UpcomingRequest?.bookingTime ?? 'no time'}'),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 21.0),
                  width: MediaQuery.of(context).size.width / 3.6,
                  height: MediaQuery.of(context).size.height / 18,
                  decoration: BoxDecoration(
                      color: Color(0xff1456f1),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                    child: AutoSizeText('View',
                        style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            )
          ]),
    );
  }
}
