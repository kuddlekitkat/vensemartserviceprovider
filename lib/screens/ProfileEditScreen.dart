import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/apiservices/validator.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

import '../widgets/image_picker_widget.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
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

  _formartFileImage(File? imageFile) {
    if (imageFile == null) return;
    return File(imageFile.path.replaceAll('\'', '').replaceAll('File: ', ''));
  }

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.getUserDetails();
    super.initState();
  }

  void updateProfile(context) async {
    if (_globalFormKey.currentState!.validate()) {
      providerServices?.updateProfile(credentials: {
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "mobile_number": phoneController.text.trim(),
        "address": addressController.text.trim(),
        "gender": genderController.text.trim(),
        "date_of_birth": dobController.text.trim(),
        "profile": MultipartFile.fromBytes(
            _formartFileImage(fileImage).readAsBytesSync(),
            filename: fileImage!.path.split("/").last),
      }, context: context);
    }
  }

  void _getImage(BuildContext context) {
    try {
      _pickImage.pickImage(
          context: context,
          file: (file) {
            fileImage = file;
            setState(() {});
          });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
        appBar: AppBar(
          backgroundColor: const Color(0xff1456f1),
          title: const Text("Profile Edit"),
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
        body: Form(
          key: _globalFormKey,
          child: Consumer<ProviderServices>(
            builder: (_, provider, __) {
              if (provider.userDetailModel == null) {
                return  Center(
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
                      const SizedBox(height: 4.0),
                      GestureDetector(
                        onTap: () => _getImage(context),
                        child: 
                        // provider.userDetailModel!.data!.profile != null
                        //     ? Center(
                        //         child: CachedNetworkImage(
                        //           imageUrl:
                        //               provider.userDetailModel!.data!.profile!,
                        //           placeholder: (
                        //             context,
                        //             url,
                        //           ) =>
                        //               Container(
                        //                   margin: const EdgeInsets.all(10),
                        //                   child: const SpinKitCircle(
                        //                     color: Colors.grey,
                        //                   )),
                        //           errorWidget: (context, url, error) =>
                        //               const Icon(Icons.error),
                        //         ),
                        //       ):
                             fileImage != null
                                ? Center(
                                    child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: FileImage(fileImage!)),
                                  )
                                : const Center(
                                    child: CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage:
                                          AssetImage("assets/images/dp.png"),
                                    ),
                                  ),
                      ),
                      const SizedBox(height: 10.0),
                      const Text('Name'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: nameController,
                        validator: Validators.validateString(),
                        decoration: InputDecoration(
                            label: Text(
                                provider.userDetailModel?.data?.name ?? ''),
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
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Colors.white),
                      ),
                      const SizedBox(height: 14.0),
                      const Text('Email'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: emailController,
                        validator: Validators.validateEmail(),
                        decoration: InputDecoration(
                            label: Text(
                                provider.userDetailModel?.data?.email ?? ''),
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
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Colors.white),
                      ),
                      const SizedBox(height: 14.0),
                      const Text('Mobile Number'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: phoneController,
                        validator: Validators.validatePhone(),
                        decoration: InputDecoration(
                            label: Text(
                                provider.userDetailModel?.data?.mobile ?? ''),
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
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Colors.white),
                      ),
                      const SizedBox(height: 14.0),
                      const Text('Nin'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: ninController,
                        validator: Validators.validateInt(),
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
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Colors.white),
                      ),
                      const SizedBox(height: 14.0),
                      const Text('Date of birth'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: dobController,
                        validator: Validators.validateString(),
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
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Colors.white),
                      ),
                      const SizedBox(height: 14.0),
                      const Text('Gender'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: genderController,
                        validator: Validators.validateString(),
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
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Colors.white),
                      ),
                      const SizedBox(height: 14.0),
                      const Text('Address'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: addressController,
                        validator: Validators.validateString(),
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
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Colors.white),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () => updateProfile(context),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width / 1.1,
                            decoration: BoxDecoration(
                              color: const Color(0xff1456f1),
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                            child: const Center(
                              child: Text(
                                'Update Profile',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            ),
                          ),
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
