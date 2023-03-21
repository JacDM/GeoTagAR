import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/custom_button.dart';
import 'package:geotagar/utils/tutorialModel.dart';
import 'package:geotagar/screens/userLogIn_Register/log_in.dart';
import 'package:introduction_screen/introduction_screen.dart';



class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const LogIn()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg', //add AR IMAGE
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('images/UpscaledLogoWhite.png', 150),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: RaisedGradientButton(
          gradient: const LinearGradient(
            colors: <Color>[Colors.deepPurple, Colors.purple],
          ),
          onPressed: () => _onIntroEnd(context),
          child: const Center(
            child: Text(
              'Skip App Tour',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      pages: [

        PageViewModel(
          title: "Welcome to GeoTagAR",
          body:
          "Capture, share and relive memories as you go.",
          image: _buildImage('images/earth.png', 275),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Discover",
          body:
              "Create and join groups \n Connect with friends and make new ones",
          image: _buildImage('discover1.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Tag the world",
          body:
          "Share your journeys and experiences as you travel. \n Capture memories and add them to your personal scrapbook or scrapbooks of other users.",
          image: _buildImage('tag.jpg'),
          decoration: pageDecoration,
        ),

        PageViewModel(
          title: "Feed",
          body:
          "Like, Comment and annotate on posts.",
          image: _buildImage('likeComment.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "AR Features",
          body:
          "Place an AR object to host your post and Geotag them to the map. ",
          image: _buildImage('AR1.jpg'),
          decoration: pageDecoration,
        ),

        // PageViewModel(
        //   title: "AR Features",
        //   body:
        //       "Place an AR object to host your post and Geotag them to the map. ",
        //   image: _buildFullscreenImage(),
        //   decoration: pageDecoration.copyWith(
        //     contentMargin: const EdgeInsets.symmetric(horizontal: 16),
        //     fullScreen: true,
        //     bodyFlex: 2,
        //     imageFlex: 3,
        //     safeArea: 100,
        //   ),
        // ),
        PageViewModel(
          title: "Let's bring the world together.",
          body: "Create an Account to get started!",
          image: _buildImage('getStarted.jpg'),
          // footer: ElevatedButton(
          //   onPressed: () {
          //     introKey.currentState?.animateScroll(0);
          //   },
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.lightBlue,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8.0),
          //     ),
          //   ),
          //   child: const Text(
          //     'Get Started!',
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          footer: RaisedGradientButton(
            gradient: const LinearGradient(
              colors: <Color>[Colors.deepPurple, Colors.deepPurpleAccent],
            ),
            onPressed: () => introKey.currentState?.animateScroll(0),
            child: const Center(
              child: Text(
                'GET STARTED!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          decoration: pageDecoration.copyWith(
            bodyFlex: 6,
            imageFlex: 6,
            safeArea: 80,
          ),
        ),
        // PageViewModel(
        //   title: "Create an Account to get Started with!",
        //   bodyWidget: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [
        //       Text("Click on ", style: bodyStyle),
        //       Icon(Icons.edit),
        //       Text(" to edit a post", style: bodyStyle),
        //     ],
        //   ),
        //   decoration: pageDecoration.copyWith(
        //     bodyFlex: 2,
        //     imageFlex: 4,
        //     bodyAlignment: Alignment.bottomCenter,
        //     imageAlignment: Alignment.topCenter,
        //   ),
        //   image: _buildImage('img1.jpg'),
        //   reverse: true,
        // ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
