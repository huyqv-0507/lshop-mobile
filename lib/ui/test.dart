import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:laptop_mobile/models/repos/laptop_model/laptop.dart';
import 'package:laptop_mobile/models/repos/order_info.dart';
import 'package:laptop_mobile/repositories/laptop_repository.dart';
import 'package:laptop_mobile/repositories/payment_repository.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.7793169, 106.7570257),
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      zoomControlsEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ));
  }
}
