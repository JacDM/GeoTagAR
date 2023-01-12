import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer({super.key, required this.colour, required this.containerChild});
  final Color colour;
  final Widget containerChild;

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.all(10.0),
      //padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: containerChild,
    );
  }

}
