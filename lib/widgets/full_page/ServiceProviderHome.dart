import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:vensemartserviceprovider/widgets/components/ServiceRequestCard.dart';

class ServiceProviderHome extends StatefulWidget {
  const ServiceProviderHome({Key? key}) : super(key: key);

  @override
  State<ServiceProviderHome> createState() => _ServiceProviderHomeState();
}

class _ServiceProviderHomeState extends State<ServiceProviderHome> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.serviceHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderServices>(builder: (_, value, __) {
      if (value.serviceHomeModel?.data == null) {
        return SpinKitCircle(
          color: Colors.blue[900],
        );
      }
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('This Month'),
                  Text('View Report'),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        color: const Color(0xffFD5F88),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Stack(
                      children:  [
                        const Positioned(
                          top: 10,
                          left: 10,
                          child: Icon(
                            Icons.bar_chart_outlined,
                            size: 40.0,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 10,
                          child: Text(
                            value.serviceHomeModel?.data?.pendingRequests.toString()??'',
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const Positioned(
                          top: 90,
                          left: 10,
                          child: Text(
                            'Pending Request',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        color: const Color(0xff1456f1),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 10,
                          left: 10,
                          child: Icon(
                            Icons.bar_chart_outlined,
                            size: 40.0,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 10,
                          child: Text(
                            value.serviceHomeModel?.data?.completedRequests.toString()??'',
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const Positioned(
                          top: 90,
                          left: 10,
                          child: Text(
                            'Completed Request',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        color: const Color(0xffF03E3E),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Stack(
                      children:  [
                        const Positioned(
                          top: 10,
                          left: 10,
                          child: Icon(
                            Icons.bar_chart_outlined,
                            size: 40.0,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 10,
                          child: Text(
                            value.serviceHomeModel?.data?.cancelledRequests.toString()??'',
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const Positioned(
                          top: 90,
                          left: 10,
                          child: Text(
                            'Cancelled Request',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 6,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                        color: const Color(0xff0ECBA1),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Stack(
                      children:  [
                        const Positioned(
                          top: 10,
                          left: 10,
                          child: Icon(
                            Icons.bar_chart_outlined,
                            size: 40.0,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 10,
                          child: Text(
                            value.serviceHomeModel?.data?.totalRequests?.toString()??'',
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const Positioned(
                          top: 90,
                          left: 10,
                          child: Text(
                            'Total request Completed',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('New Request'),
              const SizedBox(
                height: 20.0,
              ),
              const ServiceRequestCard(),
              const SizedBox(
                height: 20.0,
              ),
              const ServiceRequestCard(),
            ],
          ),
        ),
      );
    });
  }
}
