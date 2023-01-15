import 'package:flutter/material.dart';

import '../../model/bank_plans.dart';

class BankCard extends StatelessWidget {
  BankCard({Key? key, this.bankProviderPlans}) : super(key: key);
  Data? bankProviderPlans;

  @override
  Widget build(BuildContext context) {
    print('set me up $bankProviderPlans');
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
              Text(bankProviderPlans?.code ?? ''),
              Container(
                height: screenheight / 10,
                width: screenwidth / 2,
                child: Text(
                  bankProviderPlans?.name ?? '',
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
                  bankProviderPlans?.name ?? '',
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
