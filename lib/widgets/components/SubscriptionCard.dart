import 'package:flutter/material.dart';

import '../../model/service_provider_plans.dart';

class SubscriptionCard extends StatelessWidget {
  SubscriptionCard({Key? key, this.servicesProviderPlans}) : super(key: key);
  Data? servicesProviderPlans;

  @override
  Widget build(BuildContext context) {
    print('set me up $servicesProviderPlans');
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenheight / 4.7,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      padding: EdgeInsets.only(top: screenheight / 15, left: screenwidth / 8),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(servicesProviderPlans?.planType ?? ''),
              Container(
                height: screenheight / 10,
                width: screenwidth / 2,
                child: Text(
                  servicesProviderPlans?.discription ?? '',
                  style: TextStyle(fontSize: screenwidth / 38),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.bed),
              Container(
                height: screenheight / 10,
                width: screenwidth / 4,
                child: Text(
                  servicesProviderPlans?.amount ?? '',
                  style: TextStyle(fontSize: screenwidth / 25),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
