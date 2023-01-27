import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/reusable_container.dart';

Widget k_divider = Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10.0),
  child:   Container(height: 1.0, width: double.infinity, color: Colors.grey[600],),
);
const k_textStyle = TextStyle(fontSize: 23.0);
const k_selectedtextStyle = TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold);
const k_containerColor = Colors.white38;  //Color(0xFFE0E0E0)

enum Options{
  option1, option2, option3, option4
}

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


  void deselectOptions (Options op) {
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

                const SizedBox(height: 10.0,),

                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'WHO CAN SEE WHEN I AM ONLINE:',
                    style: TextStyle(
                        fontSize: 20.0,
                        //color: Color(0xFF424242),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .37,
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8.0)),
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(10.0),
                    //colour: k_containerColor,  //grey[400]
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [

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
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              //colour: k_containerColor,
                              child: Row(
                                children: [
                                  Text('Only My Contacts', style: bg_option2,),
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
                                  Text('Only My Contacts except...', style: bg_option3,),
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
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              //colour: k_containerColor,
                              child: Row(
                                children: [
                                  Text('Nobody', style: bg_option4,),
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
