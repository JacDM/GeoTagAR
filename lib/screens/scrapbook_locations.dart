// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/services/firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/constants/constants.dart';

// ignore: camel_case_types
class scrapBookLocations extends StatefulWidget {
  const scrapBookLocations({super.key});

  @override
  State<scrapBookLocations> createState() => _scrapBookLocationsState();
}

// ignore: camel_case_types
class _scrapBookLocationsState extends State<scrapBookLocations> {
  final Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
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

  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(specify['location'].latitude, specify['location'].longitude),
      //icon:
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() async {
    var postData = FirebaseFirestore.instance.collection('posts').get();
    if (postData.toString().isNotEmpty) {
      for (int i = 0; i < postData.toString().length; i++) {
        initMarker(postData, i);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: false,
      //   toolbarHeight: 90,
      //   elevation: 3,
      //   //used to remove the back button from appBar
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Colors.black,
      //   title: const Text(
      //     "Near You",
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 30,
      //       fontWeight: FontWeight.w900,
      //       //fontFamily: 'arial',
      //     ),
      //   ),
      // ),

      appBar: width > 600
          ? null
          : AppBar(
              backgroundColor: Color.fromARGB(255, 29, 29, 29),
              automaticallyImplyLeading: false,
              centerTitle: true,
              toolbarHeight: 90,
              title: Row(
                children: [
                  Image.asset(
                    Constants.logoPathBlack,
                    height: 200.0,
                    width: 200.0,
                  ),
                  const Text(
                    'NEAR YOU',
                    style: TextStyle(
                      fontSize: 34,
                    ),
                  ),
                ],
              )),
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
