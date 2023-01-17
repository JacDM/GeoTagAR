import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/reusable_container.dart';

Widget k_divider = Divider(color: Colors.grey[900], height: 0.5, thickness: 0.5, endIndent: 20.0, indent: 20.0,);
const k_textStyle = TextStyle(fontSize: 20.0);

class AccVisibility extends StatefulWidget {
  const AccVisibility({super.key});

  @override
  State<AccVisibility> createState() => _AccVisibility();
}

class _AccVisibility extends State<AccVisibility> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Center(child: Text('ACCOUNT VISIBILITY')),
      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                const SizedBox(height: 10.0,),

                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('WHO CAN SEE WHEN I AM ONLINE:', style: TextStyle(fontSize: 18.0),),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .30,
                  child: ReusableContainer(
                    colour: Colors.grey,
                    containerChild: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        const Expanded(
                          child: ReusableContainer(
                            colour: Colors.grey,
                            containerChild: Text('Everyone', style: k_textStyle,),
                          ),
                        ),

                        k_divider,

                        const Expanded(
                          child: ReusableContainer(
                            colour: Colors.grey,
                            containerChild: Text('Only My Contacts', style: k_textStyle,),
                          ),
                        ),

                        k_divider,

                        const Expanded(
                          child: ReusableContainer(
                            colour: Colors.grey,
                            containerChild: Text('Only My Contacts except...', style: k_textStyle,),
                          ),
                        ),

                        k_divider,

                        const Expanded(
                          child: ReusableContainer(
                            colour: Colors.grey,
                            containerChild: Text('Nobody', style: k_textStyle,),
                          ),
                        ),

                      ],
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
