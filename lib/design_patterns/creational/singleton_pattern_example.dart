import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';

class AppConfig {
  // _instance is a private static member that holds the singleton instance
  static AppConfig _instance = AppConfig._internal();

  // The constructor is private to prevent external instantiation
  AppConfig._internal();

  factory AppConfig() => _instance;

  // Reset the Singleton, useful in tests
  @visibleForTesting
  static void reset() => _instance = AppConfig._internal();

  String appName = 'My Flutter App';
  String appVersion = '1.0.0';

  // Additional Configuration Settings
}

void main() {
  // This setup runs
  // before each test to reset the singleton
  setUp(() {
    AppConfig.reset();
  });

  test('Singleton instance should be the same', () {
    final instance1 = AppConfig._instance;
    final instance2 = AppConfig._instance;

    // Test whether both instances are the same instance
    expect(identical(instance1, instance2), isTrue);
  });

  test('Singleton Instance should retain its state', () {
    final instance = AppConfig._instance;

    instance.appName = 'Test App';

    // Create another reference to the singleton
    final instance2 = AppConfig._instance;

    // Test whether the second reference
    // sees the updates state
    expect(instance2.appName, 'Test App');
  });
}
