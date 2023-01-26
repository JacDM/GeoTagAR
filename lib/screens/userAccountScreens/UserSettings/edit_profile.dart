import 'package:flutter/material.dart';
import '../reusableWidgets/custom_button.dart';

const Color k_subHeadingsColor = Color(0xFF004D40);   //teal[900]
TextStyle k_textstyle = const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,);
const Color k_fontTextColour = Colors.black;
const k_username = '@DATTEBAYOOO';
const k_name = 'Uzumaki Naruto';
const k_bio = 'Naruto Uzumaki, a young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village.';

Widget k_verSpacing =  const SizedBox(height: 30.0,);


class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('EDIT PROFILE'),
      ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[

              //Edit profile and bg pic
              Stack(
                clipBehavior: Clip.none,
                //alignment: Alignment.center,
                children:  [

                  //Background Picture
                  const Image(
                    image: NetworkImage(
                        'https://images.squarespace-cdn.com/content/v1/5fe4caeadae61a2f19719512/1612119994906-GFOPIE3ZKXB79DS6A612/Naruto43.jpg'),
                  ),

                  //Edit
                  Positioned(
                    top: 10.0,
                    right: 10.0,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.0525,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.edit ,
                        size: MediaQuery.of(context).size.width * 0.08,
                        color: k_subHeadingsColor,
                      ),
                    ),

                  ),

                  //Profile Picture
                  Positioned(
                    bottom: -55.0,
                    right: MediaQuery.of(context).size.width * 0.35,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children:  [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.14,
                          backgroundImage: NetworkImage('https://static.wikia.nocookie.net/naruto/images/d/dc/Naruto%27s_Sage_Mode.png/revision/latest/scale-to-width-down/1920?cb=20150124180545'),
                        ),

                        Positioned(
                          bottom: -9.0,
                          left: MediaQuery.of(context).size.width * 0.20,

                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.0425,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.edit ,
                              size: MediaQuery.of(context).size.width * 0.07,
                              color: k_subHeadingsColor,
                            ),
                          ),
                        ),
                      ],

                    ),
                  ),
                ],
              ),

              k_verSpacing,
              k_verSpacing,



              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    //Username
                    Text('USERNAME', style: k_textstyle),
                    TextField(
                      textAlign: TextAlign.left,
                      controller: TextEditingController(text: k_username),
                      style: const TextStyle(fontSize: 20.0, height: 0.75),
                      onSubmitted: null,
                    ),
                    k_verSpacing,


                    //Name
                    Text('NAME', style: k_textstyle),
                    TextField(
                      textAlign: TextAlign.left,
                      controller: TextEditingController(text: k_name),
                      style: const TextStyle(fontSize: 20.0, height: 0.75),
                      onSubmitted: null,
                    ),
                    k_verSpacing,

                    //Bio
                    //Text Box
                    Text('BIO', style: k_textstyle),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      style: const TextStyle(fontSize: 20.0,),
                      maxLines: 6,
                      textAlign: TextAlign.left,
                      maxLength: 500,
                      controller: TextEditingController(text: k_bio),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        //labelText: 'Type here...',
                      ),
                    ),

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
                          'SUBMIT',
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
