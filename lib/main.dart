import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/firebase_options.dart';
import 'package:geotagar/screens/memory_related/createMemoryRoute.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geotagar/screens/userAccountScreens/post_page.dart';
import 'package:geotagar/screens/userLogIn_Register/log_in.dart';
import 'package:geotagar/screens/userLogIn_Register/register.dart';
import 'package:geotagar/screens/homepage.dart';
import 'package:geotagar/screens/unityAR.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile_pt2.dart';
import 'package:geotagar/screens/globe.dart';
import 'package:geotagar/screens/unity_flutter_communication.dart';
import 'package:geotagar/screens/map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //removed 'const' keyword from return const MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Theme set for User Account Screens
      //LIGHT THEME
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.black, primary: Colors.black),
        appBarTheme: AppBarTheme(
          toolbarTextStyle:
              const TextTheme(bodyText2: TextStyle(fontFamily: 'Nunito'))
                  .bodyText2,
          titleTextStyle:
              const TextTheme(bodyText2: TextStyle(fontFamily: 'Nunito'))
                  .headline6,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),

//DARK THEME

      // theme: ThemeData.dark().copyWith(
      //   colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black, primary: Colors.white),
      //   appBarTheme: AppBarTheme(
      //     toolbarTextStyle: const TextTheme(bodyText2: TextStyle(fontFamily: 'Nunito')).bodyText2,
      //     //titleTextStyle: const TextTheme(bodyText2: TextStyle(fontFamily: 'Nunito')).headline6,
      //     centerTitle: true,
      //     backgroundColor: Colors.black,
      //     foregroundColor: Colors.white,
      //
      //   ),
      // ),
      
      home: HomePage(),
      //home: UserProfile(),
      //home: Map(),

      //-----------------------------------------------------------------------
      /// home: StreamBuilder(
      ///   stream: FirebaseAuth.instance.authStateChanges(),
      ///   builder: (context, snapshot) {

      ///     //if a connection is made
      ///     if(snapshot.connectionState == ConnectionState.active) {
      ///       if(snapshot.hasData){
      ///         return const ResponsiveLayout(
      ///           mobileScreenLayout: MobileScreenLayout(),
      ///           webScreenLayout: WebScreenLayout(),
      ///         )
      ///       }
      ///       else if(snapshot.hasError) {
      ///         return Center(
      ///           child: Text('${snapshot.error}'),
      ///         );
      ///       }
      ///     }

      ///     //if a connection isn't made
      ///     id(snapshot.connectionState == ConnectionState.waiting){
      ///       return const Center(
      ///         child: CircularProgressIndicator(
      ///           color: primaryColor,
      ///         )
      ///       );
      ///     }

      ///     return const LogIn();

      ///   }
      /// ),

      //-----------------------------------------------------------------------
    );
  }
}


// wrap Material app with MultiProvider(
//   providers: [
//     ChangeNotifierProvider(create: (_) => UserProvider(), ),
//   ],
// )