import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
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




  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.services();
    // searchItem.clear();
    super.initState();
  }


  void sendLocation(context) async {
    if (true) {

      final query = addressController.text.trim();
      var addresses = await Geocoder.local.findAddressesFromQuery(query);
      var first = addresses.first;
      print("${first.featureName} : ${first.coordinates.latitude} , ${first.coordinates.longitude}");
      providerServices?.sendLocation(map: {
        "location": addressController.text.trim(),
        "location_lat": "7.4701862",
        "location_long": "9.078749"
      }, context: context);
    }
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
      'Item1',
      'Item2',
      'Item3',
      'Item4',
    ];
    String? selectedValue;

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
                  style: const TextStyle(
                    fontSize: 14,
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

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff1456f1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 12.0,bottom: 4.0),
              child: Text('Address Details',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 40,color: Colors.white),),
            ),



            Container(
              height: MediaQuery.of(context).size.height/1.8,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.0,),




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
                          prefixIcon: Icon(Icons.location_on),
                          hintStyle: new TextStyle(color: Colors.grey[600]),
                          fillColor: Color.fromRGBO(250,250,254,1)),
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
                              : const Center(
                            child: Text(
                              'Proceed',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
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
        )

    );
  }
}
