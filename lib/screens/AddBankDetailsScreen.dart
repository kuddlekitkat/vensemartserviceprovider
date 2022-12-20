import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class AddBankDetailsScreen extends StatefulWidget {
  const AddBankDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddBankDetailsScreen> createState() => _AddBankDetailsScreenState();
}

class _AddBankDetailsScreenState extends State<AddBankDetailsScreen> {
  @override
  Widget build(BuildContext context) {


    final List<String> items = [

      'Access Bank Plc',
      'Citibank Nigeria Limited',
      'Ecobank Nigeria Plc',
      'Fidelity Bank Plc',
      'FIRST BANK NIGERIA LIMITED'
      'First City Monument Bank Plc',
      'Globus Bank Limited',
      'Guaranty Trust Bank Plc',
      'Heritage Banking Company Ltd',
      'Key Stone Bank',
      'Polaris Bank',
      'Providus Bank',
      'Stanbic IBTC Bank Ltd',
      'Standard Chartered Bank Nigeria Ltd',
      'Sterling Bank Plc',
      'SunTrust Bank Nigeria Limited',
      'Titan Trust Bank Ltd',
      'Union Bank of Nigeria Plc',
      'United Bank For Africa Plc',
      'Unity Bank Plc',
      'Wema Bank Plc'
      'Zenith Bank Plc'
    ];
    String? selectedValue;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 1),
        appBar: AppBar(
          backgroundColor: Color(0xff1456f1),
          title:  Text("Add Bank Accounts"),
          leading:  IconButton(
            icon:  CircleAvatar(
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14.0),
              Container(

                decoration: BoxDecoration(

                    color: Color.fromRGBO(250,250,254,1),
                    borderRadius: BorderRadius.circular(12.0)//<-- SEE HERE
                ),
                margin: EdgeInsets.all(2.0),
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      hint: Text(
                        'Select Bank',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme
                              .of(context)
                              .hintColor,
                        ),
                      ),
                      items: items
                          .map((item) =>
                          DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 10,
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
                      buttonHeight: 60,
                      buttonWidth: 330,
                      itemHeight: 50,
                    ),
                  ),
                ),
              ),
              // Text('PIN CODE'),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintText: "Account name",
                    hintStyle: new TextStyle(color: Colors.grey[600]),
                    fillColor: Colors.white),

              ),
              SizedBox(height: 20.0),
              // Text('AUTH CODE'),

              TextFormField(
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
                    hintText: "Account Number",
                    hintStyle: new TextStyle(color: Colors.grey[600]),
                    fillColor: Colors.white),
              ),

              SizedBox(height: 40.0,),

              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height/13,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    color: Color(0xff1456f1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text( 'Add Bank Account',style: TextStyle(color: Colors.white,fontSize: 22),),

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
