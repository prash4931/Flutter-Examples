import 'package:flutter/material.dart';

class Clickable {
  void onClick() {} // With Concrete Implementation
}

class CustomIconButton implements Clickable {
  @override
  void onClick() {
    // TODO: implement onClick
    // Specific Implementation for CustomIconButton
  }
}

class CustomIconButton2 extends Clickable {}

class Product {
  void calculateDiscount() {}
}

class Book extends Product {
  @override
  void calculateDiscount() {
    // TODO: implement calculateDiscount
  }
}

class Laptop extends Product {
  @override
  void calculateDiscount() {
    // TODO: implement calculateDiscount
  }
}

mixin LoggerMixin {
  void logEvent(String message) {
    print("LOG: $message");
  }
}

class BaseService {
  void perform() {
    print("Performing base service ${DateTime.now().toIso8601String()}");
  }
}

class AuthService extends BaseService with LoggerMixin {
  @override
  void perform() {
    super.perform();
    logEvent("AuthService Executed ${DateTime.now().toIso8601String()}");
  }
}

// void main() {
//   AuthService().perform();
// }

mixin LifeCycleLogger<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    print('[Logger] ${runtimeType} MyWidgetState: initState called');
    super.initState();
  }

  @override
  void dispose() {
    print('[Logger] ${runtimeType} MyWidgetState: dispose called');
    super.dispose();
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> with LifeCycleLogger<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (show) MyWidget(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                show = !show;
              });
            },
            child: Text(show ? 'Hide' : 'Show'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Scaffold(body: HomeScreen())));
}
