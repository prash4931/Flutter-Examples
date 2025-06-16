import 'package:flutter_application_1/design_patterns/behavioural/command_pattern_example.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyApp should execute and undo commands correctly', (
    WidgetTester tester,
  ) async {
    CommandManager commandManager = CommandManager();

    await tester.pumpWidget(
      CommandPatternMyApp(commandManager: commandManager),
    );

    // Find the buttons
    Finder drawButton = find.text('Tap to Draw');
    Finder changeColorButton = find.text('Tap to Change Color');
    Finder undoButton = find.text('Press to Undo');

    // Execute the Draw Command
    await tester.tap(drawButton);
    await tester.pump();

    // Verify that DrawCommand
    // is added to the history
    expect(find.text('DrawCommand'), findsOneWidget);

    // Execute the ChangeColorCommand
    await tester.tap(changeColorButton);
    await tester.pump();

    // Verify that ChangeColor
    // is added to the history
    expect(find.text('ChangeColor'), findsOneWidget);

    // Undo the last command
    await tester.tap(undoButton);
    await tester.pump();

    // Verify that ChangeColorCommand
    // is removed from the history
    expect(find.text('ChangeColorCommand'), findsNothing);

    // Verify that DrawCommand
    // is still in the history
    expect(find.text('DrawCommand'), findsOneWidget);

    // Undo the draw command
    await tester.tap(undoButton);
    await tester.pump();

    expect(find.text('DrawCommand'), findsNothing);


  });
}
