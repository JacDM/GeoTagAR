import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/reusable_container.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/icon_data.dart';

void bottomScreenUserProfile(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return DefaultTextStyle(
          style: const TextStyle(fontFamily: 'OpenSans', color: Colors.black),
          child: Container(
            color: Colors.grey[300],
            height: MediaQuery.of(context).size.height * 0.40,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Pull down bar
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 5.0,
                    width: 100.0,
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),

                  //Block, Report, Share, Link
                  Expanded(
                    flex: 2,
                    child: ReusableContainer(
                      colour: Colors.grey,
                      containerChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //Block
                          Expanded(
                            child: ReusableContainer(
                              colour: Colors.grey,
                              containerChild: Text(
                                'Block',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.red[800],
                                ),
                              ),
                            ),
                          ),

                          Divider(
                            color: Colors.grey[900],
                            height: 0.5,
                            thickness: 0.5,
                            endIndent: 20.0,
                            indent: 20.0,
                          ),

                          //Report
                          Expanded(
                            child: ReusableContainer(
                              colour: Colors.grey,
                              containerChild: Text(
                                'Report',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.red[800],
                                ),
                              ),
                            ),
                          ),

                          Divider(
                            color: Colors.grey[900],
                            height: 0.5,
                            thickness: 0.5,
                            endIndent: 20.0,
                            indent: 20.0,
                          ),

                          //Share
                          const Expanded(
                            child: ReusableContainer(
                              colour: Colors.grey,
                              containerChild: Text(
                                'Share this profile',
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                          ),

                          Divider(
                            color: Colors.grey[900],
                            height: 0.5,
                            thickness: 0.5,
                            endIndent: 20.0,
                            indent: 20.0,
                          ),

                          //Link
                          const Expanded(
                            child: ReusableContainer(
                              colour: Colors.grey,
                              containerChild: Text(
                                'Copy profile URL',
                                style: TextStyle(fontSize: 22.0),
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
        );
      });
}
