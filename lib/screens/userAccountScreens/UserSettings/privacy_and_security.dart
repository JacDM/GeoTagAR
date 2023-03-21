import 'package:flutter/material.dart';
import '../../privacypolicy.dart';
import '../../t&c.dart';
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
        backgroundColor: Color.fromARGB(255, 29, 29, 29),
        toolbarHeight: 90,
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

                //Terms and Conditions
                PageTab(onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return const TNC() ;
                        })
                    );
                  });
                }, pageTabLabel: 'Terms and Conditions'),
                spacing,

                //Privacy Policy
                PageTab(onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return const PP() ;
                        })
                    );
                  });
                }, pageTabLabel: 'Privacy Policy'),


              ],
            ),
          ),
        ),
      ),


    );
  }


}
