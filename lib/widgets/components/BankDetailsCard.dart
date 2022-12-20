import 'package:flutter/material.dart';


class BankDetailsCard extends StatelessWidget {
  final String bank_name;
  final String account_name;
  final String account_number;
  const BankDetailsCard({required this.bank_name, required this.account_name, required this.account_number});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height/8,
          decoration: BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.circular(14.0)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [

                 SizedBox(width: 10.0,),
                 Container(
                   height: 100,
                     width: 300,

                 child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(bank_name,style: TextStyle(color: Colors.black,fontSize: 19),),
                     Text(account_name,style: TextStyle(color: Colors.grey),),
                     Text(account_number,style: TextStyle(color: Colors.grey),),
                   ],
                 ),),
                Icon(Icons.delete_forever,color: Colors.red,),

              ],
            ),
          ),
        ),

    );
  }
}
