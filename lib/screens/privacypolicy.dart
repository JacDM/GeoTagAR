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

'We may collect, store, and use the following kinds of personal information about individuals who decide to use our website and applications:'
'-    First name and last name'
'-    Age'
'-    Gender'
'-    Age'
'-    Date of birth'
'-    Phone number'
'-    Email address'
'-    Location information'
 
'Storage of the collected information:'
'-    All personal information provided by you will be kept confidential in a secure filing cabinet or password-protected computer directories.'
'Usage of the collected information:'
'-    To provide with the services you request'
'-    To administer our site - troubleshooting' 
'-    For statistical purposes'
'-    For security'
'-    To improve our site' 
'-    To provide information and services in the most effective manner'

'Disclosure or sharing of collected information:'
'-    We do not share, rent, or sell personal information provided by the users to other people including non-affiliated companies.' 
'-    Efforts will be made to not disclose any information provided or collected unless requested by the law or other rules and regulations.'
'-    On receival of information and personal data, strict measures, procedures, and features are used to enable security to prevent unauthorized access and sharing.'

'Access to your personal data:'
'-    You have the right to request the personal information and data you provide us under the “Subject Access Right” which can be exercised in accordance with data protection laws and regulations.'
'-    Any access request must be made in an email to (company email) which shall be processed and provided within statutory time frames.'
'-     In case of a complaint, you have against us regarding our usage of your provided information, you have the right to complain to the Information Commissioner’s Office (ICO).'

'Changes to the privacy policy:'
'-    Any changes made to our privacy policy in the future shall be updated on our website (and sent to you through our company email).'
'-    We encourage you to check frequently for any changes or updates.'

'Contact information:'
'-    Any questions, comments, and requests regarding our privacy policy are welcome. Your suggestions are appreciated.' 
'-    You can contact us at mintsolns@gmail.com',
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

  