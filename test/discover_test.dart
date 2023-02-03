import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geotagar/screens/discoverPages/discover.dart';
import 'package:geotagar/utils/text_Field.dart';

// The test will only work if there is data in the firestore database which matches the search query 'Test' which is yet to be implemented

//void main() {
//  testWidgets('DiscoverPage', (WidgetTester tester) async {
//    await tester.pumpWidget(const MaterialApp(home: DiscoverPage()));

//    expect(find.text('Communities'), findsOneWidget);
//    expect(find.byType(Form), findsOneWidget);
//    expect(find.byType(ReusableTextField), findsOneWidget);
//    expect(find.text('Search'), findsOneWidget);
//    expect(find.byType(CircularProgressIndicator), findsNothing);

//    // Enter text into the search field
//    await tester.enterText(find.byType(ReusableTextField), 'Test');

//    // Trigger a search
//    await tester.tap(find.byType(ReusableTextField));
//    await tester.pump();

//    expect(find.text('Communities'), findsNothing);
//    expect(find.byType(CircularProgressIndicator), findsOneWidget);
//  });
//}
