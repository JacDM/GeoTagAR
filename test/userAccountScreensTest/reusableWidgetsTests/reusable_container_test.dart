import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/userAccountScreens/reusableWidgets/reusable_container.dart';

void main() {
  testWidgets('ReusableContainer renders correctly',
      (WidgetTester tester) async {
    final containerChild = const Text('Hello, world!');
    final containerColor = Colors.blue;

    await tester.pumpWidget(
      MaterialApp(
        home: ReusableContainer(
          colour: containerColor,
          containerChild: containerChild,
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    final containerWidget = tester.widget<Container>(containerFinder);

    expect(containerFinder, findsOneWidget);
    expect(
        containerWidget.decoration,
        BoxDecoration(
          border: Border.all(
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: containerColor,
        ));
    expect(find.byType(Text), findsOneWidget);
  });
}
