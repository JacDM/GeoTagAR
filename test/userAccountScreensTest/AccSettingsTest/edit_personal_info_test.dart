import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/userAccountScreens/AccSettings/edit_personal_info.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/custom_button.dart';

void main() {
  group('EditPersonalInfo', () {
    testWidgets('Renders all input fields and buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: EditPersonalInfo(),
      ));

      expect(find.text('EDIT PERSONAL INFO'), findsOneWidget);
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Birthday'), findsOneWidget);
      expect(find.text('Age'), findsOneWidget);
      expect(find.text('Gender'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Phone'), findsOneWidget);
      expect(find.text('UPDATE'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(5));
      // expect(find.byType(DropdownButtonFormField), findsOneWidget);
      expect(find.byType(RaisedGradientButton), findsOneWidget);
    });
  });
}
