import 'package:flutter/material.dart';

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

                //Account Visibility
                TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Account Visibility',
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

                //Password
                TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Change Password',
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

                //Login Activity
                TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Login Activity',
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

                //Blocked Accounts
                TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Blocked Accounts',
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

                //Activity Status
                TextButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Activity Status',
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
              ],
            ),
          ),
        ),
      ),


    );
  }


}
