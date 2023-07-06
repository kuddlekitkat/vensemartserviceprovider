import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/FeedBackScreen.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AcceptRejectBookingsScreen extends StatefulWidget {
  String bookingId;
  String userAddress;
  String userMobile;
  String date;
  AcceptRejectBookingsScreen(
      {required this.bookingId,
      required this.userAddress,
      required this.userMobile,
      required this.date});

  // const AcceptRejectBookingsScreen();

  @override
  State<AcceptRejectBookingsScreen> createState() =>
      _AcceptRejectBookingsScreenState();
}

class _AcceptRejectBookingsScreenState
    extends State<AcceptRejectBookingsScreen> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    super.initState();
  }

  void acceptBooking(context) async {
    if (true) {
      providerServices?.acceptRejectBooking(map: {
        "booking_id": widget.bookingId.toString(),
        "status": 3.toString()
      }, context: context);
      Navigator.of(context).popUntil((route) => route.isFirst);
      MapsLauncher.launchQuery(widget.userAddress);
    }
  }

  void rejectBooking(context) async {
    if (true) {
      providerServices?.acceptRejectBooking(map: {
        "booking_id": widget.bookingId.toString(),
        "status": 5.toString()
      }, context: context);
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  void endBooking(context) async {
    if (true) {
      providerServices?.endBooking(map: {
        "booking_id": widget.bookingId.toString(),
        "status": 4.toString()
      }, context: context);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                FeedBackScreen(bookingId: widget.bookingId.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 234, 234, 3),
      appBar: AppBar(
        backgroundColor: const Color(0xff1456f1),
        title: const Text("Request Screen"),
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
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 12),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeText(' New Request',
                      style: TextStyle(
                          fontSize:
                              2.0 * MediaQuery.of(context).size.height * 0.01,
                          fontWeight: FontWeight.bold)),
                  Text(
                    ' Location : ${widget.userAddress ?? 'no location'}',
                    style: TextStyle(
                        fontSize:
                            2.0 * MediaQuery.of(context).size.height * 0.01,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                      onPressed: () {
                        FlutterPhoneDirectCaller.callNumber(
                            '${widget?.userMobile ?? 'No number'}');
                      },
                      child: Text(
                        '${widget?.userMobile}',
                        style: TextStyle(
                            fontSize:
                                2.0 * MediaQuery.of(context).size.height * 0.01,
                            fontWeight: FontWeight.w400),
                      )),
                  AutoSizeText(' ${widget.date}',
                      style: TextStyle(
                          fontSize:
                              2.0 * MediaQuery.of(context).size.height * 0.01,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => acceptBooking(context),
                    child: Consumer<ProviderServices>(
                      builder: (_, value2, __) => Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          child: value2.isLoading == true
                              ? const SpinKitCircle(
                                  color: Colors.white,
                                )
                              : Center(
                                  child: Text(
                                    'Accept',
                                    style: TextStyle(
                                        color: Colors.white,
                                        //ios : 1.5
                                        fontSize: 2.0 *
                                            MediaQuery.of(context).size.height *
                                            0.01,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () => rejectBooking(context),
                    child: Consumer<ProviderServices>(
                      builder: (_, value1, __) => Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(90.0),
                          ),
                          child: value1.isLoading == true
                              ? const SpinKitCircle(
                                  color: Colors.white,
                                )
                              : Center(
                                  child: Text(
                                    'Reject',
                                    style: TextStyle(
                                        color: Colors.white,
                                        //ios : 1.5
                                        fontSize: 2.0 *
                                            MediaQuery.of(context).size.height *
                                            0.01,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 12, top: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // AutoSizeText('New Request',style: TextStyle(
                  //    //ios : 1.5
                  // fontSize: 2.0 *
                  // MediaQuery.of(context).size.height *
                  // 0.01, fontWeight: FontWeight.bold)),
                  Text(
                    'You will be redirected to google maps with the address once you accept ',
                    style: TextStyle(
                        fontSize:
                            1.5 * MediaQuery.of(context).size.height * 0.01,
                        fontWeight: FontWeight.w300),
                  ),

                  // AutoSizeText('29 October 2022',style: TextStyle( //ios : 1.5
                  // fontSize: 2.0 *
                  // MediaQuery.of(context).size.height *
                  // 0.01, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            GestureDetector(
              onTap: () => endBooking(context),
              child: Consumer<ProviderServices>(
                builder: (_, value3, __) => Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 14,
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: BoxDecoration(
                      color: const Color(0xff1456f1),
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                    child: value3.isLoading == true
                        ? const SpinKitCircle(
                            color: Colors.white,
                          )
                        : Center(
                            child: Text(
                              'Job Done',
                              style: TextStyle(
                                  color: Colors.white,
                                  //ios : 1.5
                                  fontSize: 2.0 *
                                      MediaQuery.of(context).size.height *
                                      0.01,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
