import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:vensemartserviceprovider/widgets/components/SubscriptionCard.dart';

import '../widgets/components/BankCard.dart';

class BankListScreen extends StatefulWidget {
  const BankListScreen({Key? key}) : super(key: key);

  @override
  State<BankListScreen> createState() =>
      _BankListScreenState();
}

class _BankListScreenState extends State<BankListScreen> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.bank_plans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 2),
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title: Text("Subscriptions"),
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Consumer<ProviderServices>(
                builder: (_, provider, __) {
                  print('object ${provider.bankProviderPlans?.data}');
                  if (provider.bankProviderPlans?.data == null) {
                    return const CircularProgressIndicator();
                  } else {
                    return Column(
                      children: [
                        ...provider.bankProviderPlans!.data!.map((e) {
                          print('print e for me $e');
                          return BankCard(
                            bankProviderPlans: e,
                          );
                        }).toList()
                        // ...?provider.serviceProviderPlans?.data!
                        //     .map((e) => SubscriptionCard(
                        //           servicesProviderPlans: e,
                        //         ))
                        //     .toList()

                        // SizedBox(height: 10,),
                        //   SubscriptionCard(),
                        // SizedBox(height: 10,),
                        // SubscriptionCard(),
                        // SizedBox(height: 10,),
                        // SubscriptionCard(),
                        // SizedBox(height: 10,),
                        // SubscriptionCard(),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
