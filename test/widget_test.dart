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
import 'package:flutter_app_layout/fibonacci.dart';

void main() {
  testWidgets('Favourites icon and counter tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(const MyApp(key: Key("FavouritesIconCounterTests")));

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
    await tester.pumpWidget(const MyApp(key: Key("StateManagemetTests")));
    // Or use skipOffstage: false - expect(find.byType(StatefulParentWidget, skipOffstage: false), findsOneWidget);
    /*
    final gesture = await tester
        .startGesture(const Offset(0, 300)); //Position of the scrollview
    await gesture.moveBy(const Offset(0, -300)); //How much to scroll by
    await tester.pump();
    This fails the second part of the test after the `tester.tap` activity
    */
    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byType(TapboxB);
    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );
    expect(find.byType(StatefulParentWidget), findsOneWidget);
    expect(find.byType(TapboxB), findsOneWidget);
    expect(find.text("Inactive"), findsOneWidget);
    expect(find.text("Active"), findsNothing);
    TapboxB tapboxB = tester.firstWidget<TapboxB>(find.byType(TapboxB));
    assert(!tapboxB.active);
    Container container = find
        .descendant(
            of: find.byType(TapboxB),
            matching: find.byType(Container),
            matchRoot: true)
        .evaluate()
        .elementAt(0)
        .widget as Container;
    expect((container.decoration as BoxDecoration).color, Colors.grey[600]);
    expect(find.byType(StatefulParentWidget), findsOneWidget);
    expect(find.byType(TapboxB), findsOneWidget);
    await tester.tap(find.byType(TapboxB));
    await tester.pump();
    expect(find.text("Active"), findsOneWidget);
    expect(find.text("Inactive"), findsNothing);
    tapboxB = tester.firstWidget<TapboxB>(find.byType(TapboxB));
    assert(tapboxB.active);
    container = find
        .descendant(
            of: find.byType(TapboxB),
            matching: find.byType(Container),
            matchRoot: true)
        .evaluate()
        .elementAt(0)
        .widget as Container;
    expect(
        (container.decoration as BoxDecoration).color, Colors.lightGreen[700]);
  });
  testWidgets('Fibonacci Form tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp(key: Key("FibonacciFormTests")));
    final listFinder = find.byType(Scrollable);
    final fibonacciForm = find.byType(FibonacciForm);
    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      fibonacciForm,
      500.0,
      scrollable: listFinder,
    );

    expect(find.byType(FibonacciForm), findsOneWidget);
    // Enter 'hi' into the TextField.
    await tester.enterText(find.byType(TextFormField), 'hi');
    // Tap the submit button.
    await tester.tap(find.byType(FloatingActionButton));
    // Rebuild the widget after the state has changed.
    await tester.pump();
    // Expect to find the item on screen.
    expect(find.text('-1'), findsOneWidget);
  });
}
