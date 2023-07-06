import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderRequestScreen.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:vensemartserviceprovider/widgets/components/ServiceRequestCard.dart';

import '../../screens/ServiceProviderRequestScreenAlternate.dart';

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
    providerServices?.upcomingRequests();
    super.initState();
  }

  late DateTime currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;

      ScaffoldMessenger.of(context!).removeCurrentSnackBar();
      ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
        content: AutoSizeText('press back again to exit app'),
      ));
      return Future.value(false);
    }
    return Future.value(true);
  }

  var presscount = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderServices>(builder: (_, provider, __) {
      if (provider.serviceHomeModel?.data == null) {
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     AutoSizeText('This Month'),
              //     AutoSizeText('View Report'),
              //   ],
              // ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context!,
                        MaterialPageRoute(
                          builder: (context) =>
                              ServiceProviderRequestScreenAlternate(),
                        ),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: const Color(0xffFD5F88),
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
                            child: AutoSizeText(
                              provider.serviceHomeModel?.data?.pendingRequests
                                      .toString() ??
                                  '',
                              style: TextStyle(
                                  //ios : 1.5
                                  fontSize: 2.0 *
                                      MediaQuery.of(context).size.height *
                                      0.01,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            left: 10,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: AutoSizeText(
                                'Pending Request',
                                style: TextStyle(
                                    fontSize: 1.2 *
                                        MediaQuery.of(context).size.height *
                                        0.01,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context!,
                        MaterialPageRoute(
                          builder: (context) =>
                              ServiceProviderRequestScreenAlternate(),
                        ),
                      );
                    },
                    child: Container(
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
                            child: AutoSizeText(
                              provider.serviceHomeModel?.data?.completedRequests
                                      .toString() ??
                                  '',
                              style: TextStyle(
                                  //ios : 1.5
                                  fontSize: 2.0 *
                                      MediaQuery.of(context).size.height *
                                      0.01,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            left: 10,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: AutoSizeText(
                                'Completed Request',
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 1.2 *
                                        MediaQuery.of(context).size.height *
                                        0.01,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context!,
                        MaterialPageRoute(
                          builder: (context) =>
                              ServiceProviderRequestScreenAlternate(),
                        ),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: const Color(0xffF03E3E),
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
                              provider.serviceHomeModel?.data?.cancelledRequests
                                      .toString() ??
                                  '',
                              style: TextStyle(
                                  //ios : 1.5
                                  fontSize: 2.0 *
                                      MediaQuery.of(context).size.height *
                                      0.01,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            left: 10,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                'Cancelled Request',
                                style: TextStyle(
                                    fontSize: 1.2 *
                                        MediaQuery.of(context).size.height *
                                        0.01,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context!,
                        MaterialPageRoute(
                          builder: (context) =>
                              ServiceProviderRequestScreenAlternate(),
                        ),
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 6,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: const Color(0xff0ECBA1),
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
                              provider.serviceHomeModel?.data?.totalRequests
                                      ?.toString() ??
                                  '',
                              style: TextStyle(
                                  //ios : 1.5
                                  fontSize: 2.0 *
                                      MediaQuery.of(context).size.height *
                                      0.01,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Positioned(
                            top: 90,
                            left: 10,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                'Total requests',
                                style: TextStyle(
                                    fontSize: 1.2 *
                                        MediaQuery.of(context).size.height *
                                        0.01,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              // const AutoSizeText('New Request'),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  ...provider.serviceHomeModel!.data!.requests!.map((e) {
                    print('print e for me $e');
                    return const AutoSizeText('');
                  }).toList()
                ],
              )

              // const ServiceRequestCard(),
              // const SizedBox(
              //   height: 20.0,
              // ),
              // const ServiceRequestCard(),
            ],
          ),
        ),
      );
    });
  }
}
