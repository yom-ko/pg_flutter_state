import 'package:flutter/material.dart';

import 'inherited_widget_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      notifier: CounterNotifier(CounterModel()),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: MyHomePage(title: 'Test'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final CounterProvider(:notifier) = CounterProvider.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListenableBuilder(
              listenable: notifier,
              builder: (context, widget) => Text(
                '${notifier.value.count}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => notifier.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
