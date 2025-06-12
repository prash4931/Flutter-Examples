import 'package:flutter/material.dart';

abstract class Gesture {}

class DragGesture extends Gesture {}

class TapGesture extends Gesture {}

abstract class CustomGestureWidget {
  void handleGesture(covariant Gesture gesture);
}

class DraggableWidget extends StatelessWidget implements CustomGestureWidget {
  const DraggableWidget({super.key, required DragGesture gesture});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void handleGesture(covariant Gesture gesture) {
    // TODO: implement handleGesture
  }
}

class TapWidget extends StatelessWidget implements CustomGestureWidget {
  const TapWidget({super.key, required TapGesture gesture});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void handleGesture(covariant Gesture gesture) {
    // TODO: implement handleGesture
  }
}
