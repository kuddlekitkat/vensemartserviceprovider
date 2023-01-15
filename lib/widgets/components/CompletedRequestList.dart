import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/provider/provider_services.dart';
import 'ServiceRequestCard.dart';

class CompletedRequestList extends StatefulWidget {
  const CompletedRequestList({Key? key}) : super(key: key);

  @override
  State<CompletedRequestList> createState() => _CompletedRequestListState();
}

class _CompletedRequestListState extends State<CompletedRequestList> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.completedRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ProviderServices>(
          builder: (_, provider, __) {
            print('object ${provider.completedRequestModel?.data}');
            if (provider.completedRequestModel?.message == 'No Data found') {
              return const Text('No completed Requests');
            } else {

              return Text('completed');
            }

          }
      ),

    );
  }
}
