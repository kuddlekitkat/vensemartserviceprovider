import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/provider/provider_services.dart';
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
            print('object ${provider.canceledRequestModel?.data}');
            if (provider.canceledRequestModel?.message == 'No Data found') {
              return  Text('No Cancelled requests');
            } else {

              return Text('Cancelled requests');
            }

          }
      ),

    );
  }
}
