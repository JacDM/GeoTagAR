import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/userAccountScreens/AccSettings/data_usage.dart';

void main() {
  testWidgets('Switch counter is incremented correctly',
      (WidgetTester tester) async {
    // Wrap the widget with a MaterialApp
    await tester.pumpWidget(MaterialApp(home: DataUsage()));

    // Initial switch mode is off, so the counter should be 0
    expect(counter, 0);

    // Tap the switch to turn it on
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    // Counter should now be 1
    expect(counter, 1);

    // Tap the switch again to turn it off
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    // Counter should now be 2
    expect(counter, 2);
  });
}
