import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/memory_related/create_memory.dart';
import 'package:geotagar/screens/memory_related/post_memory.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  late List<CameraDescription> cameras;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  });

  group('CreateMemory widget test', () {
    testWidgets('Should render camera preview and buttons', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CreateMemory(cameras: cameras),
      ));

      // Verify that camera preview is displayed
      expect(find.byType(CameraPreview), findsOneWidget);

      // Verify that flip camera, take picture and open gallery buttons are displayed
      expect(find.byIcon(Icons.flip_camera_ios), findsOneWidget);
      expect(find.byIcon(Icons.circle_outlined), findsOneWidget);
      expect(find.byIcon(Icons.add_to_photos_rounded), findsOneWidget);
    });

    testWidgets('Should take picture and navigate to AddPost screen',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CreateMemory(cameras: cameras),
      ));

      // Tap on the take picture button
      await tester.tap(find.byIcon(Icons.circle_outlined));
      await tester.pumpAndSettle();

      // Verify that AddPost screen is displayed with the taken picture
      expect(find.byType(AddPost), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('Should open gallery and navigate to AddPost screen',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: CreateMemory(cameras: cameras),
      ));

      // Tap on the open gallery button
      await tester.tap(find.byIcon(Icons.add_to_photos_rounded));
      await tester.pumpAndSettle();

      // Verify that image picker is displayed
      expect(find.byType(ImagePicker), findsOneWidget);

      // Tap on an image in the gallery
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pumpAndSettle();

      // Verify that AddPost screen is displayed with the selected image
      expect(find.byType(AddPost), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });
  });
}
