import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  const RectangleButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.buttonColor,
      this.textColor,
      this.width,
      this.height});

  final String title;
  final Color buttonColor;
  final Function onTap;
  final Color? textColor;
  final double? width;
  final double? height;
  //final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.25,
      height: height ?? MediaQuery.of(context).size.height * 0.05,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return buttonColor;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)))),
        child: Text(
          title,
          style: TextStyle(
              color: textColor ?? Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
