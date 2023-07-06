import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CompleteBookingsScreen extends StatefulWidget {
  final String bookingId;
  final String userAddress;
  CompleteBookingsScreen({required this.bookingId, required this.userAddress});

  // const AcceptRejectBookingsScreen();

  @override
  State<CompleteBookingsScreen> createState() => _CompleteBookingsScreenState();
}

class _CompleteBookingsScreenState extends State<CompleteBookingsScreen> {
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
        "status": 1.toString()
      }, context: context);

      // MapsLauncher.launchQuery(
      //     widget.userAddress);
    }
  }

  void endBooking(context) async {
    if (true) {
      providerServices?.endBooking(map: {
        "booking_id": widget.bookingId.toString(),
        "status": 3.toString()
      }, context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 3),
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title: Text("End Booking"),
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
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 12),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AutoSizeText('End booking',
                        style: TextStyle(
                            fontSize:
                                1.5 * MediaQuery.of(context).size.height * 0.01,
                            fontWeight: FontWeight.bold)),
                    AutoSizeText(
                      'Location : ${widget.userAddress}',
                      style: TextStyle(
                          fontSize:
                              1.5 * MediaQuery.of(context).size.height * 0.01,
                          fontWeight: FontWeight.w400),
                    ),
                    AutoSizeText('29 October 2022',
                        style: TextStyle(
                            fontSize:
                                1.5 * MediaQuery.of(context).size.height * 0.01,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
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
                                      'End Booking',
                                      style: TextStyle(
                                          color: Colors.white,
                                          //ios : 1.5
                                          fontSize: 2.0 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height *
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
              SizedBox(
                height: 90.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 12, top: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // AutoSizeText('New Request',style: TextStyle( //ios : 1.5
                    // fontSize: 2.0 *
                    // MediaQuery.of(context).size.height *
                    // 0.01, fontWeight: FontWeight.bold)),
                    AutoSizeText(
                      'Having completed your booking, please kindly end it ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w300),
                    ),

                    // AutoSizeText('29 October 2022',style: TextStyle( //ios : 1.5
                    // fontSize: 2.0 *
                    // MediaQuery.of(context).size.height *
                    // 0.01, fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
