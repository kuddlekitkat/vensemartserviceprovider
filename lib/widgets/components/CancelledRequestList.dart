import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../screens/provider/provider_services.dart';
import 'CancelledRequestCard.dart';
import 'ServiceRequestCard.dart';

class CancelledRequestList extends StatefulWidget {
  const CancelledRequestList({Key? key}) : super(key: key);

  @override
  State<CancelledRequestList> createState() => _CancelledRequestListState();
}

class _CancelledRequestListState extends State<CancelledRequestList> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.canceledRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ProviderServices>(
          builder: (_, provider, __) {
            print('object ${provider.cancelledRequestModel?.data}');
            if (provider.cancelledRequestModel?.message == null) {
              return Center(child: SpinKitCircle(color: Colors.blue,));
            } else {

              return Column(
                children: [
                  ...provider.cancelledRequestModel!.data!.map((e) {
                    print('print e for me $e');
                    return CancelledRequestCard(
                      CancelledRequestModel : e,
                    );

                  }).toList()
                ],
              );
            }

          }
      ),

    );
  }
}
