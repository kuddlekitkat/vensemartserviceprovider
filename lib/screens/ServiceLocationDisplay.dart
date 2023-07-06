import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

class ServiceLocationDisplay extends StatefulWidget {
  ServiceLocationDisplay();

  @override
  State<ServiceLocationDisplay> createState() => _ServiceLocationDisplayState();
}

class _ServiceLocationDisplayState extends State<ServiceLocationDisplay> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ninController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  File? fileImage;
  ProviderServices? providerServices;
  final _globalFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
        appBar: AppBar(
          backgroundColor: const Color(0xff1456f1),
          title: const Text("Add Address"),
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
        body: Form(
          key: _globalFormKey,
          child: Consumer<ProviderServices>(
            builder: (_, provider, __) {
              if (provider.userLocationModel?.message == 'null') {
                return Center(
                  child: SpinKitCircle(
                    color: Colors.blue[900],
                  ),
                );
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4.0),
                      const SizedBox(height: 10.0),
                      const AutoSizeText('User Address '),
                      const SizedBox(height: 4.0),
                      Text(providerServices?.userDetailModel?.data?.location),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
