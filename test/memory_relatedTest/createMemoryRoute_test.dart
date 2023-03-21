import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/memory_related/createMemoryRoute.dart';
import 'package:geotagar/screens/memory_related/create_memory.dart';

void main() {
  group('CMRoute widget', () {
    late List<CameraDescription> cameras;

    setUp(() async {
      cameras = await availableCameras();
    });

    testWidgets('renders CreateMemory widget', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: CMRoute()));

      // Wait for the Future to complete and the CreateMemory widget to be built
      await tester.pumpAndSettle();

      // Find the CreateMemory widget in the tree
      final createMemoryWidget =
          find.byType(CreateMemory).evaluate().first.widget as CreateMemory;

      // Expect that the widget has been created with the expected list of cameras
      expect(createMemoryWidget.cameras, cameras);
    });
  });
}
