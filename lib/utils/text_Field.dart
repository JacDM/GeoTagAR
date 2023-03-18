import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class ReusableTextField extends StatelessWidget {
  const ReusableTextField(
      {super.key,
      this.controller,
      this.validator,
      required this.obscure,
      this.readOnly,
      this.onTap,
      this.onEditingCompleted,
      this.keyboardType,
      this.onChanged,
      required this.hintText,
      this.suffix,
      this.prefix,
      this.textColor,
      this.onFieldSubmitted});

  final Color? textColor;

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscure;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final String hintText;
  final Widget? suffix;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
          onChanged: onChanged,
          onEditingComplete: onEditingCompleted,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          obscureText: obscure,
          enableSuggestions: !obscure,
          autocorrect: !obscure,
          controller: controller,
          style: TextStyle(
            color: textColor ??
                const Color.fromARGB(255, 58, 58, 58).withOpacity(0.9),
          ),
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: prefix,
            suffixIcon: controller?.text.isNotEmpty == true
                ? SizedBox(
                    width: 12,
                    height: 12,
                    child: IconButton(
                      iconSize: 12, // set the icon size
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        controller?.clear();
                      },
                    ),
                  )
                : suffix,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: hintText,
            hintStyle: TextStyle(
                color:
                    const Color.fromARGB(255, 126, 126, 126).withOpacity(0.9),
                fontWeight: FontWeight.bold),
            filled: true,
            fillColor:
                const Color.fromARGB(255, 122, 122, 122).withOpacity(0.3),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            ),
          ),
          keyboardType: obscure
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          validator: validator),
    );
  }
}
