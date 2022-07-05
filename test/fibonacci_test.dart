// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_layout/main.dart';
import 'package:flutter_app_layout/fibonacci.dart';

void main() {
  testWidgets('Fibonacci Bad Input Should Fail tests',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    // Scroll until the item to be found appears.
    /*await tester.scrollUntilVisible( Bad state: Too many elements exception!
      find.byType(FibonacciForm),
      500.0,
      scrollable: find.byType(Scrollable),
    );*/
    await tester.dragUntilVisible(find.byType(FibonacciForm),
        find.byType(ListView), const Offset(0, -500));
    expect(find.byType(FibonacciForm), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    // Enter 'hi' into the TextField.
    await tester.enterText(find.byType(TextFormField), 'hi');
    // Tap the submit button.
    await tester.tap(find.byType(ElevatedButton));
    // Rebuild the widget after the state has changed.
    await tester.pump();
    // Expect to find the item on screen.
    expect(find.text('fibonacci(0): 0'), findsOneWidget);
  });
  testWidgets('Fibonacci Good Input Should Pass tests',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    // Scroll until the item to be found appears.
    /*await tester.scrollUntilVisible( Bad state: Too many elements exception!
      find.byType(FibonacciForm),
      500.0,
      scrollable: find.byType(Scrollable),
    );*/
    await tester.dragUntilVisible(find.byType(FibonacciForm),
        find.byType(ListView), const Offset(0, -500));
    expect(find.byType(FibonacciForm), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    // Enter 'hi' into the TextField.
    await tester.enterText(find.byType(TextFormField), '20');
    // Tap the submit button.
    await tester.tap(find.byType(ElevatedButton));
    // Rebuild the widget after the state has changed.
    await tester.pump();
    // Expect to find the item on screen.
    expect(find.text('fibonacci(20): 6765'), findsOneWidget);
  });
}
