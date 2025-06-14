import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

abstract class PlatformWidgetFactory {
  Widget createWidget();
}

class IOSWidgetFactory extends PlatformWidgetFactory {
  @override
  Widget createWidget() {
    return CupertinoButton(child: Text('iOS Button'), onPressed: () {});
  }
}

class AndroidWidgetFactory extends PlatformWidgetFactory {
  @override
  Widget createWidget() {
    return ElevatedButton(onPressed: () {}, child: Text('Android Button'));
  }
}

class WebWidgetFactory extends PlatformWidgetFactory {
  @override
  Widget createWidget() {
    return TextButton(onPressed: () {}, child: Text('Web Button'));
  }
}

void main2() {
  PlatformWidgetFactory widgetFactory;

  if (Platform.isIOS) {
    widgetFactory = IOSWidgetFactory();
  } else if (Platform.isAndroid) {
    widgetFactory = AndroidWidgetFactory();
  } else {
    widgetFactory = WebWidgetFactory();
  }

  Widget myWidget = widgetFactory.createWidget();

  runApp(
    MaterialApp(
      home: Scaffold(body: Center(child: myWidget)),
    ),
  );
}

void main() {
  test('IOSWidgetFactory should create a CupertionButton', () {
    PlatformWidgetFactory factory = IOSWidgetFactory();

    final widget = factory.createWidget();

    expect(widget, isA<CupertinoButton>());
  });

  test('AndroidWidgetFactory should have an ElevatedButton', () {
    PlatformWidgetFactory factory = AndroidWidgetFactory();

    final widget = factory.createWidget();

    expect(widget, isA<ElevatedButton>());
  });

  test('WebWidgetFactory should create a TextButton', () {
    PlatformWidgetFactory factory = WebWidgetFactory();

    final widget = factory.createWidget();

    expect(widget, isA<TextButton>());
  });
}
