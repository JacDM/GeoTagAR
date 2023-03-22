import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/memory_related/createMemoryRoute.dart';
import 'package:geotagar/screens/memory_related/create_memory.dart';

// Issues with the camera implementation
void main() {
  group('CMRoute widget', () {
    late List<CameraDescription> cameras;

    setUpAll(() async {
      cameras = await availableCameras();
    });

    testWidgets('Widget should show a text when no data is available',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CMRoute(),
      ));

      expect(find.text('error has occured'), findsOneWidget);
    });

    testWidgets('Widget should show CreateMemory when data is available',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CMRoute(),
      ));

      await tester.runAsync(() async {
        await Future.delayed(Duration(seconds: 2));
        expect(find.byType(CreateMemory), findsOneWidget);
      });
    });
  });
}
