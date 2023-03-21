import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/discoverPages/create_group.dart';
import 'package:geotagar/utils/text_Field.dart';

void main() {
  testWidgets('CreateGroupPage should display all required fields',
      (WidgetTester tester) async {
    // Build the CreateGroupPage widget
    await tester.pumpWidget(
      MaterialApp(
        home: CreateGroupPage(),
      ),
    );

    // Verify that the Group Name and Group Description text fields are displayed
    expect(
        find.widgetWithText(ReusableTextField, 'Group Name'), findsOneWidget);
    expect(find.widgetWithText(ReusableTextField, 'Group Description'),
        findsOneWidget);

    // Verify that the Group Picture and Group Banner image pickers are displayed
    expect(find.text('Group Picture:'), findsOneWidget);
    expect(find.text('Group Banner:'), findsOneWidget);
    expect(find.byIcon(Icons.camera_alt), findsNWidgets(2));

    // Verify that the Add Moderator by Username text field and Moderators list are displayed
    expect(find.widgetWithText(ReusableTextField, 'Add Moderator by Username'),
        findsOneWidget);
    expect(find.text('Moderators:'), findsOneWidget);
    expect(find.byType(Chip), findsNothing);

    // Verify that the Create Group button is displayed in the app bar
    expect(find.byIcon(Icons.check), findsOneWidget);
  });
}
