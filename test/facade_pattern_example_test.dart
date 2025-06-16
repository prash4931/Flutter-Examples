import 'package:flutter/material.dart';
import 'package:flutter_application_1/design_patterns/structural/facade_pattern_example.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DataFacade should fetch and process data', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FutureBuilder(
            future: DataFacade().fetchDataAndProcess(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(snapshot.data ?? 'No Data');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  });
}
