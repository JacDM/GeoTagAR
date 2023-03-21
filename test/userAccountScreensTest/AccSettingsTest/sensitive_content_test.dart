import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/userAccountScreens/AccSettings/sensitive_content.dart';

void main() {
  testWidgets('SCC widget should contain the correct text',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SCC(),
    ));

    expect(find.text('SENSITIVE CONTENT CONTROL'), findsOneWidget);
    expect(find.text('Content Control'), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(
        find.text('Blocks any NSFW content. '
            'You may see fewer photos, videos and content that may be upsetting or offensive.'),
        findsOneWidget);
  });

// Need to put updates in the sensitive_content.dart in order for this test to work
  testWidgets('switches modes when tapped', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const SCC(),
      ),
    );

    final switchWidget = tester.widget<GestureDetector>(
      find.byType(GestureDetector),
    );

    // Initially, the switch is off
    expect(switchSCCModeFlag, SCCSwitchMode.off);
    expect(find.byIcon(Icons.toggle_off_outlined), findsOneWidget);

    // Tap the switch
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    // The switch should now be on
    expect(switchSCCModeFlag, SCCSwitchMode.on);
    expect(find.byIcon(Icons.toggle_on), findsOneWidget);

    // Tap the switch again
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    // The switch should now be off again
    expect(switchSCCModeFlag, SCCSwitchMode.off);
    expect(find.byIcon(Icons.toggle_off_outlined), findsOneWidget);
  });
}
