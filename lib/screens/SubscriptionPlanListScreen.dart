import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/widgets/components/SubscriptionCard.dart';

class SubscriptionPlanListScreen extends StatelessWidget {
  const SubscriptionPlanListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 2),
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title:  Text("Subscriptions"),
          leading:  IconButton(
            icon:  CircleAvatar(
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                 children: [
                   SizedBox(height: 10,),
                     SubscriptionCard(),
                   SizedBox(height: 10,),
                   SubscriptionCard(),
                   SizedBox(height: 10,),
                   SubscriptionCard(),
                   SizedBox(height: 10,),
                   SubscriptionCard(),

                 ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
