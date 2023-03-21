import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/custom_button.dart';

TextStyle k_passwordtextstyle = const TextStyle(fontSize: 20.0, color: k_fontTextColour);
const Color k_fontTextColour = Colors.white;
Widget k_textbox = const TextField(
  textAlign: TextAlign.left,
  obscureText: true,
  style: TextStyle(fontSize: 27.0, height: 0.75, color: k_fontTextColour),
  cursorColor:  k_fontTextColour,
  decoration: InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
  ),
  //cursorWidth: 3.0,
  //cursorHeight: 35.0,
);
Widget spacing = const SizedBox(
  height: 50.0,
);

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPassword();
}

class _ResetPassword extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 29, 29),
        toolbarHeight: 90,
        title: const Text('RESET PASSWORD'),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'RESET PASSWORD',
                  style: TextStyle(fontSize: 31.0, fontWeight: FontWeight.bold, color: k_fontTextColour),
                ),
                spacing,
                Text('Current Password', style: k_passwordtextstyle),
                k_textbox,
                spacing,
                Text('New Password', style: k_passwordtextstyle),
                k_textbox,
                spacing,
                Text('Confirm New Password', style: k_passwordtextstyle),
                k_textbox,
                spacing,
                Row(
                  children: [
                    Expanded(
                      child: RaisedGradientButton(
                        gradient: const LinearGradient(
                          colors: <Color>[Colors.deepPurple, Colors.purple],
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Center(
                          child: Text(
                            'UPDATE PASSWORD',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}