import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/custom_button.dart';

const Color k_subHeadingsColor = Color(0xFF004D40);   //teal[900]
TextStyle k_textstyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.grey[600]);
const Color k_fontTextColour = Colors.black;
final k_gender = ["Male", "Female", "Other"];
String k_selectedGender = "";
Widget k_verSpacing =  const SizedBox(height: 30.0,);


class EditPersonalInfo extends StatefulWidget {
  const EditPersonalInfo({super.key});

  @override
  State<EditPersonalInfo> createState() => _EditPersonalInfoState();
}

class _EditPersonalInfoState extends State<EditPersonalInfo> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('EDIT PERSONAL INFO'),
      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[

              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Column(
                  children: [

                    //Name
                    Align(alignment: Alignment.centerLeft, child: Text('Name', style: k_textstyle)),
                    TextField(
                      textAlign: TextAlign.left,
                      controller: TextEditingController(text: 'Uzumaki Naruto'),
                      style: const TextStyle(fontSize: 20.0, height: 0.75),
                      onSubmitted: null,
                    ),
                    k_verSpacing,


                    //Birthday
                    Align(alignment: Alignment.centerLeft, child: Text('Birthday', style: k_textstyle,)),
                    const SizedBox( height: 7.0,),
                    TextField(
                      textAlign: TextAlign.left,
                      controller: TextEditingController(text: 'October 10'),
                      style: const TextStyle(fontSize: 20.0, height: 0.75),
                      onSubmitted: null,
                    ),
                    k_verSpacing,


                    //Age
                    Align(alignment: Alignment.centerLeft, child: Text('Age', style: k_textstyle,)),
                    const SizedBox( height: 7.0,),
                    TextField(
                      textAlign: TextAlign.left,
                      controller: TextEditingController(text: '20'),
                      style: const TextStyle(fontSize: 20.0, height: 0.75),
                      onSubmitted: null,
                    ),
                    k_verSpacing,

                    //Gender
                    Align(alignment: Alignment.centerLeft, child: Text('Gender', style: k_textstyle,)),
                    const SizedBox( height: 7.0,),
                    DropdownButtonFormField(
                      items: k_gender
                          .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e, style: const TextStyle(fontSize: 20.0),),
                      ))
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          k_selectedGender = val.toString();
                        });
                      },

                      icon: const Icon(Icons.arrow_drop_down),
                      //dropdownColor:
                      style: TextStyle(
                          color: const Color.fromARGB(
                              255, 58, 58, 58)
                              .withOpacity(0.9),
                          //fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Select Gender",
                        filled: true,
                        fillColor: const Color.fromARGB(
                            255, 122, 122, 122)
                            .withOpacity(0.3),
                        hintStyle: TextStyle(
                            fontSize: 18.0,
                            color: const Color.fromARGB(
                                255, 126, 126, 126)
                                .withOpacity(0.9),
                            //fontWeight: FontWeight.bold,
                        ),

                        // contentPadding:
                        // const EdgeInsets.symmetric(
                        //     vertical: 12, horizontal: 20),
                        border: (OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(7.0),
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none),
                        )),
                      ),
                    ),
                    k_verSpacing,

                    //Email
                    Align(alignment: Alignment.centerLeft, child: Text('Email', style: k_textstyle,)),
                    const SizedBox( height: 7.0,),
                    TextField(
                      textAlign: TextAlign.left,
                      controller: TextEditingController(text: 'UzumakiNaruto10@gmail.com'),
                      style: const TextStyle(fontSize: 20.0, height: 0.75),
                      onSubmitted: null,
                    ),
                    k_verSpacing,

                    //Phone
                    Align(alignment: Alignment.centerLeft, child: Text('Phone', style: k_textstyle,)),
                    const SizedBox( height: 7.0,),
                    TextField(
                      textAlign: TextAlign.left,
                      controller: TextEditingController(text: '111-222-333-123'),
                      style: const TextStyle(fontSize: 20.0, height: 0.75),
                      onSubmitted: null,
                    ),
                    k_verSpacing,

                    const SizedBox(
                      height: 20.0,
                    ),


                    RaisedGradientButton(
                      gradient: const LinearGradient(
                        colors: <Color>[Colors.deepPurple, Colors.purple],
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Center(
                        child: Text(
                          'UPDATE',
                          style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),


    );
  }


}
