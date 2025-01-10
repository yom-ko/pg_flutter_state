import 'package:flutter/material.dart';

import 'inherited_widget_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CounterProviderScope(
      child: MaterialApp(
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
  void initState() {
    super.initState();
    print('here initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('here didChangeDependencies');
  }

  @override
  Widget build(BuildContext context) {
    print('here build');
    final provider = CounterProviderScope.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${provider.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
