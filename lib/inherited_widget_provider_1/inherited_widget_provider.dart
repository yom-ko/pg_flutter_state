import 'package:flutter/material.dart';

//* OPTION 1: InheritedWidget + StatefulWidget

// Acts as a mediator between a state container and widgets.
// When any of its parameters changes, the widgets that depend on it are rebuilt.
class CounterProvider extends InheritedWidget {
  final int count;
  final Function() increment;
  final Function() decrement;

  const CounterProvider({
    super.key,
    required this.count,
    required this.increment,
    required this.decrement,
    required super.child,
  });

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return count != oldWidget.count;
  }
}

class CounterScope extends StatefulWidget {
  final Widget child;

  const CounterScope({
    super.key,
    required this.child,
  });

  @override
  State<CounterScope> createState() => _CounterScopeState();
}

// The StatefulWidget's state is the actual state container.
class _CounterScopeState extends State<CounterScope> {
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
