import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/page_tabs.dart';

void main() {
  testWidgets('PageTab displays label and icon', (WidgetTester tester) async {
    // Build the PageTab widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PageTab(
            onPressed: () {},
            pageTabLabel: 'My Page Tab',
          ),
        ),
      ),
    );

    // Verify that the label and icon are displayed
    expect(find.text('My Page Tab'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios), findsOneWidget);
  });
}
