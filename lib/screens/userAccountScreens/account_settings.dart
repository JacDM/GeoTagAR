import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/page_tabs.dart';


class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Center(child: Text('PRIVACY AND SECURITY')),
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

                const SizedBox(
                  height: 30.0,
                ),

                //Personal Information
                TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Personal Information',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'FiraCode',
                          color: Colors.teal[900],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 17.0,
                        color: Colors.teal[900],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                //Language
                TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Language',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'FiraCode',
                          color: Colors.teal[900],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 17.0,
                        color: Colors.teal[900],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                //Sensitive Content Control
                TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sensitive Content Control',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'FiraCode',
                          color: Colors.teal[900],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 17.0,
                        color: Colors.teal[900],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                //Data Usage
                TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Data Usage',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'FiraCode',
                          color: Colors.teal[900],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 17.0,
                        color: Colors.teal[900],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                //Request Verification
                TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Request Verification',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'FiraCode',
                          color: Colors.teal[900],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 17.0,
                        color: Colors.teal[900],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 40.0,
                ),

                //Delete Account
                TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Delete Account',
                        style: TextStyle(
                          //fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          //fontFamily: 'FiraCode',
                          color: Colors.red[800],
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
