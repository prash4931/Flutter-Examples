import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/hello_world_bindings.dart';

class HwbExample extends StatelessWidget {
  const HwbExample({super.key, required this.helloWorldBindings});
  final HelloWorldBindings helloWorldBindings;

  @override
  Widget build(BuildContext context) {
    final message = helloWorldBindings.helloWorld();
    debugPrint(Directory.current.path);
    return Scaffold(body: Center(child: Text(message)));
  }
}
