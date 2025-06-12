import 'package:flutter/material.dart';

class WboExample extends StatefulWidget {
  const WboExample({super.key});

  @override
  State<WboExample> createState() => _WboExampleState();
}

class _WboExampleState extends State<WboExample> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("FL: $state}");
    if (state == AppLifecycleState.paused) {
      // Handle app going into background
      // print(AppLifecycleState.paused);
    } else if (state == AppLifecycleState.resumed) {
      // Handle app coming to the foreground
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
