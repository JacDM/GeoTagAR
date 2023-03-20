import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/reusable_container.dart';

const Color k_fontTextColour = Colors.black;
const Color k_bgColor = Colors.white;
const k_subHeadingTextStyle =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
const TextStyle k_textStyle = TextStyle(
    fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.blueGrey);
const k_valtextStyle = TextStyle(fontSize: 16.0);

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfo();
}

class _PersonalInfo extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('PERSONAL INFO'),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                //Profile Picture
                const CircleAvatar(
                  radius: 75.0,
                  backgroundColor: Colors.white38,
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundImage: NetworkImage(
                        'https://static.wikia.nocookie.net/naruto/images/d/dc/Naruto%27s_Sage_Mode.png/revision/latest/scale-to-width-down/1920?cb=20150124180545'),
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                //Basic Info -> subheading
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Basic Information',
                        style: k_subHeadingTextStyle,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: Expanded(
                    child: Container(
                      color: k_bgColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          //Name, Birthday, Gender
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Name:',
                                    style: k_textStyle,
                                  ),
                                  Text(
                                    'Birthday:',
                                    style: k_textStyle,
                                  ),
                                  Text(
                                    'Gender:',
                                    style: k_textStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Uzumaki Naruto',
                                    style: k_valtextStyle,
                                  ),
                                  Text(
                                    'October 10',
                                    style: k_valtextStyle,
                                  ),
                                  Text(
                                    'Male',
                                    style: k_valtextStyle,
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

                const SizedBox(
                  height: 40.0,
                ),

                //Contact Info -> Subheading
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Contact Information',
                        style: k_subHeadingTextStyle,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .20,
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      color: k_bgColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          //Email, Phone
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Email:',
                                    style: k_textStyle,
                                  ),
                                  Text(
                                    'Phone:',
                                    style: k_textStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //Values
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'UzumakiNaruto10@gmail.com',
                                    style: k_valtextStyle,
                                  ),
                                  Text(
                                    '111-222-333-123',
                                    style: k_valtextStyle,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}