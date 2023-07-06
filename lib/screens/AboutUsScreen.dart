import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    // providerServices?.aboutUs();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(234, 234, 234, 3),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(234, 234, 234, 3),
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
        body: Container(
          color: Color.fromRGBO(234, 234, 234, 3),
          padding: EdgeInsets.all(20.0),
          child: SafeArea(
            child: Container(
              height: screenheight,
              width: screenwidth,
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12.0),
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: SingleChildScrollView(
                          child: Column(children: const [
                            AutoSizeText('About Us'),
                            SizedBox(
                              height: 12.0,
                            ),

                            // Text(
                            //     " Vensemart is a bespoke user friendly vendor and service providers platform, designed to easily connect tested, trusted, verified and certified professional service providers with customers."
                            //
                            //
                            //
                            //     ,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                                " Vensemart is a bespoke user friendly vendor and service providers platform, designed to easily connect tested, trusted, verified and certified professional service providers with customers.",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300)),
                            SizedBox(
                              height: 20.0,
                            ),

                            Text(
                                " We provide a swift interface for freelancers, sme's and corporate companies to  attend to all kinds of customer needs from personal grooming (barbing/hairdo, makeup, massage and dressing), eletrical repaires, mechanical repairs, mechanical repairs and more.",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300)),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                                "Our goal is to enable end users to access the closest, skilled and experienced professional service within 3 minutes of location proximity. Once on the platform you can book and manage appointments at convenience and avoid queuing at public outlet for service needs with a relaxed and first class user experience.",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300)),

                            SizedBox(
                              height: 20.0,
                            ),

                            //
                            //
                            //
                            //

                            // Text( "It enables the end users to access closest and "
                            //     "reliable services within 3 minutes of location proximity,"
                            //     " book and manage appointments at convenience and avoid "
                            //     "queuing at public outlet for service needs with a relaxed "
                            //     "and first class user experience."),
                            // SizedBox(height: 12.0,),
                            //
                            // Text("Vensemart Apps encourages business growth"
                            //     " and curbs the increasing rate of job lost and global economic downturn, networknig onckexpon dingines%h realm economy (freelancing) to the corporate companies."),
                          ]),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
