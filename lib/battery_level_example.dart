import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLevelExample {
  static const methodChannel = MethodChannel(
    // A name must be the same as
    // the name in the native implementation
    'com.example.flutter_application_1/methods'
  );

  static Future<int?> getBatteryLevel() async {
    try {
      final batteryLevel = await methodChannel.invokeMethod<int>('getBatteryLevel');
      return batteryLevel;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
