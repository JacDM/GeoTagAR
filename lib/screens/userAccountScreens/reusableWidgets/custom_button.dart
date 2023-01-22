import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {

  const RaisedGradientButton({super.key, required this.child, required this.gradient, required this.onPressed,});

  final Widget child;
  final Gradient gradient;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 55.0,
        decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 3.5),
                blurRadius: 3,
              ),
            ]
        ),
        child: child,
      ),
    );
  }
}