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
  testWidgets('State management tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    // Or use skipOffstage: false - expect(find.byType(StatefulParentWidget, skipOffstage: false), findsOneWidget);
    /*
    final gesture = await tester
        .startGesture(const Offset(0, 300)); //Position of the scrollview
    await gesture.moveBy(const Offset(0, -300)); //How much to scroll by
    await tester.pump();
    This fails the second part of the test after the `tester.tap` activity
    */
    // Scroll until the item to be found appears.
    /*
    await tester.scrollUntilVisible( Bad state: Too many elements exception!
      find.byType(TapboxB),
      500.0,
      //scrollable: find.byType(Scrollable),
      scrollable: find.byType(ListView),
    );*/
    await tester.dragUntilVisible(
        find.byType(TapboxB), find.byType(ListView), const Offset(0, -500));
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
}
