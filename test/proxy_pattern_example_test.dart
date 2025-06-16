import 'package:flutter/material.dart';
import 'package:flutter_application_1/design_patterns/structural/proxy_pattern_example.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AccessControlProxyWidget', () {
    // Test when Access is granted
    testWidgets('displays content when access is granted', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AccessControlProxyWidget(
            protectedWidget: RestrictedContentWidget(),
            hasAccess: true,
          ),
        ),
      );
    });

    // Verify that restricted content is displayed
    expect(find.byKey(Key('restrictedContentKey')), findsOneWidget);

    expect(find.text('Restricted Content'), findsOneWidget);
  });

  // Test when the access is denied
  testWidgets('displays content when access is denied', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AccessControlProxyWidget(
          protectedWidget: RestrictedContentWidget(),
          hasAccess: false,
        ),
      ),
    );
  });

  // Verify that restricted content is displayed
  expect(find.byKey(Key('restrictedContentKey')), findsNothing);

  expect(find.text('Acess Denied'), findsOneWidget);
}
