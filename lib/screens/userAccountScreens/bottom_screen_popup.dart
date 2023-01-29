import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/reusable_container.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/icon_data.dart';


Color k_containerColor =  Colors.white38  ; //Color(0xFFBDBDBD)

void bottomSheetPopup(context){
  showModalBottomSheet(context: context, builder: (BuildContext bc){
    return Container(
      //color: Colors.grey[300],
      height: MediaQuery.of(context).size.height * 0.60,
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

            //Share and Link
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      colour: k_containerColor,
                      containerChild: const WidgetIconData(
                        icon: CupertinoIcons.share,
                        iconText: 'Share',
                      ),
                    ),
                  ),

                  Expanded(
                    child: ReusableContainer(
                      colour: k_containerColor,
                      containerChild: const WidgetIconData(
                        icon: FontAwesomeIcons.link,
                        iconText: 'Link',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Edit, Add, Delete
            Expanded(
              flex: 2,
              child: ReusableContainer(
                colour: k_containerColor,
                containerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          //colour: Colors.grey,
                          child: Text('Edit', style: TextStyle(fontSize: 22.0,),),
                        ),
                      ),

                    Divider(color: Colors.grey[900], height: 0.5, thickness: 0.5, endIndent: 20.0, indent: 20.0,),

                    //Add to scrapbook
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          //colour: Colors.grey,
                          child: Text('Add to scrapbook', style: TextStyle(fontSize: 22.0,),),
                        ),
                      ),

                    Divider(color: Colors.grey[900], height: 0.5, thickness: 0.5, endIndent: 20.0, indent: 20.0,),

                    //Archive
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          //colour: Colors.grey,
                          child: Text('Archive', style: TextStyle(fontSize: 22.0,),),
                        ),
                      ),

                    Divider(color: Colors.grey[900], height: 0.5, thickness: 0.5, endIndent: 20.0, indent: 20.0,),

                    //Delete
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Delete', style: TextStyle(color: Colors.red[800], fontSize: 22.0),),
                      ),
                    ),

                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  });
}