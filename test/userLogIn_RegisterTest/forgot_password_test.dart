import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/userLogIn_Register/forgot_password.dart';

void main() {
  testWidgets('ForgotPassword widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MediaQuery(
          data: MediaQueryData(size: Size(400, 800)),
          child: ForgotPassword(),
        ),
      ),
    );

    // Check if all widgets are displayed correctly
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(
        find.text(
            'Enter the email address associated with your account to receive a link to reset your password.'),
        findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    expect(find.text('Reset password'), findsOneWidget);

    // Test the button tap
    await tester.tap(find.text('Reset password'));
    await tester.pumpAndSettle();

    // Check if the email validator works
    final emailField = find.byType(TextFormField);
    await tester.enterText(emailField, 'invalid-email');
    await tester.tap(find.text('Reset password'));
    await tester.pumpAndSettle();
    expect(find.text('Please enter a valid email address.'), findsOneWidget);
  });
}
