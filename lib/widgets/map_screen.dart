import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  MapSample({Key? key, required this.latitude, required this.longitude})
      : super(key: key);
  double? latitude;
  double? longitude;

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static CameraPosition? _kGooglePlex;

  static CameraPosition? _kLake;

  @override
  void initState() {
    _kGooglePlex = CameraPosition(
      target: LatLng(widget.latitude!, widget.longitude!),
      zoom: 14.4746,
    );
    _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(widget.latitude!, widget.longitude!),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex!,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const AutoSizeText('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake!));
  }
}
