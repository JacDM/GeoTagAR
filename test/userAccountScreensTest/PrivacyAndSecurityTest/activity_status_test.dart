import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/userAccountScreens/PrivacyAndSecurity/activity_status.dart';

void main() {
  group('ActivityStatus Widget Test', () {
    testWidgets('ActivityStatus widget test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(),
            child: ActivityStatus(),
          ),
        ),
      );

      // Verify that all options are initially deselected
      expect(find.text('Online'), findsOneWidget);
      expect(
          tester.widget<Text>(find.text('Online')).style, equals(k_textStyle));
      expect(find.text('Appear Away'), findsOneWidget);
      expect(tester.widget<Text>(find.text('Appear Away')).style,
          equals(k_textStyle));
      expect(find.text('Appear Offline'), findsOneWidget);
      expect(tester.widget<Text>(find.text('Appear Offline')).style,
          equals(k_textStyle));
    });

    testWidgets('Test if selecting an option updates its style',
        (WidgetTester tester) async {
      // Build the widget inside a MaterialApp widget
      await tester.pumpWidget(MaterialApp(home: ActivityStatus()));

      // Tap the 'Appear Away' option
      await tester.tap(find.text('Appear Away'));
      await tester.pump();

      // Verify that the 'Appear Away' option is now selected
      expect(tester.widget<Text>(find.text('Appear Away')).style,
          equals(k_selectedtextStyle));
    });
  });
}
