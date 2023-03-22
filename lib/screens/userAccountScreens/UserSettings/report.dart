import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/custom_button.dart';

const Color k_fontTextColour = Colors.black;
const Color k_submitButtonBgColour = Colors.teal;
Widget k_textbox = const TextField(
  textAlign: TextAlign.left,
  style: TextStyle(fontSize: 23.0, height: 0.75, color: Colors.white),
  cursorColor: Colors.white,
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

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 29, 29),
        toolbarHeight: 90,
        title: const Text('REPORT'),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),

                const Text(
                  'Briefly explain the problem you want to report.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0,
                    color: Colors.white,
                    //fontFamily: 'FiraCode',
                    //color: k_fontTextColour,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                k_textbox,
                //Text Box
                // const TextField(
                //   maxLines: 6,
                //   textAlign: TextAlign.left,
                //   maxLength: 500,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     fillColor: Color.fromARGB(255, 63, 62, 59),
                //     labelText: 'Type here...',

                //   ),
                // ),

                const SizedBox(
                  height: 20.0,
                ),

                RaisedGradientButton(
                  gradient: const LinearGradient(
                    colors: <Color>[Colors.deepPurple, Colors.purple],
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Center(
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
