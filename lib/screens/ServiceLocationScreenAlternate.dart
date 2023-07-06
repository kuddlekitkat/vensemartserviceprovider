import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ServiceLocationScreenAlternate extends StatefulWidget {
  const ServiceLocationScreenAlternate({Key? key}) : super(key: key);

  @override
  State<ServiceLocationScreenAlternate> createState() =>
      _ServiceLocationScreenAlternateState();
}

class _ServiceLocationScreenAlternateState
    extends State<ServiceLocationScreenAlternate> {
  ProviderServices? providerServices;
  TextEditingController controller = TextEditingController();
  List searchItem = [];

  int intval = 0;
  String? selectedValue;
  late Position position;
  late List<Placemark> placeMarks;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getLocation();
    addressController.text =
        providerServices?.userLocationModel?.data?.location ?? '';
    print('addresscontroller');
    print('$addressController.text');

    super.initState();
  }

  void sendLocationAlternate(context) async {
    providerServices?.sendLocationAlternate(map: {
      "location": addressController.text,
      "location_lat": "9.0787",
      "location_long": "7.47018",
      "state": "Abuja"
    }, context: context);
  }

  Future<Position?> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
  }

  getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const AutoSizeText('please wait, getting your current location'),
      duration: const Duration(seconds: 10),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));

    Position newPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    position = newPosition;
    placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark pMark = placeMarks[0];
    String completeAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.locality},'
        '${pMark.subAdministrativeArea}  ${pMark.postalCode}';
    addressController.text = completeAddress;

    getCurrentLocation();
    setState(() {
      addressController.text = completeAddress;
    });
  }

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      ' Abuja',
    ];

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xff1456f1),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 12.0, bottom: 4.0),
                child: AutoSizeText(
                  'Address Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 3 * MediaQuery.of(context).size.height * 0.01,
                      color: Colors.white),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25.0,
                    ),
                    Container(
                      margin: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            hintText: 'Enter Address',
                            prefixIcon: IconButton(
                                onPressed: () {
                                  getCurrentLocation();
                                },
                                icon: const Icon(Icons.location_on)),
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            fillColor: const Color.fromRGBO(250, 250, 254, 1)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(250, 250, 254, 1),
                          borderRadius:
                              BorderRadius.circular(12.0) //<-- SEE HERE
                          ),
                      margin: const EdgeInsets.all(12.0),
                      child: Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(
                              'Select State',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item.toString(),
                                      child: Text(
                                        item.toString(),
                                        style: TextStyle(
                                          //ios : 1.5
                                          fontSize: 2.0 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            // buttonHeight: 70,
                            // buttonWidth: 280,
                            // itemHeight: 50,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => sendLocationAlternate(context),
                      child: Consumer<ProviderServices>(
                        builder: (_, value, __) => Center(
                          child: Container(
                            height: screenHeight / 11,
                            width: screenWidth / 1.10,
                            decoration: BoxDecoration(
                              color: const Color(0xff1456f1),
                              borderRadius: BorderRadius.circular(90.0),
                            ),
                            child: value.isLoading == true
                                ? const SpinKitCircle(
                                    color: Colors.white,
                                  )
                                : Center(
                                    child: Text(
                                      'Proceed',
                                      style: TextStyle(
                                          color: Colors.white,
                                          //ios : 1.5
                                          fontSize: 2.0 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
