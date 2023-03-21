// ignore_for_file: prefer_const_constructors, prefer_collection_literals

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/services/firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/constants/constants.dart';

const double ZOOM = 1;

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

  //static GoogleMapController _googleMapController;
  Set<Marker> markers = Set();
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
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("Location").snapshots(),
            builder: (context, snapshot) {
              print(snapshot);
              if (snapshot.hasData) {
                //Extract the location from document
                GeoPoint location = snapshot.data!.docs.first.get("location");

                // Check if location is valid
                if (location == null) {
                  return Text("There was no location data");
                }

                // Remove any existing markers
                markers.clear();

                final latLng = LatLng(location.latitude, location.longitude);

                // Add new marker with markerId.
                markers.add(
                    Marker(markerId: MarkerId("location"), position: latLng));

                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(location.latitude, location.longitude)),
                  // Markers to be pointed
                  markers: markers,
                  // onMapCreated: (controller) {
                  //   // Assign the controller value to use it later
                  //   controller = controller;
                  // },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
