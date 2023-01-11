import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/edit_profile.dart';
import 'package:geotagar/screens/userAccountScreens/account_settings.dart';
import 'package:geotagar/screens/userAccountScreens/privacy_and_security.dart';
import 'package:geotagar/screens/userAccountScreens/report.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Center(child: Text('SETTINGS')),
      ),

      //backgroundColor: Colors.blueGrey[100],

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                //Profile pic and username row
                  const CircleAvatar(
                  radius: 75.0,
                  backgroundColor: Colors.white38,
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundImage: NetworkImage(
                        'https://static.wikia.nocookie.net/naruto/images/d/dc/Naruto%27s_Sage_Mode.png/revision/latest/scale-to-width-down/1920?cb=20150124180545'),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '@DATTEBAYOOO',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontFamily: 'FiraCode',
                      color: Colors.black,
                    ),
                  ),
                ),


                const SizedBox(
                  child: Divider(
                    color: Colors.black,
                    thickness: 2.0,
                  ),

                ),
                const SizedBox(
                  height: 30.0,
                ),


                //Version 1.0
                const Text('Version 1.0',
                  style: TextStyle(
                    fontSize: 33.0,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                //Edit Profile
                TextButton(
                  onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return const EditProfile() ;
                      })
                    );
                  } ,
                  child: Text('Edit User Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          fontFamily: 'FiraCode',
                          color: Colors.teal[900],
                        ),
                      ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                //Account Settings
                TextButton(
                  onPressed:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return const AccountSettings() ;
                        })
                    );
                  } ,
                  child: Text('Account Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'FiraCode',
                      color: Colors.teal[900],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                //Privacy and Security
                TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return const PrivacyAndSecurity() ;
                        })
                    );
                  } ,
                  child: Text('Privacy and Security',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'FiraCode',
                      color: Colors.teal[900],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                //Report a Problem
                TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return const Report() ;
                        })
                    );
                  } ,
                  child: Text('Report a Problem',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      fontFamily: 'FiraCode',
                      color: Colors.teal[900],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                //Dark Mode
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Dark Mode   ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        fontFamily: 'FiraCode',
                        color: Colors.teal[900],
                      ),
                    ),
                    

                    GestureDetector(
                      onTap: null,
                      child: Icon(
                        Icons.toggle_off,
                        size: 70.0,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    
                  ],
                ),

                const SizedBox(
                  height: 25.0,
                ),

                //Logout
                TextButton(
                  onPressed: null,
                  child: Text('Log Out',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      //fontFamily: 'FiraCode',
                      color: Colors.red[800],
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
