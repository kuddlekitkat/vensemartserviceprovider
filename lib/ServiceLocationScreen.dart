import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderHomeScreen.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

class ServiceLocationScreen extends StatefulWidget {
  const ServiceLocationScreen({Key? key}) : super(key: key);

  @override
  State<ServiceLocationScreen> createState() => _ServiceLocationScreenState();
}

class _ServiceLocationScreenState extends State<ServiceLocationScreen> {
  ProviderServices? providerServices;
  TextEditingController controller = TextEditingController();
  String _query = '';
  List searchItem = [];

  int intval = 0;
  String? selectedValue;
  String? emptyValue = ' ';

  late Position position;
  late List<Placemark> placeMarks;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getUserDetails();
    SchedulerBinding.instance
        .addPostFrameCallback((_) => showAlertDialog(context));
    super.initState();
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("NO"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("YES"),
      onPressed: () {
        getCurrentLocation();

        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Location Disclaimer"),
      content: Text("Vensemart collects location data to get closest customers "
          "around you and tailor notifications and"
          " advertisements to make your experience on the app better, "
          "you can always change it from the main "
          "dashboard, would you like to proceed?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void sendLocation(context) async {
    GeoCode geoCode = GeoCode();
    if (true) {
      final query = addressController.text.trim();

      providerServices?.sendLocation(map: {
        "location": addressController.text.trim(),
        "location_lat": "9.0658",
        "location_long": "7.4287",
        "state": selectedValue.toString()
      }, context: context);
    }
  }

  void setAddress(context) async {
    providerServices?.sendLocation(map: {
      "location": addressController.text.trim(),
      "location_lat": "9.0658",
      "location_long": "7.4287",
      "state": selectedValue.toString()
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
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context!).removeCurrentSnackBar();
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
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
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark pMark = placeMarks![0];
    String completeAddress =
        '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.locality},'
        '${pMark.subAdministrativeArea}  ${pMark.postalCode}';
    addressController.text = completeAddress;

    getCurrentLocation();
    setState(() {
      addressController.text = completeAddress;
    });
  }

  // Future<void> printLatLong() async {
  //   final query = addressController.text.trim();
  //   var addresses = await Geocoder.local.findAddressesFromQuery(query);
  //   var first = addresses.first;
  //   print("${first.featureName} : ${first.coordinates.latitude}");
  //
  // }

  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Abuja',
    ];

    List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
      List<DropdownMenuItem<String>> _menuItems = [];
      for (var item in items) {
        _menuItems.addAll(
          [
            DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  item,
                  style: TextStyle(
                    //ios : 1.5
                    fontSize: 2.0 * MediaQuery.of(context).size.height * 0.01,
                  ),
                ),
              ),
            ),
            //If it's last item, we will not add Divider after it.
            if (item != items.last)
              const DropdownMenuItem<String>(
                enabled: false,
                child: Divider(),
              ),
          ],
        );
      }
      return _menuItems;
    }

    List<double> _getCustomItemsHeights() {
      List<double> _itemsHeights = [];
      for (var i = 0; i < (items.length * 2) - 1; i++) {
        if (i.isEven) {
          _itemsHeights.add(40);
        }
        //Dividers indexes will be the odd indexes
        if (i.isOdd) {
          _itemsHeights.add(4);
        }
      }
      return _itemsHeights;
    }

    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

    getCurrentLocation() async {
      Position newPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      position = newPosition;
      placeMarks = await placemarkFromCoordinates(
          position!.latitude, position!.longitude);
      Placemark pMark = placeMarks![0];

      String completeAddress =
          '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality}, ${pMark.locality},'
          '${pMark.subAdministrativeArea}  ${pMark.postalCode}, ${pMark.country}';
      addressController.text = completeAddress;
    }

    String dropdownValue = list.first;
    var isChecked = false;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blueAccent;
      }
      return Colors.red;
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color(0xff1456f1),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 12.0, bottom: 4.0),
                child: Text(
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
                    SizedBox(
                      height: 25.0,
                    ),

                    // Container(
                    //   decoration: BoxDecoration(
                    //       color: Color.fromRGBO(250,250,254,1),
                    //       borderRadius: BorderRadius.circular(12.0)//<-- SEE HERE
                    //   ),
                    //   margin: EdgeInsets.all(12.0),
                    //   child: Center(
                    //     child: DropdownButtonHideUnderline(
                    //       child: DropdownButton2(
                    //         hint: Text(
                    //           'Select location',
                    //           style: TextStyle(
                    //             fontSize: 20,
                    //             color: Theme
                    //                 .of(context)
                    //                 .hintColor,
                    //           ),
                    //         ),
                    //         items: items
                    //             .map((item) =>
                    //             DropdownMenuItem<String>(
                    //               value: item,
                    //               child: Text(
                    //                 item,
                    //                 style: const TextStyle(
                    //                   fontSize: 14,
                    //                 ),
                    //               ),
                    //             ))
                    //             .toList(),
                    //         value: selectedValue,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             selectedValue = value as String;
                    //           });
                    //         },
                    //         buttonHeight: 70,
                    //         buttonWidth: 280,
                    //         itemHeight: 50,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    Container(
                      margin: EdgeInsets.all(12.0),
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
                                icon: Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                )),
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Color.fromRGBO(250, 250, 254, 1)),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(250, 250, 254, 1),
                          borderRadius:
                              BorderRadius.circular(12.0) //<-- SEE HERE
                          ),
                      margin: EdgeInsets.all(12.0),
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
                                        style: const TextStyle(
                                          fontSize: 14,
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
                      onTap: () => sendLocation(context),
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
