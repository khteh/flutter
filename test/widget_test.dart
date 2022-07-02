// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_layout/main.dart';
import 'package:flutter_app_layout/StateManagement.dart';

void main() {
  testWidgets('Favourites icon and counter tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify default favourites counter = 41
    expect(find.text("41"), findsOneWidget);

    // Tap the Favourite icon and trigger a frame.
    expect(find.byIcon(Icons.star_border), findsNothing);
    await tester.tap(find.byIcon(Icons.star));
    await tester.pump();
    expect(find.text("41"), findsNothing);
    expect(find.text("40"), findsOneWidget);

    expect(find.byIcon(Icons.star), findsNothing);
    await tester.tap(find.byIcon(Icons.star_border));
    await tester.pump();
    expect(find.text("40"), findsNothing);
    expect(find.text("41"), findsOneWidget);
  });
  testWidgets('State management tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    /*
    expect(
        ((tester.firstWidget(find.byType(Container)) as Container).decoration
                as BoxDecoration)
            .color,
        Colors.grey);*/
    expect(find.byType(StatefulParentWidget), findsOneWidget);

    expect(find.text("Inactive"), findsOneWidget);
    expect(find.text("Active"), findsNothing);
    //StatefulParentWidget statefulParentWidget = const StatefulParentWidget();
    //tester.state(find.byWidget(statefulParentWidget));
    //expect(find.byWidget(tapboxB), findsOneWidget);
  });
}
