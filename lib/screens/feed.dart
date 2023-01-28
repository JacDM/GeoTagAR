import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geotagar/core/constants/constants.dart';
import 'package:geotagar/utils/methods.dart';

class feedScreen extends StatelessWidget {
  const feedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: logo(Constants.logoPath),
      ),
    );
  }
}
