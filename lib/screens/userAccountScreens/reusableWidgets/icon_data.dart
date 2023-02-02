import 'package:flutter/material.dart';

const Color k_iconTextColour = Colors.black;

class WidgetIconData extends StatelessWidget {
  const WidgetIconData({super.key, required this.icon, required this.iconText,});
  final IconData icon;
  final String iconText;

  @override
  Widget build(BuildContext context){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40.0,
            color: Colors.black,
          ),

          const SizedBox(
            height: 10.0,
          ),

          Text(iconText,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),


        ],
      ); 
  }

}