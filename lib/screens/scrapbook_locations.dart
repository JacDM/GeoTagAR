import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';
import 'package:geotagar/screens/singlePost.dart';
import 'package:geotagar/utils/post_card.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/constants/constants.dart';
import '../utils/methods.dart';
import 'package:geolocator/geolocator.dart';

import 'scrapbook_help.dart';

class scrapBookLocations extends StatefulWidget {
  const scrapBookLocations({super.key});

  @override
  State<scrapBookLocations> createState() => _scrapBookLocationsState();
}

class _scrapBookLocationsState extends State<scrapBookLocations> {
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sBook1 = LatLng(25.102054, 55.162265);
  var locationSnap;
  Future<Position> position =
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  BitmapDescriptor sBookIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor sBookIcon1 = BitmapDescriptor.defaultMarker;
  late Map<String, dynamic> locations;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final Map<MarkerId, Uint8List> _markerThumbnails = <MarkerId, Uint8List>{};
  final Map<MarkerId, String> _markerCaptions = <MarkerId, String>{};
  final Map<MarkerId, String> _markerUsernames = <MarkerId, String>{};
  final Map<MarkerId, String> _markerPostId = <MarkerId, String>{};

  Uint8List _thumbnailBytes = Uint8List(0);
  String _caption = '';
  String _username = '';
  String _postId = '';

  // New method to download the thumbnail
  Future<Uint8List> getThumbnailFromUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw Exception('Failed to load thumbnail');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } on HttpException {
      throw Exception('Could not find the post');
    } on FormatException {
      throw Exception('Invalid URL');
    }
  }

  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);

    String postUrl = specify['postUrl']; // Get the postUrl from the document

    // Download the thumbnail
    Uint8List thumbnailBytes;
    try {
      thumbnailBytes = await getThumbnailFromUrl(postUrl);
    } catch (e) {
      // Handle exceptions and show a default image
      ByteData defaultImageData =
          await rootBundle.load('assets/images/default_thumbnail.png');
      thumbnailBytes = defaultImageData.buffer.asUint8List();
    }
    _markerThumbnails[markerId] = thumbnailBytes;
    _markerCaptions[markerId] = specify['description']; // Store the caption
    _markerUsernames[markerId] = specify['username']; // Store the username
    _markerPostId[markerId] = specify['postId']; // Store the username

    //_markerThumbnails[markerId] = thumbnailBytes; // Store the thumbnail bytes

    final Marker marker = Marker(
      markerId: markerId,
      icon: specify['locked'] ? sBookIcon : sBookIcon1,
      onTap: () {
        _onMarkerTap(markerId);
      },
      position:
          LatLng(specify['location'].latitude, specify['location'].longitude),
    );

    setState(() {
      markers[markerId] = marker;
      _caption = specify['description'];
      _username = specify['username'];
      _postId = specify['postId'];
    });
  }

  void _onMarkerTap(MarkerId markerId) async {
    final GoogleMapController controller = await _controller.future;
    setState(() {
      _thumbnailBytes = _markerThumbnails[markerId] ?? Uint8List(0);
      _caption = _markerCaptions[markerId] ?? '';
      _username = _markerUsernames[markerId] ?? '';
      _postId = _markerPostId[markerId] ?? '';
    });
  }

  void _onMapTap(LatLng position) {
    setState(() {
      _thumbnailBytes = Uint8List(0);
      _caption = '';
      _username = '';
      _postId = '';
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
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              _onMapTap(LatLng(0, 0));
            },
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: sBook1,
                zoom: 10,
              ),
              markers: Set<Marker>.of(markers.values),
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {
                if (_thumbnailBytes.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleFeed(
                        postID: _postId,
                      ), // The new screen
                    ),
                  );
                }
              },
              child: CustomInfoWindow(
                caption: _caption,
                username: _username,
                thumbnailBytes: _thumbnailBytes,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
