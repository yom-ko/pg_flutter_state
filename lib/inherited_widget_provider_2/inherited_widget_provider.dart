import 'package:flutter/material.dart';

//* OPTION 2: StatefulWidget + InheritedWidget

class CounterProviderScope extends StatefulWidget {
  final Widget child;

  const CounterProviderScope({
    super.key,
    required this.child,
  });

  // ignore: library_private_types_in_public_api
  static _CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_CounterProvider>();
  }

  @override
  State<CounterProviderScope> createState() => _CounterProviderScopeState();
}

class _CounterProviderScopeState extends State<CounterProviderScope> {
  int _count = 0;

  _increment() => setState(() => _count++);

  _decrement() => setState(() => _count--);

  @override
  Widget build(BuildContext context) {
    return _CounterProvider(
      count: _count,
      increment: _increment,
      decrement: _decrement,
      child: widget.child,
    );
  }
}

class _CounterProvider extends InheritedWidget {
  const _CounterProvider({
    required this.count,
    required this.increment,
    required this.decrement,
    required super.child,
  });

  final int count;
  final Function() increment;
  final Function() decrement;

  @override
  bool updateShouldNotify(_CounterProvider oldWidget) {
    return count != oldWidget.count;
  }
}
