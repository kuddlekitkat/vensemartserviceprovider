import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'ServiceLocationScreen.dart';

class ServiceIntroScreen extends StatefulWidget {
  const ServiceIntroScreen({Key? key}) : super(key: key);

  @override
  State<ServiceIntroScreen> createState() => _ServiceIntroScreenState();
}

class _ServiceIntroScreenState extends State<ServiceIntroScreen> {
  ProviderServices? providerServices;
  TextEditingController controller = TextEditingController();
  String _query = '';
  List searchItem = [];

  int intval = 0;

  String? selectedValue;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.services();
    // searchItem.clear();
    super.initState();
  }

  void sendServiceId(context) async {
    if (true) {
      providerServices?.sendServiceId(
          map: {"service_type_id": selectedValue.toString()}, context: context);
    }
  }

  //pls also look at serviceLocation screen,
  // I want to send latitude and longitude of someone's location
  //pls if you help with that as well.

  @override
  Widget build(BuildContext context) {
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

    // List<double> _getCustomItemsHeights() {
    //   List<double> _itemsHeights = [];
    //   for (var i = 0; i < (items.length * 2) - 1; i++) {
    //     if (i.isEven) {
    //       _itemsHeights.add(40);
    //     }
    //     //Dividers indexes will be the odd indexes
    //     if (i.isOdd) {
    //       _itemsHeights.add(4);
    //     }
    //   }
    //   return _itemsHeights;
    // }
    //
    // const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

    // String dropdownValue = list.first;
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
                child: AutoSizeText(
                  'Service Details',
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
                child: Consumer<ProviderServices>(builder: (_, provider, __) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.0,
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
                                'Select Service',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: providerServices?.servicesModel?.data
                                  ?.map((item) => DropdownMenuItem<String>(
                                        value: item.id.toString(),
                                        child: Text(
                                          item.categoryName.toString(),
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
                              // buttonHeight: screenHeight / 11,
                              // buttonWidth: screenWidth / 1.05,
                              // itemHeight: screenHeight / 17,
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Color.fromRGBO(250, 250, 254, 1),
                      //       borderRadius: BorderRadius.circular(
                      //           12.0) //<-- SEE HERE
                      //   ),
                      //   margin: EdgeInsets.all(12.0),
                      //   child: Center(
                      //     child: DropdownButtonHideUnderline(
                      //       child: DropdownButton2(
                      //         hint: Text(
                      //           'Select Item',
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

                      GestureDetector(
                        onTap: () => sendServiceId(context),
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
                  );
                }),
              ),
            ],
          )),
    );
  }
}
