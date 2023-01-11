import 'package:flutter/material.dart';

Image logo(String img) {
  return Image.asset(
    img,
    //fit: BoxFit.fitWidth,
    //width: 240,
    //height: 240,
  );
}

Image background(String img) {
  return Image.asset(
    img,
    fit: BoxFit.cover,
  );
}

TextField reusableTextField(
    String text, bool passwordType, TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: passwordType,
    enableSuggestions: !passwordType,
    autocorrect: !passwordType,
    style: TextStyle(color: Color.fromARGB(255, 75, 75, 75).withOpacity(0.9)),
    decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 18, right: 12, top: 12, bottom: 12),
        isDense: true,
        labelText: text,
        //contentPadding: const EdgeInsets.all(12),
        labelStyle:
            // Make this strong
            TextStyle(
                color: Color.fromARGB(255, 126, 126, 126).withOpacity(0.9),
                fontWeight: FontWeight.bold),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Color.fromARGB(255, 122, 122, 122).withOpacity(0.3),
        border: (OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ))),
    keyboardType: passwordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container button(
    BuildContext context, String title, Function onTap, Color color) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.25,
    height: MediaQuery.of(context).size.height * 0.05,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),textAlign: TextAlign.center,
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return color;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)))),
    ),
  );
}
