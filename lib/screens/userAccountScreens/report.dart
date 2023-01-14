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
      ),

      backgroundColor: Colors.blueGrey[200],

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children:  <Widget>[

                const SizedBox(
                  height: 30.0,
                ),

                const Text('Briefly explain the Problem you want to Report',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    fontFamily: 'FiraCode',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),

                //Text Box
                const TextField(
                  maxLines: 6,
                  textAlign: TextAlign.left,
                  maxLength: 500,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(

                    ),
                    labelText: 'Type here...',
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                //Submit Button
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 50.0,
                    width: 120.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.teal),
                      ),
                      child: const Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                        ),
                      ),
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
