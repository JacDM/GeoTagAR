import 'package:flutter/material.dart';

const Color k_fontTextColour = Colors.black;
const Color k_submitButtonBgColour = Color(0xFF263238);
const Color k_SwitchIconColour = Color(0xFF263238); //bluegrey[900]

class SCC extends StatefulWidget {
  const SCC({super.key});

  @override
  State<SCC> createState() => _SCC();
}

int counter = 0;

enum SCCSwitchMode { on, off }

SCCSwitchMode switchSCCModeFlag = SCCSwitchMode.off;

class _SCC extends State<SCC> {
  Icon onModeSwitch = const Icon(
    Icons.toggle_on,
    size: 75.0,
    //color: k_SwitchIconColour,
  );
  Icon offModeSwitch = const Icon(
    Icons.toggle_off_outlined,
    size: 75.0,
    //color: k_SwitchIconColour,
  );

  //determine dark/light mode based on
  void switchMode() {
    setState(() {
      switchSCCModeFlag = switchSCCModeFlag == SCCSwitchMode.on
          ? SCCSwitchMode.off
          : SCCSwitchMode.on;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 29, 29),
        toolbarHeight: 90,
        title: const Text('SENSITIVE CONTENT CONTROL'),
      ),

      //backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Content Control',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    GestureDetector(
                      onTap: switchMode,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: switchSCCModeFlag == SCCSwitchMode.on
                            ? onModeSwitch
                            : offModeSwitch,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
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
