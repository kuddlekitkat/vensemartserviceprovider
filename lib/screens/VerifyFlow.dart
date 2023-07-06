import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class VerifyFlow extends StatefulWidget {
  const VerifyFlow({Key? key}) : super(key: key);

  @override
  State<VerifyFlow> createState() => _VerifyFlowState();
}

class _VerifyFlowState extends State<VerifyFlow> {
  void main(List<String> arguments) async {
    final Map<String, String> _requestHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'text/plain',
      'AppId': '639b0afe93de39003589f6c8',
    };

    var url = Uri.https('api.dojah.io', 'api/v1/kyc/photoid/verify');

    var response = await http.post(url, headers: _requestHeaders, body: {
      'photoid_image': 'name',
      'selfie_image': 'selfie_image',
      'last_name': 'Michael',
      'first_name': 'Adamgbe'
    });
    // Await the http get response, then decode the json-formatted response.

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['confidence_value'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  ProviderServices? providerServices;
  final _globalFormKey = GlobalKey<FormState>();
  bool isGranted = false;
  bool isLocationGranted = false;
  dynamic locationData;
  dynamic timeZone;
  dynamic zoneOffset;
  dynamic locationObject;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getUserDetails();
    initCameraPermissions();

    super.initState();
  }

  Future initCameraPermissions() async {
    await Permission.locationWhenInUse.request();
    if (await Permission.camera.request().isGranted) {
      setState(() {
        isGranted = true;
      });
    }
  }

  void updateProfile(context) async {
    providerServices?.verifyUler(credentials: {
      "photoid_image": "Michael",
      "selfie_image": "James",
      "first_name": "James",
      "last_name": "James",
    }, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Center(
        child: Container(
          child: ElevatedButton(
              child: AutoSizeText('Open URL In App'),
              onPressed: () async {
                // updateProfile(context);

                String appId = '639b0afe93de39003589f6c8';
                String publicKey = 'prod_pk_A5ZrkmiEbMQQRGjpZU3L1z7hz';
                // String  type = 'verification';
                //link, identification, verification, liveness, payment (required)

                //
                // final Map<String,dynamic> config = {
                //   debug: true,
                //   otp: true, //for verification type
                //   selfie: true //for verification type
                // };

                //
                //
                //

                //
                // final DojahFinancial dojahFinancial = DojahFinancial(
                //       appId: '639b0afe93de39003589f6c8',
                //        publicKey: 'prod_pk_A5ZrkmiEbMQQRGjpZU3L1z7hz',
                //       type : 'verification',   //link, identification, verification, liveness, payment (required)
                //
                // );
                //
                // dojahFinancial.open(context, onSuccess: (result) {
                //   print('$result');
                // }, onError: (err) {
                //   print('error: $err');
                // });
                //
                //   final Uri url = Uri.parse('https://identity.dojah.io?widget_id=63dbbb1c8d10350034b0eb8c');
                //
                //   _launchInWebViewOrVC(url);
              }),
        ),
      ),
    );
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.platformDefault,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
