import 'package:flutter/material.dart';

class PageTab extends StatelessWidget {
  const PageTab({super.key, required this.onPressed, required this.pageTabLabel});
  final VoidCallback onPressed;
  final String pageTabLabel;

  @override
  Widget build(BuildContext context){
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(pageTabLabel,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              fontFamily: 'FiraCode',
              color: Colors.teal[900],
            ),
          ),

          Icon(
            Icons.arrow_forward_ios,
            size: 17.0,
            color: Colors.teal[900],
          ),

        ],
      ),
    );
  }

}
