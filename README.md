# GeoTagAR
Group 11 F29PD - Personal Development Heriot-Watt Dubai
## General Details
Flutter `3.3.10`

Tools • Dart `2.18.6`• DevTools `2.15.0`

unity Version: `2020.3.12f1`.

flutter_unity_widget: `^2022.2.0` // [Flutter-Unity Widget](https://github.com/juicycleff/flutter-unity-view-widget/tree/master)

NDK Version: `19.0.5232133` //should install automatically when downloading editor in unity hub.

## Easy Installation

The benefit of doin this method is that you wont need to install unity or wait really long build times, hovever this file may not be up to the latest unity build, if you want the latest build follow the instructions located in the full instalation section. 

By default the project will build to the web with no major issues, however if you want to build to android download the folowing library(that is too large for git and git LFS) and place it in the android folder.
>[UnityLibrary](https://heriotwatt.sharepoint.com/:f:/s/F29SO-GroupProject/Eqc-Qf1n3TVBhp2xc_hIvJMBO1kBaR0h30UGmiGT9IXkZQ?e=6sXSPZ)

NOTE: the build process can take anywhere from 5-15 minuites with the cpu pinned at 100% after an export from unity, ive never run into a crash however it is possible saving your work is advised if not using auto save, subsequent runs will be MUCH faster .

1.Type `flutter run` in the console to initiiate the build

## Full Instalation

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
10. In `android/unityLibrary/build.gradle` comment out the following lines to speed up the build process significantly.
```
    //commandLineArgs.add("--enable-debugger")
    //commandLineArgs.add("--profiler-report")
    //commandLineArgs.add("--profiler-output-file=" + workingDir + "/build/il2cpp_"+ abi + "_" + configuration + "/il2cpp_conv.traceevents")
    //commandLineArgs.add("--print-command-line")
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
