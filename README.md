# GeoTagAR
Group 11 F29PD - Personal Development Heriot-Watt Dubai
## General Details
Flutter `3.3.10`

Tools • Dart `2.18.6`• DevTools `2.15.0`

unity Version: `2022.2.1f1`.

flutter_unity_widget: `^2022.2.0` //https://github.com/juicycleff/flutter-unity-view-widget/tree/master.

NDK Version: `r23b` //should install automatically when downloading editor in unity hub, if not then lookup 'r23b unity'.

## Instalation

if you want to launch the project and build for a specific platrorm:
1. install then open unity hub, navigate to the installs tab and click install 
2. open the unity project located in `/GeoTagAR/unity/ARProject`, do not just open the main GeoTagAR repo as this wont work.
3. if located correctly then a prompt should apear prompting the installation of editor version `2022.2.1f1` 
> (DO NOT UNDER ANY CIRCUMSTANCES CHANGE THE UNITY EDITOR VERSION) 

after which you will be prompted to install modlues, download the following:-
> `ANDROID Build support`
> `IOS Build support`
> `LINUX Build support (IL2CPP)`
> `WINDOWS Build support(IL2CPP)`
4. The installation/opening process will take alot of time after which verify that in the title bar there is a flutter option
5. Go to File > Build Settings > Android(or IOS) and click switch button
6. Then click player settings on the bottom left then proceed to the android tab by pressing the android icon
7. Change the following in the configuration section:-
> Scripting Backend, change to `IL2CPP`

> IL2CPP Code Generaation `Faster (smaller) builds`

> C++ Compiler Configuration `debug`

8. Now on the title bar select the flutter section and click export <chosen platform> debug
> e.g. `Export Android Debug`
9. The unityLibrary folder will get deleted and remade in `<chosen platform>/unityLibrary`
10. In `android/unityLibrary/build.gradle` comment out the following lines to speed up the build process.
```
    //commandLineArgs.add("--enable-debugger")
    //commandLineArgs.add("--profiler-report")
    //commandLineArgs.add("--profiler-output-file=" + workingDir + "/build/il2cpp_"+ abi + "_" + configuration + "/il2cpp_conv.traceevents")
```
11. For now the unity ar widget does not work so in main.dart change home: UnityAR(); if not already something else(working on a fix)
12. NOTE: the build process can take anywhere from 5-15 minuites with the cpu pinned at 100% after an export from unity, ive never run into a crash however it is possible saving your work is advised if not using auto save, subsequent runs will be MUCH faster .
13. Type `flutter run` in the console to initiiate the build



<details>
 <summary>:information_source: <b>Default Flutter Getting Started Page</b></summary>
  
  This project is a starting point for a Flutter application.

  A few resources to get you started if this is your first Flutter project:

  - [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
  - [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

  For help getting started with Flutter development, view the
  [online documentation](https://docs.flutter.dev/), which offers tutorials,
  samples, guidance on mobile development, and a full API reference.
</details>
