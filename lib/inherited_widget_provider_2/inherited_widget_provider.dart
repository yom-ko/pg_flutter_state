import 'package:flutter/material.dart';

//* OPTION 2: StatefulWidget + InheritedWidget

class CounterProvider extends StatefulWidget {
  final Widget child;

  const CounterProvider({
    super.key,
    required this.child,
  });

  // ignore: library_private_types_in_public_api
  static _CounterProviderState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedCounter>()?.state;
  }

  @override
  State<CounterProvider> createState() => _CounterProviderState();
}

class _CounterProviderState extends State<CounterProvider> {
  int count = 0;

  void increment() => setState(() => count++);

  void decrement() => setState(() => count--);

  @override
  Widget build(BuildContext context) {
    return _InheritedCounter(
      state: this,
      child: widget.child,
    );
  }
}

class _InheritedCounter extends InheritedWidget {
  final _CounterProviderState state;

  const _InheritedCounter({
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(_InheritedCounter oldWidget) {
    return true;
  }
}
