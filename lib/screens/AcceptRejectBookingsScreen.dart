import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';


class AcceptRejectBookingsScreen extends StatefulWidget {
  // String bookingId;
  // String userAddress;
  //  AcceptRejectBookingsScreen({required this.bookingId, required this.userAddress});

   const AcceptRejectBookingsScreen();

  @override
  State<AcceptRejectBookingsScreen> createState() => _AcceptRejectBookingsScreenState();
}

class _AcceptRejectBookingsScreenState extends State<AcceptRejectBookingsScreen> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    super.initState();
  }

  void acceptBooking(context) async {
    if (true) {
      providerServices?.acceptRejectBooking(map: {
        "booking_id": 1.toString(),
        "status": 1.toString()
      }, context: context);
    }
  }


  void rejectBooking(context) async {
    if (true) {
      providerServices?.acceptRejectBooking(map: {
        "booking_id":1.toString(),
        "status": 2.toString()
      }, context: context);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 48.0),
          child: Column(
            children: [

              SizedBox(height: 90.0,),
              Row(
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
                              : const Center(
                            child: Text(
                              'Accept',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 20,),

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
                              : const Center(
                            child: Text(
                              'Reject',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
