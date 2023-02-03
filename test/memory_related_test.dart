import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camera/camera.dart';
import 'package:geotagar/screens/memory_related/create_memory.dart';

// void main() {
//  group('CreateMemory widget tests', () {
//    testWidgets('CreateMemory widget should build without crashing',
//        (WidgetTester tester) async {
//      // Given a camera
//      final List<CameraDescription> cameras = await availableCameras();

//      // When the CreateMemory widget is built
//      await tester.pumpWidget(MaterialApp(
//        home: CreateMemory(cameras: cameras),
//      ));

//      // Then it should build without crashing
//      expect(find.byType(CreateMemory), findsOneWidget);
//    });

//    testWidgets('CreateMemory camera should work', (WidgetTester tester) async {
//      // Given a camera
//      final List<CameraDescription> cameras = await availableCameras();

//      // When the CreateMemory widget is built
//      await tester.pumpWidget(MaterialApp(
//        home: CreateMemory(cameras: cameras),
//      ));

//      // Then the camera should work and show the preview
//      expect(find.byType(CameraPreview), findsOneWidget);
//    });
//  });
//}
