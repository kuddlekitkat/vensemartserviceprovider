import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
          child: Expanded(
            child: Container(
              color: Color.fromRGBO(234, 234, 234, 3),
              padding: EdgeInsets.all(20.0),
              child: SafeArea(
                child: Container(
                  height: screenheight / 1.02,
                  width: screenwidth,
                  color: Colors.white,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 1.2,
                          margin: EdgeInsets.all(12.0),
                          color: Colors.white,
                          child: Column(children: const [
                            AutoSizeText('User Terms and Conditions'),

                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                                'Please read these Terms and Conditions, which set forth the legally binding terms and conditions'
                                ' for your use of Vensemart (the service) offered by Pontus Technology Ltd (the Company). '
                                'Your access to use of the Service is conditioned on your acceptance of and compliance with these Terms & Conditions.'
                                ' These Terms & Conditions apply to all users and others who access or use the Service and all applicable laws and all '
                                'conditions or policies referenced here (collectively, the “Terms & Conditions”) By accessing or using the Service '
                                'you agree to be bound by these Terms & Conditions. If you disagree with any part of the terms then you shall '
                                'not access the Service and that the Company may use any information the '
                                'Company obtains about you in accordance with the provisions of the Privacy Policy.',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300)),
                            SizedBox(
                              height: 30.0,
                            ),
                            // AutoSizeText('Summary of Service'),
                            //
                            // SizedBox(height: 12.0,),
                            // AutoSizeText('The Vensemart is a platform that connects the various users to another for the purpose of supplies, distribution, service provision, repairs, installations, fittings and other ancillary purposes. The services to be provided includes: Solar and Inverter Installations, Electronic and Electrical Repairs, Electrical materials, Spare parts, Mechanical know-how, Plumbing work, '
                            //     'Plumbing materials, Carpentry and materials, Building materials, CCTV Installation and others.',style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
                            AutoSizeText('Acceptance of Terms'),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                                'The Service is offered subject to acceptance of all the '
                                'terms and conditions contained in these Terms & Conditions and '
                                'all other operating rules, policies, and procedures '
                                'that may be published on the Site by the Company, '
                                'which are incorporated by reference, including operating '
                                'rules, policies, and procedures of third party service '
                                'providers to the Site that are referenced herein. '
                                'These Terms & Conditions apply to every user of the Service.'
                                ' In addition, some Services offered through the Site may be subject '
                                'to additional terms and conditions adopted by the Company.'
                                ' Your use of those Services is subject to those additional '
                                'terms and conditions, which are incorporated into these'
                                ' Terms & Conditions by this reference.',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w300)),
                          ]),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
