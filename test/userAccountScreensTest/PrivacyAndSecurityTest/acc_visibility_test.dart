import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/userAccountScreens/PrivacyAndSecurity/acc_visibility.dart';

void main() {
  testWidgets('AccVisibility widget test', (WidgetTester tester) async {
    // Build the AccVisibility widget
    await tester.pumpWidget(MaterialApp(home: AccVisibility()));

    // Verify that the text 'ACCOUNT VISIBILITY' is on the app bar
    expect(find.text('ACCOUNT VISIBILITY'), findsOneWidget);

    // Tap the 'Only My Contacts' option
    await tester.tap(find.text('Only My Contacts'));
    await tester.pump();

    // Verify that the 'Only My Contacts' option is selected
    expect(tester.widget<Text>(find.text('Only My Contacts')).style?.fontWeight,
        FontWeight.bold);
  });
}
