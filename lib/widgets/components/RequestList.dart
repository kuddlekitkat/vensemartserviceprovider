import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemartserviceprovider/screens/ServiceProviderHomeScreen.dart';

import '../../screens/provider/provider_services.dart';

class RequestList extends StatefulWidget {
  const RequestList({Key? key}) : super(key: key);

  @override
  State<RequestList> createState() => _RequestListState();
}

class _RequestListState extends State<RequestList> {


  ProviderServices? providerServices;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.upcomingRequests();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Services',
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: const Color.fromRGBO(234, 234, 234, 2),
        elevation: 0.00,
      ),
      backgroundColor: const Color.fromRGBO(234, 234, 234, 2),
      body: Consumer<ProviderServices>(
        builder: (_, provider, __) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintText: 'what service are you looking for',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      fillColor: const Color.fromRGBO(250, 250, 254, 1),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    children: <Widget>[
                      if (provider.isAvailable)
                        ...provider.upcomingRequest!.data!
                            .map((e) => contentContainer(
                            text: e.name))
                            .toList()
                    ],
                  ),

                ),
              ],
            ),
          );
        },
      ),
    );
  }

  contentContainer({String? text}) => ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: GridTile(
      footer: GridTileBar(
        title: Center(
            child: Text(
              text ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
        backgroundColor: Colors.black54,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ServiceProviderHomeScreen(),
            ),
          );
        },
        child: CachedNetworkImage(
          imageUrl:
          "",
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
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    ),
  );
}