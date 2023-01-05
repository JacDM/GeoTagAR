import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Center(child: Text('REPORT')),
        backgroundColor: Colors.blueGrey[800],
        shadowColor: Colors.teal[900],
      ),

      backgroundColor: Colors.blueGrey[200],

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children: const <Widget>[

                SizedBox(
                  height: 30.0,
                ),

                Text('Briefly explain the Problem you want to Report',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    fontFamily: 'FiraCode',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),

                //Text Box
                TextField(
                  maxLength: 500,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Type here...',
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

                //Submit Button
                ElevatedButton(
                    onPressed: null,
                    child: Text('SUBMIT'),
                ),

              ],
            ),
          ),
        ),
      ),


    );
  }


}
