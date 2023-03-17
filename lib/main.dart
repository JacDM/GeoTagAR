import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/firebase_options.dart';
import 'package:geotagar/layout/layout_select.dart';
import 'package:geotagar/layout/mobile_layout.dart';
import 'package:geotagar/layout/web_layout.dart';
import 'package:geotagar/screens/discoverPages/discover.dart';
import 'package:geotagar/screens/userAccountScreens/UserSettings/user_settings.dart';
import 'package:geotagar/screens/userLogIn_Register/log_in.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'package:geotagar/screens/memory_related/createMemoryRoute.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geotagar/screens/userAccountScreens/post_page.dart';
import 'package:geotagar/screens/userLogIn_Register/log_in.dart';
import 'package:geotagar/screens/userLogIn_Register/register.dart';
import 'package:geotagar/screens/homepage.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile.dart';
import 'package:geotagar/screens/userAccountScreens/user_profile_pt2.dart';
import 'package:geotagar/screens/globe.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,

          //Theme set for User Account Screens
          theme: ThemeData(
            textTheme:
                const TextTheme(bodyText2: TextStyle(fontFamily: 'Nunito')),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              centerTitle: false,
              foregroundColor: Colors.white,
              backgroundColor: Colors.white,
              //shadowColor: Colors.teal[900],
              toolbarHeight: 60.0,
              elevation: 0,
            ),
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
          ),
          home: const LogIn(),
          routes: <String, WidgetBuilder>{
            '/home': (BuildContext context) => const LayoutSelect(
                mobileLayout: MobileScreenLayout(),
                webLayout: WebScreenLayout()),
            '/userProfile': (BuildContext context) =>
                UserProfile(uid: FirebaseAuth.instance.currentUser!.uid),
            '/settings': (BuildContext context) =>
                SettingsPage(uid: FirebaseAuth.instance.currentUser!.uid),
            //'/userProfilePt2': (BuildContext context) => UserProfilePt2(),
            //'/createMemoryRoute': (BuildContext context) => CreateMemoryRoute(),
            '/discover': (BuildContext context) => const DiscoverPage(),
            //'/postPage': (BuildContext context) => PostPage(),
          }
          //home: UserProfile(),
          //home: UserProfilePt2(),

          //-----------------------------------------------------------------------
          // home: StreamBuilder(
          //     stream: FirebaseAuth.instance.authStateChanges(),
          //     builder: (context, snapshot) {
          //       //if a connection is made
          //       if (snapshot.connectionState == ConnectionState.active) {
          //         if (snapshot.hasData) {
          //           return const HomePage();
          //         } else if (snapshot.hasError) {
          //           return Center(
          //             child: Text('${snapshot.error}'),
          //           );
          //         }
          //       }

          //       //if a connection isn't made
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(
          //             child: CircularProgressIndicator(
          //           color: Colors.teal,
          //         ));
          //       }

          //       return const LogIn();
          //     }),

          //-----------------------------------------------------------------------
          ),
    );
  }
}


// wrap Material app with MultiProvider(
//   providers: [
//     ChangeNotifierProvider(create: (_) => UserProvider(), ),
//   ],
// )