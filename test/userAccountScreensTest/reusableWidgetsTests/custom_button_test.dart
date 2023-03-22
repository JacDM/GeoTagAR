import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/custom_button.dart';

void main() {
  testWidgets(
      'RaisedGradientButton displays child widget and gradient background',
      (WidgetTester tester) async {
    final buttonChild = Text('Button');
    final gradient = LinearGradient(
      colors: [Colors.blue, Colors.green],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    bool isPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RaisedGradientButton(
            child: buttonChild,
            gradient: gradient,
            onPressed: () {
              isPressed = true;
            },
          ),
        ),
      ),
    );

    expect(find.byWidget(buttonChild), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
  });
}
