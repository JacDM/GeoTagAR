import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/page_tabs.dart';

const spacing =  SizedBox(height: 25.0,);

class PrivacyAndSecurity extends StatefulWidget {
  const PrivacyAndSecurity({super.key});

  @override
  State<PrivacyAndSecurity> createState() => _PrivacyAndSecurityState();
}

class _PrivacyAndSecurityState extends State<PrivacyAndSecurity> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Center(child: Text('PRIVACY AND SECURITY')),
      ),

      backgroundColor: Colors.blueGrey[200],

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children: <Widget>[

                //Account Visibility
                PageTab(onPressed: () {
                  setState(() {
                    null;
                  });
                }, pageTabLabel: 'Account Visibility'),
                spacing,
                //Password
                PageTab(onPressed: () {
                  setState(() {
                    null;
                  });
                }, pageTabLabel: 'Change Password'),
                spacing,
                //Login Activity
                PageTab(onPressed: () {
                  setState(() {
                    null;
                  });
                }, pageTabLabel: 'Login Activity'),
                spacing,
                //Blocked Accounts
                PageTab(onPressed: () {
                  setState(() {
                    null;
                  });
                }, pageTabLabel: 'Blocked Accounts'),
                spacing,
                //Activity Status
                PageTab(onPressed: () {
                  setState(() {
                    null;
                  });
                }, pageTabLabel: 'Activity Status'),

              ],
            ),
          ),
        ),
      ),


    );
  }


}
