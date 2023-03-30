import 'dart:typed_data';
import 'package:flutter/material.dart';

class CustomInfoWindow extends StatelessWidget {
  final Uint8List thumbnailBytes;
  final String caption;
  final String username;

  const CustomInfoWindow({
    Key? key,
    required this.thumbnailBytes,
    required this.caption,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (thumbnailBytes.isEmpty) {
      return SizedBox.shrink();
    }
    return Stack(
      children: [
        Image.memory(
          thumbnailBytes,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 100,
            color: Colors.grey.withOpacity(0.5),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  caption,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
