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
        border: Border.all(width: 1.5,),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: colour,
        
      ),
      child: containerChild,
    );
  }

}
