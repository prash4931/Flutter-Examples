import 'package:flutter/material.dart';

abstract class SortingStrategy {
  List<int> sort(List<int> dataset);
}

class AscendingSort implements SortingStrategy {
  @override
  List<int> sort(List<int> dataset) {
    dataset.sort((a, b) => a.compareTo(b));
    debugPrint(dataset.toString());
    return dataset;
  }
}

class DescendingSort implements SortingStrategy {
  @override
  List<int> sort(List<int> dataset) {
    dataset.sort((b, a) => a.compareTo(b));
    debugPrint(dataset.toString());
    return dataset;
  }
}

class ContextStrategy {
  final SortingStrategy strategy;

  ContextStrategy(this.strategy);

  List<int> executeStrategy(List<int> dataset) {
    return strategy.sort(dataset);
  }
}

class SortingWidget extends StatelessWidget {
  final List<int> dataset;
  final ContextStrategy contextStrategy;
  const SortingWidget({
    super.key,
    required this.dataset,
    required this.contextStrategy,
  });

  @override
  Widget build(BuildContext context) {
    final sortedData = contextStrategy.executeStrategy(dataset);
    return ListView.builder(
      itemCount: sortedData.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(sortedData[index].toString()));
      },
    );
  }
}

class SortingHome extends StatefulWidget {
  const SortingHome({super.key});

  @override
  State<SortingHome> createState() => _SortingHomeState();
}

class _SortingHomeState extends State<SortingHome> {
  List<int> dataset = [3, 1, 3, 1, 5, 9];
  SortingStrategy currentStrategy = AscendingSort();

  void toggleSortingStrategy() {
    setState(() {
      currentStrategy = currentStrategy is AscendingSort
          ? DescendingSort()
          : AscendingSort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sorting Example')),
      body: SortingWidget(
        dataset: dataset,
        contextStrategy: ContextStrategy(currentStrategy),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: toggleSortingStrategy,
        child: Icon(Icons.sort),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: SortingHome()));
}
