import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/userAccountScreens/PrivacyAndSecurity/reset_password.dart';

void main() {
  testWidgets('ResetPassword widget test', (WidgetTester tester) async {
    // Build our widget.
    await tester.pumpWidget(const MaterialApp(
      home: ResetPassword(),
    ));

    // Verify that the appbar title is 'RESET PASSWORD'.
    expect(find.text('RESET PASSWORD'), findsNWidgets(2));

    // Verify that there are three text fields for password inputs.
    expect(find.byType(TextField), findsNWidgets(3));

    // Verify that the update password button is present.
    expect(find.text('UPDATE PASSWORD'), findsOneWidget);

    // Tap the update password button and verify that the navigator pops.
    await tester.tap(find.text('UPDATE PASSWORD'));
    await tester.pumpAndSettle();
    expect(find.byType(ResetPassword), findsNothing);
  });
}
