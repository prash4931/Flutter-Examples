import 'package:flutter/material.dart';

// Complex SubSystem Classes
class NetworkManager {
  Future<String> fetchData() async {
    return 'Data';
  }
}

// Complex SubSystem Classes
class DataProcessor {
  String processData(String data) {
    return 'Processed Data';
  }
}

// Facade
class DataFacade {
  final NetworkManager _networkManager = NetworkManager();
  final DataProcessor _dataProcessor = DataProcessor();

  Future<String> fetchDataAndProcess() async {
    String data = await _networkManager.fetchData();
    return _dataProcessor.processData(data);
  }
}

// Usage:
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: DataFacade().fetchDataAndProcess(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(snapshot.data ?? 'No Data');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    ),
  );
}
