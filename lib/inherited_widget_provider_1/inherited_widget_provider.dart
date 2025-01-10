import 'package:flutter/material.dart';

//* OPTION 1: InheritedWidget + StatefulWidget

// Acts as a mediator between the state container and widgets.
// When any of its params changes, the widgets that depend on it are rebuilt.
class CounterProvider extends InheritedWidget {
  const CounterProvider({
    super.key,
    required this.count,
    required this.increment,
    required this.decrement,
    required super.child,
  });

  final int count;
  final Function() increment;
  final Function() decrement;

  static CounterProvider? of(BuildContext context) {
    (context.getElementForInheritedWidgetOfExactType<CounterProvider>()?.widget as CounterProvider).count;
    context.getInheritedWidgetOfExactType<CounterProvider>()?.count;
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return count != oldWidget.count;
  }
}

class CounterProviderScope extends StatefulWidget {
  const CounterProviderScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<CounterProviderScope> createState() => _CounterProviderScopeState();
}

// The StatefulWidget's state is the actual state container.
class _CounterProviderScopeState extends State<CounterProviderScope> {
  int _count = 0;

  _increment() => setState(() => _count++);

  _decrement() => setState(() => _count--);

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increment: _increment,
      decrement: _decrement,
      child: widget.child,
    );
  }
}
