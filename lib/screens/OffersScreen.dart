import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/widgets/components/OffersCard.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234,234,234,3),

        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: const [
                OffersCard(),
                SizedBox(height: 12.0),
                OffersCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
