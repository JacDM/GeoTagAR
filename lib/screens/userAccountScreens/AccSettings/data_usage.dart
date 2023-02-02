import 'package:flutter/material.dart';

const Color k_fontTextColour = Colors.black;
const Color k_submitButtonBgColour = Colors.teal;
const Color k_SwitchIconColour =  Color(0xFF263238);  //bluegrey[900]

class DataUsage extends StatefulWidget {
  const DataUsage({super.key});

  @override
  State<DataUsage> createState() => _DataUsage();
}

int counter = 0;
enum DataUsageSwitchMode{
  on,
  off
}
DataUsageSwitchMode switchSCCModeFlag = DataUsageSwitchMode.off;

class _DataUsage extends State<DataUsage> {

  Icon onModeSwitch = const Icon(
    Icons.toggle_on,
    size: 75.0,
    color: k_SwitchIconColour,
  );
  Icon offModeSwitch = const Icon(
    Icons.toggle_off_outlined,
    size: 75.0,
    color: k_SwitchIconColour,
  );


  //determine dark/light mode based on
  void switchMode (){
    setState(() {
      counter++;
      switchSCCModeFlag = counter%2 == 0 ? DataUsageSwitchMode.on : DataUsageSwitchMode.off;
    });

  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('DATA USAGE'),
      ),

      //backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children:   <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Data Usage', style: TextStyle(fontSize: 25.0),),
                    GestureDetector(
                      onTap: switchMode,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: switchSCCModeFlag == DataUsageSwitchMode.on ? onModeSwitch : offModeSwitch,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 50.0,),
                Text(
                  'Blocks any NSFW content. '
                      'You may see fewer photos, videos and content tht may be upsetting or offensive.',
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
                ),




              ],
            ),
          ),
        ),
      ),


    );
  }


}