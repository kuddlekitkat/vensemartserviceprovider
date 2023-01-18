import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../screens/provider/provider_services.dart';
import 'ServiceRequestCard.dart';

class RequestList extends StatefulWidget {
  const RequestList({Key? key}) : super(key: key);

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {


  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.upcomingRequests();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ProviderServices>(
        builder: (_, provider, __) {
      print('object ${provider.upcomingRequest?.data}');
      if (provider.upcomingRequest?.message == null) {

        return Center(child: SpinKitCircle(color: Colors.blue,));

      } else {

        return Column(
          children: [
            ...provider.upcomingRequest!.data!.map((e) {
              print('print e for me $e');
              return ServiceRequestCard(
                UpcomingRequest : e,
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
