import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/page_tabs.dart';


const spacing =  SizedBox(height: 25.0,);

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
        title: const Center(child: Text('ACCOUNT SETTINGS')),
      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children: <Widget>[

                //Personal Information
                PageTab(onPressed: () {
                  setState(() {
                    null;
                  });
                }, pageTabLabel: 'Personal Information'),
                spacing,

                //Language
                PageTab(onPressed: () {
                  setState(() {
                    null;
                  });
                }, pageTabLabel: 'Language'),
                spacing,

                //Sensitive Content Control
                PageTab(onPressed: () {
                  setState(() {
                    null;
                  });
                }, pageTabLabel: 'Sensitive Content Control'),
                spacing,
                //Data Usage
                PageTab(onPressed: () {
                  setState(() {
                    null;
                  });
                }, pageTabLabel: 'Data Usage'),
                spacing,

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
