import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/icon_data.dart';

void main() {
  testWidgets('WidgetIconData displays the correct icon and text',
      (WidgetTester tester) async {
    final icon = Icons.ac_unit;
    final iconText = 'Air Conditioner';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WidgetIconData(
            icon: icon,
            iconText: iconText,
          ),
        ),
      ),
    );

    expect(find.byIcon(icon), findsOneWidget);
    expect(find.text(iconText), findsOneWidget);
  });
}
