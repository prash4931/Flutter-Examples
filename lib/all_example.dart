import 'dart:ui';

import 'package:flutter/material.dart';

class AllExample extends StatefulWidget {
  const AllExample({super.key});

  @override
  State<AllExample> createState() => _AllExampleState();
}

class _AllExampleState extends State<AllExample> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onStateChange: _onStateChange,
      onResume: _onResume,
      onInactive: _onInactive,
      onHide: _onHide,
      onShow: _onShow,
      onPause: _onPause,
      onRestart: _onRestart,
      // onExitRequested: _onExitRequested,
      onDetach: _onDetach,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void _onStateChange(AppLifecycleState value) {}

  void _onResume() {}

  void _onInactive() {}

  void _onHide() {}

  void _onShow() {}

  void _onPause() {}

  void _onRestart() {}

  //  AppExitRequestCallback? _onExitRequested()  {}

  void _onDetach() {}
}
