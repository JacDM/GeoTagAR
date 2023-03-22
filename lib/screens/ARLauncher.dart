/*
Name: Akshath Jain
Date: 3/18/2019 - 4/26/2021
Purpose: Example app that implements the package: sliding_up_panel
Copyright: © 2021, Akshath Jain. All rights reserved.
Licensing: More information can be found here: https://github.com/akshathjain/sliding_up_panel/blob/master/LICENSE
*/

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:geotagar/ar/ar.dart';

class ARLauncher extends StatefulWidget {
  @override
  _ARLauncherState createState() => _ARLauncherState();
}

class _ARLauncherState extends State<ARLauncher> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 10;
  double _panelHeightClosed = 70.0;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.3;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[900],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "TAG THE WORLD",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 33.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("Create a post", Icons.create, Colors.blue, "CRRoute"),
                _button(
                    "Find a Post", Icons.filter_hdr_outlined, Colors.red, "AR"),
              ],
            ),
            const SizedBox(
              height: 36.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Images",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl:
                            "https://images.fineartamerica.com/images-medium-large-5/new-pittsburgh-emmanuel-panagiotakis.jpg",
                        height: 120.0,
                        width: (MediaQuery.of(context).size.width - 48) / 2 - 2,
                        fit: BoxFit.cover,
                      ),
                      CachedNetworkImage(
                        imageUrl:
                            "https://cdn.pixabay.com/photo/2016/08/11/23/48/pnc-park-1587285_1280.jpg",
                        width: (MediaQuery.of(context).size.width - 48) / 2 - 2,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text("About",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ));
  }

  Widget _button(String label, IconData icon, Color color, String route) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 8.0,
                )
              ]),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }

  Widget _body() {
    return const GlobePage();
  }
}

class GlobePage extends StatefulWidget {
  const GlobePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GlobePageState();
  }
}

class _GlobePageState extends State<GlobePage> {
  late AccelerometerEvent acceleration;
  late StreamSubscription<AccelerometerEvent> _streamSubscription;

  int planetMotionSensitivity = 4;
  int bgMotionSensitivity = 2;

  @override
  void initState() {
    _streamSubscription =
        accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        acceleration = event;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              top: acceleration.y * bgMotionSensitivity,
              bottom: acceleration.y * -bgMotionSensitivity,
              right: acceleration.x * -bgMotionSensitivity,
              left: acceleration.x * bgMotionSensitivity,
              child: Align(
                child: Image.asset(
                  "assets/images/spaceBg.jpg",
                  height: 1920,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              top: acceleration.y * planetMotionSensitivity,
              bottom: acceleration.y * planetMotionSensitivity,
              right: acceleration.x * planetMotionSensitivity,
              left: acceleration.x * planetMotionSensitivity,
              child: Align(
                alignment: const Alignment(0, -0.3),
                child: Image.asset(
                  "assets/images/earth.png",
                  width: 350,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
