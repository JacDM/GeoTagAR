import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geotagar/screens/userAccountScreens/bottom_screen_popup.dart';

const k_username = '@DATTEBAYOOO';
const k_location = 'Hidden Leaf Village';
const k_caption = 'Reminiscing the old times #Team7';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //appbar
      appBar: AppBar(
        title: Column(
          children: const <Widget> [
            // Text(
            //   k_username,
            //   style: TextStyle(
            //     color: Colors.white38,
            //     fontSize: 17.0,
            //   ),
            // ),

            Text('Posts',
              style: TextStyle(
                fontSize: 25.0,
              ),),
          ],
        ),
      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20.0, left: 8.0, right: 8.0),
            child: Column(
              children:  <Widget>[

                //Profile pic, username, location
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
                  child: Row(
                        children: <Widget> [
                          //profile pic,
                          const CircleAvatar(
                            radius: 36.0,
                            backgroundColor: Colors.blueGrey,
                            child: CircleAvatar(
                              radius: 33.0,
                              backgroundImage: NetworkImage(
                                  'https://static.wikia.nocookie.net/naruto/images/d/dc/Naruto%27s_Sage_Mode.png/revision/latest/scale-to-width-down/1920?cb=20150124180545'),
                            ),
                          ),

                          const SizedBox(
                            width: 20.0,
                          ),

                          //username, location
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget> [
                                Text(k_username, style: TextStyle(
                                    //color: Colors.black,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),),
                                Text(k_location, style: TextStyle(
                                  //color: Colors.black,
                                  fontSize: 17.0,), ),
                              ],
                            ),
                          ),

                          //Dots icon
                          GestureDetector(
                              onTap: () {
                                //Display screen with :
                                // Edit, Save, Link, Delete
                                bottomSheetPopup(context);
                              },

                              child: const Icon(
                                Icons.more_horiz,
                                size: 37.0,
                                //color: Colors.black,
                              )
                          ),
                        ],
                      ),
                ),

                //Expanded Post
                Container(
                  height: 340.0,
                  //width: 100.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: NetworkImage('https://www.numerama.com/wp-content/uploads/2022/08/image5-min.jpg'),
                      fit: BoxFit.contain,
                    ),

                  ),

                ),

                //Like, comment and share button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                  child: Row(
                    children: const <Widget> [

                      Icon(FontAwesomeIcons.heart, size: 33.0,
                        //color: Colors.black,
                      ),
                      SizedBox(width: 20.0,),
                      Icon(FontAwesomeIcons.comment, size: 33.0,
                        //color: Colors.black,
                      ),
                      SizedBox(width: 20.0,),
                      Icon(Icons.send, size: 33.0,
                        //color: Colors.black,
                      ),
                      SizedBox(width: 20.0,),
                      //Icon(FontAwesomeIcons.locationArrow, size: 35.0, color: Colors.black,),

                    ],
                  ),
                ),

                //Caption written
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: RichText(
                      text: const TextSpan(
                        //style: TextStyle(color: Colors.black), //apply style to all
                        children: [
                          TextSpan(text: k_username, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                          TextSpan(text: '  $k_caption', style: TextStyle(fontSize: 15.0, ),),
                        ],
                      ),
                    ),
                  ),
                ),

                //Comments section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    //widthFactor: 3.25,
                    child: Text(
                      'View all comments',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 17.0,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueGrey,
                        decorationThickness: 1.5,
                      ),
                    ),
                  ),
                ),

                //Adding a comment
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    child: Row(
                      textDirection: TextDirection.ltr,
                      children: const <Widget> [
                        //profile pic,
                        CircleAvatar(
                          radius: 20.0,
                          backgroundImage: NetworkImage(
                              'https://static.wikia.nocookie.net/naruto/images/d/dc/Naruto%27s_Sage_Mode.png/revision/latest/scale-to-width-down/1920?cb=20150124180545'),
                        ),

                        SizedBox(
                          width: 20.0,
                        ),
                        
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              labelText: 'Add a comment',
                            ),
                          ),
                        ),
                      ],
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
