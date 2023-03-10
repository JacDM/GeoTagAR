import 'package:flutter/material.dart';
import '../reusableWidgets/page_tabs.dart';
import '../PrivacyAndSecurity/acc_visibility.dart';
import '../PrivacyAndSecurity/reset_password.dart';
import '../PrivacyAndSecurity/activity_status.dart';

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
        title: const Text('PRIVACY AND SECURITY'),
      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children: <Widget>[

                //Account Visibility
                PageTab(onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return const AccVisibility() ;
                        })
                    );
                  });
                }, pageTabLabel: 'Account Visibility'),
                spacing,

                //Reset Password
                PageTab(onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return const ResetPassword() ;
                        })
                    );
                  });
                }, pageTabLabel: 'Reset Password'),
                spacing,

                //Login Activity
                // PageTab(onPressed: () {
                //   setState(() {
                //     null;
                //   });
                // }, pageTabLabel: 'Login Activity'),
                // spacing,

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return const ActivityStatus() ;
                        })
                    );
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
