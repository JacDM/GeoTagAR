import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

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
              duration: Duration(milliseconds: 250),
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
              duration: Duration(milliseconds: 250),
              top: acceleration.y * planetMotionSensitivity,
              bottom: acceleration.y * planetMotionSensitivity,
              right: acceleration.x * planetMotionSensitivity,
              left: acceleration.x * planetMotionSensitivity,
              child: Align(
                alignment: Alignment(0,-0.5),
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
