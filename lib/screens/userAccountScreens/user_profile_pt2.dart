import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/bottom_screen_user_profile.dart';
import 'package:geotagar/screens/userAccountScreens/post_page.dart';

const k_username = '@uchiha_forever';
const k_bgImage = 'https://wallpapers.com/images/featured/9u4dx0obug15i974.jpg';
const k_profilePic =
    'https://i.pinimg.com/736x/74/e7/84/74e7847db64c38d02ff0511d5b831d9e.jpg';

//THIS IS THE PAGE WHEN WE VIEW SOMEONE ELSE'S PROFILE

class UserProfilePt2 extends StatefulWidget {
  const UserProfilePt2({super.key});

  @override
  State<UserProfilePt2> createState() => _UserProfilePt2State();
}

class _UserProfilePt2State extends State<UserProfilePt2> {
  bool pressedMemoriesTab = true;
  bool pressedTagsTab = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('USER PROFILE PAGE PT2'),
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //header - profile pic, background pic and settings button
              Stack(
                clipBehavior: Clip.none,
                //alignment: Alignment.center,
                children: [
                  //Background Picture
                  Container(
                    height: MediaQuery.of(context).size.width * 0.53,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white12,
                          width: 3.0,
                        ),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(k_bgImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  //3 dots icon
                  Positioned(
                    top: 10.0,
                    right: 10.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      //22.0
                      radius: MediaQuery.of(context).size.width * 0.055,
                      child: FloatingActionButton(
                        onPressed: () {
                          bottomScreenUserProfile(context);
                        },
                        tooltip: 'More Options',
                        child: Icon(
                          Icons.more_horiz,
                          //35.0
                          size: MediaQuery.of(context).size.width * 0.07,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  //Profile Picture
                  Positioned(
                    bottom: -55.0,
                    right: MediaQuery.of(context).size.width * 0.35,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.15,
                      backgroundColor: Colors.white38,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width * 0.14,
                        backgroundImage: const NetworkImage(k_profilePic),
                      ),
                    ),
                  ),
                ],
              ),

              //Spacing
              const SizedBox(
                height: 60.0,
              ),

              //Name
              const Text(
                'Uchiha Sasuke',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Lobster',
                ),
                textAlign: TextAlign.center,
              ),

              //Username
              const Text(
                '@uchiha_forever',
                style: TextStyle(
                  fontSize: 17.0,
                  //fontFamily: 'FiraCode',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              //Bio/description (List)
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: ListTile(
                  title: Text(
                    ' My name is Sasuke Uchiha. I hate a lot of things and I do not particularly like anything.',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Nunito',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              //Moments, Followers, Following (Row)
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Text(
                      '150',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '10K',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '20',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Text(
                      'Moments',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'OpenSans',
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'OpenSans',
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'OpenSans',
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              //Follow, Message
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          //border: Border.all(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(
                          10.0,
                        ),
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              fontFamily: 'OpenSans',
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          //border: Border.all(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        padding: const EdgeInsets.all(
                          10.0,
                        ),
                        child: const Text(
                          'Message',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              fontFamily: 'OpenSans',
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //SizedBox(height: 10.0,),

              const SizedBox(
                width: 100.0,
                child: Divider(
                  color: Colors.black,
                  height: 20.0,
                  thickness: 4.0,
                ),
              ),

              //Scrapbook, Tags (Row)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.blueGrey,
                            width: pressedMemoriesTab ? 3 : 1,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          pressedMemoriesTab = true;
                          pressedTagsTab = false;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.image_outlined,
                            size: 40.0,
                            color: Colors.teal[900],
                          ),
                          Text(
                            'Memories and Scrapbooks',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.teal[900],
                              fontFamily: 'OpenSans',

                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(10.0),),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Colors.blueGrey,
                            width: pressedTagsTab ? 3 : 1,
                            style: BorderStyle.solid,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          pressedMemoriesTab = false;
                          pressedTagsTab = true;
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.people_alt_outlined,
                            size: 35.0,
                            color: Colors.teal[900],
                          ),
                          Text(
                            'Tags',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.teal[900],
                              fontFamily: 'OpenSans',
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            pressedMemoriesTab = false;
                            pressedTagsTab = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: const [
                              Icon(
                                Icons.image_outlined,
                                size: 40.0,
                                //color: Colors.black,
                              ),
                              Text('Tags',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  //color: Colors.teal[900],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Pictures
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Post();
                      })),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        //: Colors.teal[100],
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          ),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://www.numerama.com/wp-content/uploads/2022/08/image5-min.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      //color: Colors.teal[200],
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://cdn-images.win.gg/resize/w/1000/format/webp/type/progressive/fit/cover/path/wp/uploads/2022/06/naruto-and-sasuke.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      //color: Colors.teal[300],
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://preview.redd.it/k5l57lnr6e161.jpg?width=640&crop=smart&auto=webp&s=162c6749eff2d7e482f038cc5294ca5ffbee28d5'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      //color: Colors.teal[400],
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://i0.wp.com/codigoespagueti.com/wp-content/uploads/2020/06/Boruto-Naruto-Jiraiya.jpg?fit=1200%2C720&quality=80&ssl=1'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      //color: Colors.teal[500],
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://images7.alphacoders.com/705/thumb-1920-705566.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      //color: Colors.teal[600],
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://static.wikia.nocookie.net/shipping/images/c/c4/NaruSai_Shippuden810.png/revision/latest/scale-to-width-down/250?cb=20211008142459'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      //color: Colors.teal[600],
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://qph.cf2.quoracdn.net/main-qimg-261fe1a660066ed161ff018171531c3c-lq'),
                          fit: BoxFit.cover,
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
