import 'package:flutter/material.dart';
import 'package:flutter_application_1/design_patterns/behavioural/observer_pattern_example.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter value should update on increment', (
    WidgetTester tester,
  ) async {
    // Build app and trigger a frame
    await tester.pumpWidget(ObserverMyApp());

    // Verify the inital state of counter
    expect(find.text('Current Counter Value: '), findsNWidgets(2));
    expect(find.text('0'), findsNWidgets(2));

    // Find and tap on the FAB
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the counter has incremented
    expect(find.text('1'), findsNWidgets(2));
  });
}
