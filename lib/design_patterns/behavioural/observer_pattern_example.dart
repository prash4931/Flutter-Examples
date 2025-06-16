import 'package:flutter/material.dart';

abstract class Observer {
  void update();
}

class Subject {
  List<Observer> _observers = [];

  void attach(Observer observer) {
    _observers.add(observer);
  }

  void detach(Observer observer) {
    _observers.remove(observer);
  }

  void notifyObservers() {
    for (final observer in _observers) {
      observer.update();
    }
  }
}

class ConcreteObserver implements Observer {
  @override
  void update() {
    print('Observer updated.');
  }
}

void main2() {
  final subject = Subject();
  final observer = ConcreteObserver();
  final observer2 = ConcreteObserver();
  subject.attach(observer);
  subject.attach(observer2);

  subject.notifyObservers();
}

//Flutter Based Implementation
class CounterObserver with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class CounterConcreteObserver extends StatelessWidget {
  final CounterObserver counterNotifer;
  const CounterConcreteObserver({super.key, required this.counterNotifer});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Current Counter Value: '),
          ListenableBuilder(
            listenable: counterNotifer,
            builder: (context, child) {
              return Text('${counterNotifer.count}');
            },
          ),
        ],
      ),
    );
  }
}

class ObserverMyApp extends StatefulWidget {
  const ObserverMyApp({super.key});

  @override
  State<ObserverMyApp> createState() => _ObserverMyAppState();
}

class _ObserverMyAppState extends State<ObserverMyApp> {
  final _counter = CounterObserver();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Listenable Builder Example')),
        body: Column(
          children: [
            CounterConcreteObserver(counterNotifer: _counter),
            CounterConcreteObserver(counterNotifer: _counter),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _counter.increment,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

void main() {
  runApp(ObserverMyApp());
}
