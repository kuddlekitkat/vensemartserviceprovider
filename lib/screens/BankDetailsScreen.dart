import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/screens/AddBankDetailsScreen.dart';
import 'package:vensemartserviceprovider/widgets/components/BankDetailsCard.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
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
          title:  Center(child: Text("Bank Accounts")),
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

              Center(child: Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text('Add and remove bank account for withdrawals, up to 3 accounts',style: TextStyle(fontSize: 18.0),),
              )),

              SizedBox(height: 14.0),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => AddBankDetailsScreen(),
                    ),
                  );

                },
                child: Center(
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
                ),
              ),
              SizedBox(height: 14.0),
              BankDetailsCard(bank_name: 'Sterling Bank', account_name: 'Jack Doe', account_number: '3034400044'),
              // Text('PIN CODE'),
              SizedBox(height: 14.0),
              BankDetailsCard(bank_name: 'Sterling Bank', account_name: 'Jack Doe', account_number: '3034400044'),
              SizedBox(height: 2.0),
              // Text('AUTH CODE'),




            ],
          ),
        ),
      ),
    );
  }
}
