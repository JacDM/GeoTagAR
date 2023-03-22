// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geotagar/utils/post_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/constants/constants.dart';
import '../utils/methods.dart';
import 'package:geolocator/geolocator.dart';

// ignore: camel_case_types
class scrapBookLocations extends StatefulWidget {
  const scrapBookLocations({super.key});

  @override
  State<scrapBookLocations> createState() => _scrapBookLocationsState();
}

// ignore: camel_case_types
class _scrapBookLocationsState extends State<scrapBookLocations> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sBook1 = LatLng(25.102054, 55.162265);
  // ignore: prefer_typing_uninitialized_variables
  var locationSnap;
  Future<Position> position =
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  BitmapDescriptor sBookIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor sBookIcon1 = BitmapDescriptor.defaultMarker;
  late Map<String, dynamic> locations;
  //GoogleMapController myController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'assets/images/lock_icon_map.png')
        .then(
      (icon) {
        sBookIcon = icon;
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, 'assets/images/icon_map.png')
        .then(
      (icon) {
        sBookIcon1 = icon;
      },
    );
  }

  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      icon: specify['locked'] ? sBookIcon : sBookIcon1,
      //icon: sBookIcon,
      onTap: () => Dialog(
        child: Container(
          child: PostCard(snap: locationSnap),
        ),
      ),
      position:
          LatLng(specify['location'].latitude, specify['location'].longitude),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() async {
    FirebaseFirestore.instance.collection('posts').get().then((locations) {
      if (locations.docs.isNotEmpty) {
        locationSnap = locations;
        for (int i = 0; i < locations.docs.length; i++) {
          initMarker(locations.docs[i].data(), locations.docs[i].id);
        }
      }
    });
  }

  @override
  void initState() {
    setCustomMarkerIcon();
    getMarkerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: width > 600
          ? null
          : AppBar(
              backgroundColor: Color.fromARGB(255, 29, 29, 29),
              automaticallyImplyLeading: false,
              centerTitle: true,
              toolbarHeight: 90,
              title: Row(
                children: const [
                  Text(
                    'Near You',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "ABeeZee",
                    ),
                  ),
                ],
              )),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: sBook1,
          zoom: 10,
        ),
        markers: Set<Marker>.of(markers.values),
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          controller = controller;
        },
      ),
    );
  }
}
