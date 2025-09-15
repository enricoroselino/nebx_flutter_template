import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() => state++;
  void decrement() => state--;
  void reset() => state = 0;
}

final counterProvider = NotifierProvider<CounterNotifier, int>(
  () => CounterNotifier(),
);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final counterNotifier = ref.read(counterProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$count', style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: counterNotifier.increment,
            heroTag: "inc",
            child: Icon(Icons.add),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: counterNotifier.decrement,
            heroTag: "dec",
            child: Icon(Icons.remove),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: counterNotifier.reset,
            heroTag: "res",
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
