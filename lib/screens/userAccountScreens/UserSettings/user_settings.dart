import 'package:flutter/material.dart';
import '../UserSettings/edit_profile.dart';
import '../UserSettings/account_settings.dart';
import '../UserSettings/privacy_and_security.dart';
import '../UserSettings/report.dart';
import '../reusableWidgets/page_tabs.dart';

const Color k_SwitchIconColour =  Color(0xFF263238);  //bluegrey[900]
const Color k_UsernameColour = Colors.black;
const Color k_versionColor = Colors.blueGrey;
const Color k_dividerColor = Colors.grey;
const Color k_darkModeFontTextColor = Color(0xFF004D40);   //teal[900]
const Color k_logoutFontTextColor = Color(0xFFC62828) ;    //red[800]

const spacing =  SizedBox(height: 25.0,);
int counter = 0;
enum ViewMode{
  light,
  dark
}
ViewMode viewMode = ViewMode.light;

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Icon darkModeSwitch = const Icon(
    Icons.toggle_on_outlined,
    size: 75.0,
    color: k_SwitchIconColour,
  );
  Icon lightModeSwitch = const Icon(
    Icons.toggle_off_outlined,
    size: 75.0,
    color: k_SwitchIconColour,
  );


  //determine dark/light mode based on
  void darkMode (){
    setState(() {
      counter++;
      viewMode = counter%2 == 0 ? ViewMode.light : ViewMode.dark;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('SETTINGS'),
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
                      //fontFamily: 'FiraCode',
                      color: k_UsernameColour,
                    ),
                  ),
                ),

                //Version 1.0
                const Text('Version 1.0',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: k_versionColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                const SizedBox(
                  height: 40.0,
                  child: Divider(
                    color: k_dividerColor,
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
                      const Text('Dark Mode',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                          //fontFamily: 'FiraCode',
                          color: k_darkModeFontTextColor,
                        ),
                      ),

                      GestureDetector(
                        onTap: darkMode,
                        child: viewMode == ViewMode.dark ? darkModeSwitch : lightModeSwitch,
                      ),

                    ],
                  ),
                ),

                //Logout
                const TextButton(
                  onPressed: null,
                  child: Text('Log Out',
                    style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      //fontFamily: 'FiraCode',
                      color: k_logoutFontTextColor,
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
