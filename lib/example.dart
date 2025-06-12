import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/wbo_example.dart';

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _counter = 0;

  _ExampleState() {
    print('FL: Constructor, mounted: $mounted');
  }
  @override
  void initState() {
    print('FL: initState:, mounted: $mounted');
    super.initState();
  }

  @override
  void reassemble() {
    print('FL: Hot Reload Reassemble');
    super.reassemble();
  }

  @override
  void didChangeDependencies() {
    print('FL: didChangeDependencies:, mounted: $mounted');
    super.didChangeDependencies();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      print('FL: setState, new counter value: $_counter');
    });
  }

  @override
  void didUpdateWidget(covariant Example oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('FL: didUpdateWidget, mounted: $mounted ');
  }

  @override
  void deactivate() {
    print('FL: deactivate, mounted: $mounted ');
    super.deactivate();
  }

  @override
  void dispose() {
    print('FL: dispose, mounted: $mounted ');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Counter: $_counter'),
          ElevatedButton(
            onPressed: _incrementCounter,
            child: Text('Increment'),
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder:(context) {
              return WboExample();
            },));
            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) {
            //   return HomePage();
            // },), (_) => false);
          }, child: Text('Go'))
        ],
      ),
    );
  }
}
