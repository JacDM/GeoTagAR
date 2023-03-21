import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/reusable_container.dart';

Widget k_divider = Divider(
  color: Colors.grey,
  height: 0.5,
  thickness: 0.5,
  endIndent: 20.0,
  indent: 20.0,
);
Widget k_spacing = const SizedBox(
  height: 10.0,
);
const k_textStyle = TextStyle(fontSize: 20.0, color: Colors.white);
const k_selectedtextStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue);
const k_containerColor = Color(0xFFBDBDBD); //grey[400]


enum Options { option1, option2, option3, option4 }

class ActivityStatus extends StatefulWidget {
  const ActivityStatus({super.key});

  @override
  State<ActivityStatus> createState() => _ActivityStatus();
}

class _ActivityStatus extends State<ActivityStatus> {
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
        backgroundColor: Color.fromARGB(255, 29, 29, 29),
        toolbarHeight: 90,
        title: const Text('ACTIVITY STATUS'),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                k_spacing,
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'WHO CAN SEE WHEN I AM ONLINE:',
                    style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .30,
                  child: ReusableContainer(
                    colour: Colors.black, //grey[400]
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
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              //colour: k_containerColor,
                              child: Row(
                                children: [
                                  Text('Online', style: bg_option1),
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
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              //colour: k_containerColor,
                              child: Row(
                                children: [
                                  Text(
                                    'Appear Away',
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
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              //colour: k_containerColor,
                              child: Row(
                                children: [
                                  Text(
                                    'Appear Offline',
                                    style: bg_option3,
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
