import 'package:flutter/material.dart';

//* OPTION 2: InheritedWidget + ValueNotifier
class CounterProvider extends InheritedWidget {
  final CounterNotifier notifier;

  const CounterProvider({
    super.key,
    required super.child,
    required this.notifier,
  });

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return notifier.value != oldWidget.notifier.value;
  }
}

class CounterNotifier extends ValueNotifier<CounterModel> {
  CounterNotifier(super.value);

  void increment() => value = value.copyWith(counter: value.counter + 1);

  void decrement() => value = value.copyWith(counter: value.counter - 1);
}

class CounterModel {
  final int counter;

  CounterModel({this.counter = 0});

  CounterModel copyWith({
    final int? counter,
  }) =>
      CounterModel(counter: counter ?? this.counter);
}
