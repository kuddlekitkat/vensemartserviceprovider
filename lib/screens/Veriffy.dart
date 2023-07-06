import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/apiservices/validator.dart';
import 'package:vensemartserviceprovider/screens/provider/provider_services.dart';

import '../widgets/image_picker_widget.dart';

class VeriffyScreen extends StatefulWidget {
  const VeriffyScreen({Key? key}) : super(key: key);

  @override
  State<VeriffyScreen> createState() => _VeriffyScreenState();
}

class _VeriffyScreenState extends State<VeriffyScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  // TextEditingController ninController = TextEditingController();
  // TextEditingController dobController = TextEditingController();
  // TextEditingController genderController = TextEditingController();
  // TextEditingController addressController = TextEditingController();

  final _pickImage = ImagePickerHandler();
  final _pickIdmage = ImagePickerHandler();
  File? fileImage;
  File? fileIdImage;
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
      var image = MultipartFile.fromBytes(
          _formartFileImage(fileIdImage).readAsBytesSync(),
          filename: fileIdImage!.path.split("/").last);

      var images = MultipartFile.fromBytes(
          _formartFileImage(fileImage).readAsBytesSync(),
          filename: fileImage!.path.split("/").last);

      Uint8List? imagebytes =
          await fileImage?.readAsBytesSync(); //convert to bytes
      String base64string1 = base64.encode(imagebytes!); //c

      Uint8List? imagebytess =
          await fileIdImage?.readAsBytesSync(); //convert to bytes
      String base64string2 = base64.encode(imagebytess!);

      if (fileImage != null) {
        providerServices?.sendVerify(map: {
          "photoid_image": '${base64string2}data:image/jpeg;base64',
          "selfie_image": '${base64string1}data:image/jpeg;base64',
          "first_name": nameController.text,
          "last_name": phoneController.text,
        }, context: context);
      }
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

  void _getIdImage(BuildContext context) {
    try {
      _pickIdmage.pickImage(
          context: context,
          file: (file) {
            fileIdImage = file;
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
          title: const Text("Verification"),
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
                      const SizedBox(height: 4.0),
                      AutoSizeText('Take Selfie Image'),
                      GestureDetector(
                        onTap: () => _getImage(context),
                        child: fileImage != null
                            ? Center(
                                child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: FileImage(fileImage!)),
                              )
                            : Center(
                                child: CircleAvatar(
                                  radius: 50.0,
                                  // backgroundImage:
                                  // NetworkImage("${provider.userDetailModel?.data?.profile}" ?? ''),
                                  child: CachedNetworkImage(
                                    imageUrl: '',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                      ),
                      AutoSizeText('Upload any government issued documents'),
                      GestureDetector(
                        onTap: () => _getIdImage(context),
                        child: fileIdImage != null
                            ? Center(
                                child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: FileImage(fileIdImage!)),
                              )
                            : Center(
                                child: CircleAvatar(
                                  radius: 50.0,
                                  // backgroundImage:
                                  // NetworkImage("${provider.userDetailModel?.data?.profile}" ?? ''),
                                  child: CachedNetworkImage(
                                    imageUrl: '',
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(height: 10.0),
                      const AutoSizeText('NIN'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: emailController,
                        validator: Validators.validateString(),
                        decoration: InputDecoration(
                            // label: Text(
                            //     provider.userDetailModel?.data?.name ?? ''),
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
                      const AutoSizeText('first Name'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: nameController,
                        validator: Validators.validateString(),
                        decoration: InputDecoration(
                            // label: Text(
                            //     provider.userDetailModel?.data?.name ?? ''),
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
                      const AutoSizeText('Last Name'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: phoneController,
                        validator: Validators.validateString(),
                        decoration: InputDecoration(
                            // label: Text(
                            //     provider.userDetailModel?.data?.mobile ?? ''),
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
                      const SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () => updateProfile(context),
                          child: Consumer<ProviderServices>(
                            builder: (_, value, __) => Center(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.10,
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
                                          'update Profile',
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
