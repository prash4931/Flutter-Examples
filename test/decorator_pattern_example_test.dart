import 'package:flutter/material.dart';
import 'package:flutter_application_1/design_patterns/structural/decorator_pattern_example.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BorderText adds a border', (WidgetTester tester) async {
    TextComponent text = SimpleText('Test');
    TextComponent borderedText = BorderText(text);

    // Wrap the component in a
    // MaterialApp and Scaffold to provide context
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Builder(
              builder: (context) {
                return borderedText.build(context);
              },
            ),
          ),
        ),
      ),
    );

    final borderTextFinder = find.byType(Container);
    expect(borderTextFinder, findsOneWidget);

    final Container container = tester.firstWidget(borderTextFinder);

    expect(container.decoration, isA<BoxDecoration>());

    BoxDecoration decoration = container.decoration as BoxDecoration;

    expect(decoration.border, isNotNull);
  });
}
