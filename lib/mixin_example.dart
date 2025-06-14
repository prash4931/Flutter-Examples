import 'package:flutter/cupertino.dart';

abstract class Logger {
  void log(String message);
}

mixin ServiceLoggerMixin implements Logger {
  @override
  void log(String message) {
    debugPrint('Service: $message');
  }
}

mixin WidgetLoggerMixin on Widget implements Logger {
  @override
  void log(String message) {
    debugPrint('Widget: $message');
  }
}


class MyWidget extends StatefulWidget with WidgetLoggerMixin {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with ServiceLoggerMixin {

  @override
  void initState() {
    log('initState');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}