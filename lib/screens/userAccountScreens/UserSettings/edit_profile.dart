import 'package:flutter/material.dart';

const Color k_subHeadingsColor = Color(0xFF004D40);   //teal[900]
const Color k_fontTextColour = Colors.black;

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('EDIT PROFILE'),
      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                const SizedBox(
                  height: 10.0,
                ),

                //Profile Picture
                const CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(
                  'https://static.wikia.nocookie.net/naruto/images/d/dc/Naruto%27s_Sage_Mode.png/revision/latest/scale-to-width-down/1920?cb=20150124180545'),
                ),

                //Edit Profile Picture
                TextButton(
                  onPressed: null,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget> [
                      Text('Change Profile Picture  ',
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          //fontFamily: 'FiraCode',
                          color: k_subHeadingsColor,
                        ),
                      ),

                      // CircleAvatar(
                      //   radius: 20.0,
                      //   backgroundColor: Colors.white70,
                      //   child: Icon(
                      //     Icons.edit ,
                      //     size: 25.0,
                      //     color: k_subHeadingsColor,
                      //   ),
                      // ),

                      Icon(
                          Icons.edit ,
                          size: 25.0,
                          color: k_subHeadingsColor,
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),

                //Username
                const Text('@DATTEBAYOOO',
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    //fontFamily: 'FiraCode',
                    color: k_fontTextColour,
                  ),
                ),
                TextButton(
                  onPressed: null,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Edit Username ',
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          //fontFamily: 'FiraCode',
                          color: k_subHeadingsColor,
                        ),
                      ),


                      Icon(
                        Icons.edit ,
                        size: 25.0,
                        color: k_subHeadingsColor,
                        ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),

                //Name
                const Text('Uzumaki Naruto',
                  style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    //fontFamily: 'FiraCode',
                    color: k_fontTextColour,
                  ),
                ),
                TextButton(
                  onPressed: null,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Edit Name ',
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          //fontFamily: 'FiraCode',
                          color: k_subHeadingsColor,
                        ),
                      ),


                      Icon(
                        Icons.edit ,
                        size: 25.0,
                        color: k_subHeadingsColor,
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height:20.0,
                ),

                //Bio
                const Padding(
                       padding: EdgeInsets.all(20.0),
                       child: ListTile(
                         title: Text(
                           'Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village.',
                           style: TextStyle(
                             //fontFamily: 'FiraCode',
                             fontSize: 20.0,
                             //fontWeight: FontWeight.bold,
                           ),
                         ),
                       ),
                     ),
                TextButton(
                  onPressed: null,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Edit Bio/Description ',
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          //fontFamily: 'FiraCode',
                          color: k_subHeadingsColor,
                        ),
                      ),


                      Icon(
                        Icons.edit ,
                        size: 25.0,
                        color: k_subHeadingsColor,
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),

              ],
            ),
          ),
        ),
      ),


    );
  }


}
