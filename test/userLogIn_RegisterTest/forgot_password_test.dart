import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/userLogIn_Register/forgot_password.dart';

// Issues with call Firebase.initializeApp()
void main() {
  group('ForgotPassword', () {
    Widget createWidgetForTesting({required Widget child}) {
      return MaterialApp(
        home: child,
      );
    }

    testWidgets('Should show error message for empty email field',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(createWidgetForTesting(child: ForgotPassword()));

      // Enter an empty email address
      await tester.enterText(find.byType(TextField), '');

      // Tap the reset password button
      await tester.tap(find.text('Reset password'));

      // Verify that an error message is displayed
      expect(find.text('Email address cannot be empty.'), findsOneWidget);
    });

    testWidgets('Should show error message for invalid email address',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(createWidgetForTesting(child: ForgotPassword()));

      // Enter an invalid email address
      await tester.enterText(find.byType(TextField), 'example.com');

      // Tap the reset password button
      await tester.tap(find.text('Reset password'));

      // Verify that an error message is displayed
      expect(find.text('Please enter a valid email address.'), findsOneWidget);
    });

    testWidgets('Should show "Valid email" message for valid email address',
        (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(createWidgetForTesting(child: ForgotPassword()));

      // Enter a valid email address
      await tester.enterText(find.byType(TextField), 'example@mail.com');

      // Tap the reset password button
      await tester.tap(find.text('Reset password'));

      // Verify that the "Valid email" message is printed to the console
      expect(tester.getSemantics(find.byType(Row)),
          matchesSemantics(label: 'Valid email'));
    });
  });
}
