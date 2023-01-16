import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';


GlobalKey<FormState> formKey = GlobalKey<FormState>();

class ReusableTextField extends StatelessWidget {
  const ReusableTextField(
      {super.key,
      required this.controller,
      this.validator,
      required this.obscure,
      this.readOnly,
      this.onTap,
      this.onEditingCompleted,
      this.keyboardType,
      this.onChanged,
      //required this.isMulti,
      //this.autofocus,
      //this.enabled,
      //required this.errorText,
      required this.hintText,
      this.suffix,
      this.prefix});

  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obscure;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  //final bool isMulti;
  //final bool? autofocus;
  //final bool? enabled;
  //final String errorText;
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
          //autofocus: autofocus,
          //minLines: isMulti ? 4 : 1,
          //maxLines: isMulti ? null : 1,
          onTap: onTap,
          //enabled: enabled,
          //readOnly: readOnly,
          obscureText: obscure,
          enableSuggestions: !obscure,
          autocorrect: !obscure,
          //keyboardType: keyboardType,
          controller: controller,
          style: TextStyle(
              color: const Color.fromARGB(255, 58, 58, 58).withOpacity(0.9)),
          decoration: InputDecoration(
            isDense: true,
            //errorText: errorText,
            prefixIcon: prefix,
            suffixIcon: suffix,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            //labelStyle:
            // Make this strong
            // TextStyle(
            //     color: Color.fromARGB(255, 126, 126, 126).withOpacity(0.9),
            //     fontWeight: FontWeight.bold),
            hintText: hintText,
            hintStyle: TextStyle(
                color:
                    const Color.fromARGB(255, 126, 126, 126).withOpacity(0.9),
                fontWeight: FontWeight.bold),
            filled: true,
            fillColor:
                const Color.fromARGB(255, 122, 122, 122).withOpacity(0.3),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            //enabledBorder: textFieldfocused(),
            border: (OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            )),
            //focusedBorder: textFieldfocused(),
            //errorBorder: errorrTextFieldBorder(),
            //focusedErrorBorder: errorrTextFieldBorder(),
          ),
          keyboardType: obscure
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          validator: validator),
    );
  }
}
