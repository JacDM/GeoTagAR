import 'package:flutter/material.dart';

const Color k_fontTextColour = Colors.black;
const Color k_submitButtonBgColour = Color(0xFF263238);
const Color k_SwitchIconColour = Color(0xFF263238); //bluegrey[900]

class PP extends StatefulWidget {
  const PP({super.key});

  @override
  State<PP> createState() => _PP();
}
class _PP extends State<PP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('PRIVACY POLICY'),
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
                  'Here, at Mint Solutions, we are committed to protecting the privacy of all visitors and users. Our privacy policy states how we process or use any of the personal data provided by you and keep it secure at the same time.'

'\n \n We may collect, store, and use the following kinds of personal information about individuals who decide to use our website and applications:'
'\n -    First name and last name'
'\n -    Age'
'\n -    Gender'
'\n -    Age'
'\n -    Date of birth'
'\n -    Phone number'
'\n -    Email address'
'\n -    Location information'
 
'\n \n Storage of the collected information:'
'\n -    All personal information provided by you will be kept confidential in a secure filing cabinet or password-protected computer directories.'
'\n \n Usage of the collected information:'
'\n -    To provide with the services you request'
'\n -    To administer our site - troubleshooting'
'\n -    For statistical purposes'
'\n -    For security'
'\n -    To improve our site'
'\n -    To provide information and services in the most effective manner'

'\n \n Disclosure or sharing of collected information:'
'\n -    We do not share, rent, or sell personal information provided by the users to other people including non-affiliated companies.'
'\n -    Efforts will be made to not disclose any information provided or collected unless requested by the law or other rules and regulations.'
'\n -    On receival of information and personal data, strict measures, procedures, and features are used to enable security to prevent unauthorized access and sharing.'

'\n \n Access to your personal data:'
'\n -    You have the right to request the personal information and data you provide us under the “Subject Access Right” which can be exercised in accordance with data protection laws and regulations.'
'\n -    Any access request must be made in an email to (company email) which shall be processed and provided within statutory time frames.'
'\n -     In case of a complaint, you have against us regarding our usage of your provided information, you have the right to complain to the Information Commissioner’s Office (ICO).'

'\n \n Changes to the privacy policy:'
'\n -    Any changes made to our privacy policy in the future shall be updated on our website (and sent to you through our company email).'
'\n -    We encourage you to check frequently for any changes or updates.'

'\n \n Contact information:'
'\n -    Any questions, comments, and requests regarding our privacy policy are welcome. Your suggestions are appreciated.'
'\n -    You can contact us at mintsolns@gmail.com',
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

  