import 'package:flutter/material.dart';

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
        backgroundColor: Colors.blueGrey[800],
          shadowColor: Colors.teal[900],
      ),

      backgroundColor: Colors.blueGrey[200],

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                //Profile pic and username row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          'https://static.wikia.nocookie.net/naruto/images/d/dc/Naruto%27s_Sage_Mode.png/revision/latest/scale-to-width-down/1920?cb=20150124180545'),
                    ),
                    Text(
                      '@DATTEBAYOOO',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'FiraCode',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10.0,
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
                    fontSize: 30.0,
                    color: Colors.black38,
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                //Edit Profile
                TextButton(
                  onPressed: null,
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
                  onPressed: null,
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
                  onPressed: null,
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
                  onPressed: null,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text('Dark Mode',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        fontFamily: 'FiraCode',
                        color: Colors.teal[900],
                      ),
                    ),

                    const CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 22.0,
                      child: FloatingActionButton(
                        onPressed: null,
                        tooltip: 'Settings',
                        child: Icon(
                          Icons.dark_mode_outlined,
                          size: 35.0,
                          color: Colors.white,
                        ),
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
