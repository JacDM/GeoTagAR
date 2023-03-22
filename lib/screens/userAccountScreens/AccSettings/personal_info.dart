import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/reusable_container.dart';

import '../../../utils/methods.dart';

const Color k_fontTextColour = Colors.white;
const Color k_bgColor = Colors.black;
const k_subHeadingTextStyle =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white);
const TextStyle k_textStyle = TextStyle(
    fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.blueGrey);
const k_valtextStyle = TextStyle(fontSize: 16.0, color: Colors.white);

class PersonalInfo extends StatefulWidget {
  final String uid;
  const PersonalInfo({super.key, required this.uid});

  @override
  State<PersonalInfo> createState() => _PersonalInfo();
}

class _PersonalInfo extends State<PersonalInfo> {
  late Map<String, dynamic> userData;
  String capitalize(string) {
    return "${string[0].toUpperCase()}${string.substring(1).toLowerCase()}";
  }
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      // get post lENGTH
      var postSnap = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: widget.uid)
          .get();


      userData = userSnap.data()!;

      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CircularProgressIndicator(
            value: 0.3,
            color: Colors.greenAccent,
          ),
        ],
      );
    }
    else{
      return Scaffold(
        //appbar
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 29, 29, 29),
          toolbarHeight: 90,
          title: const Text('PERSONAL INFO'),
        ),

        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  //Profile Picture
                  CircleAvatar(
                    radius: 75.0,
                    backgroundColor: Colors.white38,
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundImage: NetworkImage(
                          userData['profilePic']
                          ),
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
                                color: Colors.black,
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
                                      'Username:',
                                      style: k_textStyle,
                                    ),
                                    Text(
                                      'Age:',
                                      style: k_textStyle,
                                    ),
                                    Text(
                                      'Account Type:',
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
                                color: Colors.black,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text(
                                      capitalize(userData['name']),
                                      style: k_valtextStyle,
                                    ),
                                    Text(
                                      userData['username'],
                                      style: k_valtextStyle,
                                    ),
                                    Text(
                                      userData['age'].toString(),
                                      style: k_valtextStyle,
                                    ),
                                    Text(
                                      userData['gender'],
                                      style: k_valtextStyle,
                                    ),
                                    Text(
                                      userData['accountType'],
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
                                color: Colors.black,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Email:',
                                      style: k_textStyle,
                                    ),
                                    // Text(
                                    //   'Phone:',
                                    //   style: k_textStyle,
                                    // ),
                                  ],
                                ),
                              ),
                            ),

                            //Values
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                color: Colors.black,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text(
                                      userData['email'],
                                      style: k_valtextStyle,
                                    ),
                                    // Text(
                                    //   '111-222-333-123',
                                    //   style: k_valtextStyle,
                                    // ),
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
}