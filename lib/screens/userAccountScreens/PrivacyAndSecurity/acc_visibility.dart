import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/reusable_container.dart';

Widget k_divider = Divider(
  color: Colors.grey[900],
  height: 0.5,
  thickness: 0.5,
  endIndent: 20.0,
  indent: 20.0,
);
const k_textStyle = TextStyle(fontSize: 20.0);
const k_selectedtextStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
const k_containerColor = Color(0xFFBDBDBD); //grey[400]

enum Options { option1, option2, option3, option4 }

class AccVisibility extends StatefulWidget {
  const AccVisibility({super.key});

  @override
  State<AccVisibility> createState() => _AccVisibility();
}

class _AccVisibility extends State<AccVisibility> {
  TextStyle bg_option1 = k_textStyle;
  TextStyle bg_option2 = k_textStyle;
  TextStyle bg_option3 = k_textStyle;
  TextStyle bg_option4 = k_textStyle;

  void deselectOptions(Options op) {
    bg_option1 = op == Options.option1 ? k_selectedtextStyle : k_textStyle;
    bg_option2 = op == Options.option2 ? k_selectedtextStyle : k_textStyle;
    bg_option3 = op == Options.option3 ? k_selectedtextStyle : k_textStyle;
    bg_option4 = op == Options.option4 ? k_selectedtextStyle : k_textStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('ACCOUNT VISIBILITY'),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'WHO CAN SEE WHEN I AM ONLINE:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .37,
                  child: ReusableContainer(
                    colour: k_containerColor, //grey[400]
                    containerChild: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                deselectOptions(Options.option1);
                              });
                            },
                            child: ReusableContainer(
                              colour: k_containerColor,
                              containerChild: Row(
                                children: [
                                  Text('Everyone', style: bg_option1),
                                ],
                              ),
                            ),
                          ),
                        ),
                        k_divider,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                deselectOptions(Options.option2);
                              });
                            },
                            child: ReusableContainer(
                              colour: k_containerColor,
                              containerChild: Row(
                                children: [
                                  Text(
                                    'Only My Contacts',
                                    style: bg_option2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        k_divider,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                deselectOptions(Options.option3);
                              });
                            },
                            child: ReusableContainer(
                              colour: k_containerColor,
                              containerChild: Row(
                                children: [
                                  Text(
                                    'Only My Contacts except...',
                                    style: bg_option3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        k_divider,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                deselectOptions(Options.option4);
                              });
                            },
                            child: ReusableContainer(
                              colour: k_containerColor,
                              containerChild: Row(
                                children: [
                                  Text(
                                    'Nobody',
                                    style: bg_option4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
