import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/mixin_example.dart';

mixin class ServiceLoggerMixinClass implements Logger {
  @override
  void log(String message) {
    debugPrint('ServiceClass: $message');
  }
}

abstract mixin class ServiceLoggerAbstractionMixinClass {
  void log(String message);

  void toPrint() {
    if (kDebugMode) {
      print('ClassName: ${objectRuntimeType(this, '')}');
    }
  }
}

class CustomServiceLoggerAbstractionMixinClass extends ServiceLoggerAbstractionMixinClass {
  @override
  void log(String message) {
    // TODO: implement log
  }
}

class CustomWidget extends StatelessWidget
    with ServiceLoggerAbstractionMixinClass {
  CustomWidget({super.key}) {
    toPrint();  //from abstract mixin class
  }

  @override
  Widget build(BuildContext context) {
    log('build');
    return const Placeholder();
  }

  @override
  void log(String message) {
    debugPrint('CustomWidget: $message');
  }
}
