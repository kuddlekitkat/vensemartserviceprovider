import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:provider/provider.dart';

import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

import '../widgets/image_picker_widget.dart';

class ServiceDetailDisplay extends StatefulWidget {
  const ServiceDetailDisplay();

  @override
  State<ServiceDetailDisplay> createState() => _ServiceDetailDisplayState();
}

class _ServiceDetailDisplayState extends State<ServiceDetailDisplay> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ninController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final _pickImage = ImagePickerHandler();
  File? fileImage;
  ProviderServices? providerServices;
  final _globalFormKey = GlobalKey<FormState>();
  var long2;
  var int2;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getUserDetails();
    providerServices
        ?.serviceId('${providerServices?.userDetailModel?.data?.id}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
        body: Form(
          key: _globalFormKey,
          child: Consumer<ProviderServices>(
            builder: (_, provider, __) {
              if (provider.userDetailModel?.message == 'null') {
                return Center(
                  child: SpinKitCircle(
                    color: Colors.blue[900],
                  ),
                );
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 2.4,
                            width: double.infinity,
                            // decoration:   BoxDecoration(
                            //
                            //   image: DecorationImage(
                            //       image: NetworkImage('${provider.serviceIdModel?.data?.serviceProviderImage}'),
                            //       fit: BoxFit.cover
                            //   ),
                            // ),
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${provider.serviceIdModel?.data?.serviceProviderImage}',
                              fit: BoxFit.cover,
                              placeholder: (
                                context,
                                url,
                              ) =>
                                  Container(
                                      margin: const EdgeInsets.all(10),
                                      child: const SpinKitCircle(
                                        color: Colors.grey,
                                      )),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: const Color.fromRGBO(
                                          234, 234, 234, 2),
                                      child: IconButton(
                                        icon: const Icon(
                                          CupertinoIcons.heart,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                        icon: const FaIcon(
                                          FontAwesomeIcons.upload,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16.0,
                            ),

                            Text(
                              '${provider.serviceIdModel?.data?.name}',
                              style: TextStyle(
                                  fontSize: 1.8 *
                                      MediaQuery.of(context).size.height *
                                      0.01,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            SizedBox(
                                width: 300,
                                child: Text(
                                  '${provider.serviceIdModel?.data?.categoryName}',
                                  style: TextStyle(
                                      fontSize: 1.8 *
                                          MediaQuery.of(context).size.height *
                                          0.01,
                                      fontWeight: FontWeight.normal),
                                )),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                Text(
                                  '${provider.serviceIdModel?.data?.location}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),

                            // Row(
                            //   children: [
                            //     FaIcon(FontAwesomeIcons.clock),
                            //     SizedBox(width: 12.0,),
                            //     AutoSizeText('Monday to Saturday || 8:00 - 9:00pm,',style: TextStyle(fontWeight: FontWeight.bold),),
                            //   ],
                            // ),

                            // SizedBox(height: 16.0,),

                            // Row(
                            //   children: [
                            //     FaIcon(FontAwesomeIcons.circleCheck),
                            //     SizedBox(width: 12.0,),
                            //     AutoSizeText('Monday to Saturday || 8:00 - 9:00pm,',style: TextStyle(fontWeight: FontWeight.bold),),
                            //   ],
                            // ),
                            // SizedBox(height: 16.0,),

                            Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.phone,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      '${provider.serviceIdModel?.data?.phone}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),

                            Row(
                              children: const [
                                FaIcon(
                                  FontAwesomeIcons.star,
                                  color: Colors.indigo,
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Text(
                                  'Bronze Level Member',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),

                            Row(
                              children: [
                                const FaIcon(
                                  FontAwesomeIcons.moneyBill,
                                  color: Colors.green,
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                Text(
                                  '${provider.serviceIdModel?.data?.serviceTypePrice}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            // Row(
                            //
                            //   children: [
                            //     Icon(Icons.chat,),
                            //     SizedBox(width: 12.0,),
                            //
                            //     AutoSizeText('chat',style: TextStyle(fontWeight: FontWeight.bold),),
                            //
                            //
                            //   ],
                            // ),
                            //
                            // SizedBox(height: 16.0,),
                            //
                            // AutoSizeText('Photos',style: TextStyle( //ios : 1.5
                            //fontSize: 2.0 *
                            // MediaQuery.of(context).size.height *
                            // 0.01, fontWeight: FontWeight.bold),),

                            // Padding(
                            //   padding: const EdgeInsets.only(right: 4.0,top: 4.0),
                            //   child: Row(
                            //
                            //
                            //     children: [
                            //
                            //
                            //       Container(
                            //         height:MediaQuery.of(context).size.height/3.8,
                            //         width: 200,
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(12.0),
                            //             image: DecorationImage(
                            //                 image: AssetImage('assets/images/servicedetail.png')
                            //             )
                            //         ),
                            //       ),
                            //
                            //       Column(
                            //         children: [
                            //
                            //           Container(
                            //             height:MediaQuery.of(context).size.height/8.5,
                            //             width: 120,
                            //             decoration: BoxDecoration(
                            //                 borderRadius: BorderRadius.circular(20.0),
                            //                 image: DecorationImage(
                            //                     image: AssetImage('assets/images/servicedetail1.png')
                            //                 )
                            //             ),
                            //           ),
                            //           SizedBox(height: 8.5,),
                            //
                            //           Container(
                            //             height:MediaQuery.of(context).size.height/8.5,
                            //             width: 120,
                            //             decoration: BoxDecoration(
                            //                 borderRadius: BorderRadius.circular(20.0),
                            //                 image: DecorationImage(
                            //                     image: AssetImage('assets/images/servicedetail2.png')
                            //                 )
                            //             ),
                            //           ),
                            //
                            //         ],
                            //       )
                            //
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
