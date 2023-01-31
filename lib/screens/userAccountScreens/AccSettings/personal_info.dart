import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/reusable_container.dart';
import 'package:geotagar/screens/userAccountScreens/AccSettings/edit_personal_info.dart';

const Color k_fontTextColour = Colors.black;
const Color k_bgColor = Colors.white38;  //Color(0xFFEEEEEE)
const k_subHeadingTextStyle = TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700);
const TextStyle k_textStyle =  TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500,); // color: Color(0xFF455A64)
const k_valtextStyle = TextStyle(fontSize: 20.0);

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfo();
}

class _PersonalInfo extends State<PersonalInfo> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('PERSONAL INFO'),
      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(

              children:  <Widget>[

                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    //backgroundColor: Colors.black,
                    //22.0
                    radius: MediaQuery.of(context).size.width * 0.0525,
                    child: FloatingActionButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context){
                              return const EditPersonalInfo() ;
                            })
                        );
                      },
                      tooltip: 'Edit',
                      child: Icon(
                        Icons.edit,
                        //35.0
                        size: MediaQuery.of(context).size.width * 0.07,
                        //color: Colors.white,
                      ),
                    ),
                  ),
                ),

                //Profile Picture
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.18,
                  backgroundColor: Colors.white38,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.17,
                    backgroundImage: const NetworkImage(
                        'https://static.wikia.nocookie.net/naruto/images/d/dc/Naruto%27s_Sage_Mode.png/revision/latest/scale-to-width-down/1920?cb=20150124180545'),
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),

                //Basic Info -> subheading
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Basic Information', style: k_subHeadingTextStyle,)),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .27,
                  child: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8.0) , color: k_bgColor,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget> [

                            //Name, Birthday, Gender
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                //colour: k_bgColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const[
                                    Text(
                                        'Name:', style: k_textStyle,
                                    ),
                                    Text(
                                      'Birthday:', style: k_textStyle,
                                    ),
                                    Text(
                                      'Age', style: k_textStyle,
                                    ),
                                    Text(
                                      'Gender:', style: k_textStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                //colour: k_bgColor,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const[
                                    Text(
                                      'Uzumaki Naruto', style: k_valtextStyle,
                                    ),
                                    Text(
                                      'October 10', style: k_valtextStyle,
                                    ),
                                    Text(
                                      '20', style: k_valtextStyle,
                                    ),
                                    Text(
                                      'Male', style: k_valtextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                ),

                const SizedBox(
                  height: 30.0,
                ),

                //Contact Info -> Subheading
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text('Contact Information', style: k_subHeadingTextStyle,)),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * .17,
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8.0) , color: k_bgColor,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget> [

                        //Email, Phone
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            //colour: k_bgColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Email:', style: k_textStyle,
                                ),
                                Text(
                                  'Phone:', style: k_textStyle,
                                ),

                              ],
                            ),
                          ),
                        ),

                        //Values
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            //colour: k_bgColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const[
                                Text(
                                  'UzumakiNaruto10@gmail.com', style: k_valtextStyle,
                                ),
                                Text(
                                  '111-222-333-123', style: k_valtextStyle,
                                ),

                              ],
                            ),
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
