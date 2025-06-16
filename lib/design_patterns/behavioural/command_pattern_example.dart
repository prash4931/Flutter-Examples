// Command Interface
import 'dart:collection';

import 'package:flutter/material.dart';

abstract class Command {
  String get name;
  void execute();
  void undo();
}

// Concrete Command for Drawing
class DrawCommand implements Command {
  DrawCommand();

  @override
  void execute() {
    // TODO: implement execute
  }

  @override
  String get name => 'DrawCommand';

  @override
  void undo() {
    // TODO: implement undo
  }
}

// Concrete Command for ChangeColor
class ChangeColorCommand implements Command {
  @override
  void execute() {
    // TODO: implement execute
  }

  @override
  String get name => 'ChangeColor';

  @override
  void undo() {
    // TODO: implement undo
  }
}

// To handle execution and undoing
class CommandManager {
  final _commandList = ListQueue<Command>();

  bool get hasHistory => commandHistoryList.isNotEmpty;

  List<String> get commandHistoryList =>
      _commandList.map((c) => c.name).toList();

  void executeCommand(Command command) => _commandList.add(command);

  void undo() {
    if (_commandList.isEmpty) return;
    _commandList.removeLast().undo();
  }
}

class CommandPatternMyApp extends StatefulWidget {
  final CommandManager commandManager;
  const CommandPatternMyApp({super.key, required this.commandManager});

  @override
  State<CommandPatternMyApp> createState() => _CommandPatternMyAppState();
}

class _CommandPatternMyAppState extends State<CommandPatternMyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Command Pattern Example')),
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                widget.commandManager.executeCommand(DrawCommand());
                setState(() {});
              },
              child: Text('Tap to Draw'),
            ),
            TextButton(
              onPressed: () {
                widget.commandManager.executeCommand(ChangeColorCommand());
                setState(() {});
              },
              child: Text('Tap to Change Color'),
            ),
            if (widget.commandManager.hasHistory)
              TextButton(
                onPressed: () {
                  widget.commandManager.undo();
                  setState(() {});
                },
                child: Text('Press to Undo'),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.commandManager.commandHistoryList.length,
                itemBuilder: (context, index) {
                  return Text(widget.commandManager.commandHistoryList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  CommandManager commandManager = CommandManager();
  runApp(CommandPatternMyApp(commandManager: commandManager));
}
