import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:vensemartserviceprovider/widgets/components/SubscriptionCard.dart';

class SubscriptionPlanListScreen extends StatefulWidget {
  const SubscriptionPlanListScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionPlanListScreen> createState() =>
      _SubscriptionPlanListScreenState();
}

class _SubscriptionPlanListScreenState
    extends State<SubscriptionPlanListScreen> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.serviceproviderplans();
    providerServices?.getUserDetails();
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
                  print('object ${provider.serviceProviderPlans?.data}');
                  if (provider.serviceProviderPlans?.data == null) {
                    return Center(child: SpinKitCircle(color: Colors.blue,));
                  } else {
                    return Column(
                      children: [
                        ...provider.serviceProviderPlans!.data!.map((e) {
                          print('print e for me $e');
                          return SubscriptionCard(
                            servicesProviderPlans: e,
                            loginModel : provider.loginModel,
                            userDetailsModel: provider.userDetailModel,

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
