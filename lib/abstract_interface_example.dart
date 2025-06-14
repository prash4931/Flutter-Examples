// Pure Interface for a data fetching service
abstract interface class DataService {
  Future<String> fetchData();
}

// Implementation of dataservice for
// fetching data from a Network API
class NetworkDataService implements DataService {
  @override
  Future<String> fetchData() async {
    // Implement Network Request Logic Here
    return 'Data from Network';
  }
}

// Implementation of dataservice for
// fetching Mock Data (Useful for testing)
class MockDataService implements DataService {
  @override
  Future<String> fetchData() async {
    return 'Mock Data';
  }
}
