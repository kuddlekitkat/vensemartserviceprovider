import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderHomeScreen.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:vensemartserviceprovider/widgets/full_page/ServiceProviderHome.dart';

class FeedBackScreen extends StatefulWidget {
  String bookingId;

  FeedBackScreen({required this.bookingId});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  ProviderServices? providerServices;
  var rating;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    super.initState();
  }

  void rateCustomer(context) async {
    if (true) {
      providerServices?.rateCustomer(map: {
        "booking_id": widget.bookingId.toString(),
        "rating": rating.toString()
      }, context: context);

      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1456f1),
        title: Text("Rate Customer"),
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
      body: Container(
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AutoSizeText(
            'Rate your experience',
            style: TextStyle(
                //ios : 1.5
                fontSize: 2.0 * MediaQuery.of(context).size.height * 0.01,
                decoration: TextDecoration.none,
                color: Colors.black),
          ),
          SizedBox(height: 10),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              rating = rating;
              print(rating);
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => rateCustomer(context),
                child: Consumer<ProviderServices>(
                  builder: (_, value, __) => Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 1.10,
                      decoration: BoxDecoration(
                        color: const Color(0xff1456f1),
                        borderRadius: BorderRadius.circular(90.0),
                      ),
                      child: value.isLoading == true
                          ? const SpinKitCircle(
                              color: Colors.white,
                            )
                          : Center(
                              child: Text(
                                'Rate Experience',
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
          )
        ]),
      ),
    );
  }
}
