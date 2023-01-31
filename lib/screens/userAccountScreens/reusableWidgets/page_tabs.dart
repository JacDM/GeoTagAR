import 'package:flutter/material.dart';

const Color k_tabFontColour = Color(0xFF37474F);

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
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              fontFamily: 'Nunito',
              //color: k_tabFontColour,
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 17.0,
            //color: k_tabFontColour,
          ),

        ],
      ),
    );
  }

}
