import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/page_tabs.dart';

import 'package:geotagar/screens/userAccountScreens/AccSettings/data_usage.dart';
import 'package:geotagar/screens/userAccountScreens/AccSettings/personal_info.dart';
import 'package:geotagar/screens/userAccountScreens/AccSettings/sensitive_content.dart';

const spacing =  SizedBox(height: 25.0,);
const Color k_deleteFontTextColor = Color(0xFFC62828) ;    //red[800]

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
        title: const Text('ACCOUNT SETTINGS'),
      ),


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

            children: <Widget>[

              //Personal Information
              PageTab(onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return const PersonalInfo() ;
                      })
                  );
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context){
                        return const SCC() ;
                      })
                  );
                });
              }, pageTabLabel: 'Sensitive Content Control'),

              SizedBox(height: 50.0,),


              //Delete Account
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedGradientButton(
                    gradient: const LinearGradient(
                      colors: <Color>[Color(0xFFC62828),Color(0xFFC62828)],
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Center(
                      child: Text(
                        'DELETE ACCOUNT',
                        style: TextStyle(color: Colors.white, fontSize: 23.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),


    );
  }


}
