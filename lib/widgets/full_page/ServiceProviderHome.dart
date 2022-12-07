import 'package:flutter/material.dart';
import 'package:vensemartserviceprovider/widgets/components/ServiceRequestCard.dart';

class ServiceProviderHome extends StatefulWidget {
  const ServiceProviderHome({Key? key}) : super(key: key);

  @override
  State<ServiceProviderHome> createState() => _ServiceProviderHomeState();
}

class _ServiceProviderHomeState extends State<ServiceProviderHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(

        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('This Month'),
                Text('View Report'),

              ],
            ),

            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/6,
                  width: MediaQuery.of(context).size.width/2.5,
                  decoration: BoxDecoration(
                      color: Color(0xffFD5F88),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Stack(
                    children: const [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Icon(Icons.bar_chart_outlined,size: 40.0,color: Colors.white,),
                      ),
                      Positioned(
                        top: 50,
                        left: 10,
                        child: Text('4000',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                      Positioned(
                        top: 90,
                        left: 10,
                        child: Text('Data Collected',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ],
                  ),

                ),
                Container(
                  height: MediaQuery.of(context).size.height/6,
                  width: MediaQuery.of(context).size.width/2.5,
                  decoration: BoxDecoration(
                      color: Color(0xff1456f1),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Stack(
                    children: const [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Icon(Icons.bar_chart_outlined,size: 40.0,color: Colors.white,),
                      ),
                      Positioned(
                        top: 50,
                        left: 10,
                        child: Text('4000',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                      Positioned(
                        top: 90,
                        left: 10,
                        child: Text('Data Collected',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ],
                  ),

                ),
              ],
            ),


            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/6,
                  width: MediaQuery.of(context).size.width/2.5,
                  decoration: BoxDecoration(
                      color: Color(0xffF03E3E),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Stack(
                    children: const [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Icon(Icons.bar_chart_outlined,size: 40.0,color: Colors.white,),
                      ),
                      Positioned(
                        top: 50,
                        left: 10,
                        child: Text('4000',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                      Positioned(
                        top: 90,
                        left: 10,
                        child: Text('Data Collected',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ],
                  ),

                ),
                Container(
                  height: MediaQuery.of(context).size.height/6,
                  width: MediaQuery.of(context).size.width/2.5,
                  decoration: BoxDecoration(
                      color: Color(0xff0ECBA1),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Stack(
                    children: const [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Icon(Icons.bar_chart_outlined,size: 40.0,color: Colors.white,),
                      ),
                      Positioned(
                        top: 50,
                        left: 10,
                        child: Text('4000',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                      Positioned(
                        top: 90,
                        left: 10,
                        child: Text('Data Collected',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                    ],
                  ),

                ),
              ],
            ),


            SizedBox(height: 20.0,),

            Text('New Request'),
            SizedBox(height: 20.0,),

            ServiceRequestCard(),
            SizedBox(height: 20.0,),
            ServiceRequestCard(),





          ],
        ),
      ),
    );
  }
}
