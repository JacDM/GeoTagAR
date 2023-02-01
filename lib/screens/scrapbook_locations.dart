// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: camel_case_types
class scrapBookLocations extends StatefulWidget {
  const scrapBookLocations({super.key});

  @override
  State<scrapBookLocations> createState() => _scrapBookLocationsState();
}

// ignore: camel_case_types
class _scrapBookLocationsState extends State<scrapBookLocations> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sBook1 = LatLng(37.33500926, -122.03272188);
  static const LatLng sBook2 = LatLng(37.33429383, -122.06600055);
  BitmapDescriptor sBookIcon = BitmapDescriptor.defaultMarker;
  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/Marker.png")
        .then(
      (icon) {
        sBookIcon = icon;
      },
    );
  }

  @override
  void initState() {
    setCustomMarkerIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 90,
        elevation: 3,
        //used to remove the back button from appBar
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: const Text(
          "Near You",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w900,
            //fontFamily: 'arial',
          ),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: sBook1,
          zoom: 13.5,
        ),
        markers: {
          Marker(
            markerId: MarkerId("Dave's Scrapbook"),
            position: sBook1,
            icon: sBookIcon,
          ),
          Marker(
            markerId: MarkerId("Heriot Watt ScrapBook"),
            position: sBook2,
            icon: sBookIcon,
          ),
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
      ),
    );
  }
}
