import 'package:flutter/material.dart';

const Color k_fontTextColour = Colors.black;
const Color k_submitButtonBgColour = Color(0xFF263238);
const Color k_SwitchIconColour = Color(0xFF263238); //bluegrey[900]

class TNC extends StatefulWidget {  //new class for terms and conditions
  const TNC({super.key});

  @override
  State<TNC> createState() => _TNC();
}
class _TNC extends State<TNC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('TERMS AND CONDITIONS'),
      ),

      //backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children:   <Widget>[


                const SizedBox(height: 50.0,),
                Text(
                  'The following Terms and Conditions apply to the Mint Solutions website and all its products. By using the site, you agree to the terms and conditions. If you do not agree, do not use the site.'

'Content'
'\n All text, pictures, graphics, user and visual interfaces, logos, artwork, and code, including the design, structure, and framework is controlled, made, or licensed by or to Mint Solutions, and is therefore protected by trade dress, copyright, patent, and trademark laws, and multiple other intellectual property rights and unfair competition laws. No part of the website can be copied, republished, posted, or distributed in any way or form to another computer, server, website, or publications for commercial uses without consent from Mint Solutions.'
'\n \n You may use the information affiliated to Mint Solutions under the following conditions –'
'\n (1)    There is no removal of proprietary notice language in the copy or excerpts.'
'\n (2)    The information is only used for personal, academic purposes, and non-commercial purposes; any commercial use is not allowed.'
'\n (3)    The information should not be modified.'

'\n  \n Use of the Website'
'\n (1)    You may not obtain any materials, documentation, or information through means not made available on purpose through the website.'
'\n (2)    You may not attempt to gain unauthorized access to features or portions of the website; hacking, password “mining” or any other illegal and illegitimate means are strictly prohibited.'
'\n (3)    You may not try to test the vulnerability of the website or breach the security and authentication measures on the website.'
'\n (4)    You may not use any softwares or devices to attempt to interfere with the proper working or usage of the website.'
'\n (5)    You may not pretend to be another individual; phishing or identity theft is strictly prohibited.'
'\n (6)    You may not share or perform any illegal activities which infringe the rights of the website and other users.'
'\n \n Privacy and Security'
'\n (1)    You are responsible for all activity occurring under your account.'
'\n (2)    You must notify in case of breach of security or unauthorized use of your account and password.'
'\n (3)    You are liable for any payments or losses due to someone else using your account, a result of failing to keep your credentials confidential.'
'\n \n Disclaimers'
'\n Mint Solutions does not guarantee that the website or any of its features will be completely error-free and uninterrupted. We do not promise that any of the documents and data downloaded by you from the browser do not contain any viruses. You assume and accept the responsibility for your use of the website and its features. In case of dissatisfaction, kindly stop using the website and its products.'

'\n Mint Solutions has the right to do any of the following at any time –'
'\n (1)    Modification, suspension, or termination of or access to the website for any reason we seem fit.'
'\n (2)    Modification, addition, suspension, or termination of any of the previously described terms and conditions.'
'\n (3)    Interruption or temporary suspension of the website for maintenance, updating, or any other required changes.'
'\n \n Violation of Terms and Conditions'
'\n In case of an investigation or complaint against you regarding your foul of the website to harm any other individual, information provided by you will be disclosed to take legal action.'
'\n The information provided on this website is subject to change without notice.',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey[700]
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

  

