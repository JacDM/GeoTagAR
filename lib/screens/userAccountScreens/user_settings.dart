import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/edit_profile.dart';
import 'package:geotagar/screens/userAccountScreens/account_settings.dart';
import 'package:geotagar/screens/userAccountScreens/privacy_and_security.dart';
import 'package:geotagar/screens/userAccountScreens/report.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/page_tabs.dart';

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

                //Version 1.0
                const Text('Version 1.0',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(
                  height: 40.0,
                  child: Divider(
                    color: Colors.grey,
                    thickness: 2.0,
                  ),
                ),

                //Edit Profile
                PageTab(onPressed:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return const EditProfile() ;
                      })
                  );
                }, pageTabLabel: 'Edit User Profile'),
                spacing,

                //Account Settings
                PageTab(onPressed:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return const AccountSettings() ;
                      })
                  );
                }, pageTabLabel: 'Account Settings'),
                spacing,

                //Privacy and Security
                PageTab(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return const PrivacyAndSecurity() ;
                      })
                  );
                }, pageTabLabel: 'Privacy and Security'),
                spacing,

                //Report a Problem
                PageTab(onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return const Report() ;
                      })
                  );
                }, pageTabLabel: 'Report a Problem'),

                //Dark Mode
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Dark Mode   ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                          fontFamily: 'FiraCode',
                          color: Colors.teal[900],
                        ),
                      ),

                      GestureDetector(
                        onTap: null,
                        child: Icon(
                          Icons.toggle_off,
                          size: 75.0,
                          color: Colors.blueGrey[900],
                        ),
                      ),

                    ],
                  ),
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
