import 'package:flutter/material.dart';

//* OPTION 4: InheritedNotifier
class CounterProvider<T extends Listenable> extends InheritedNotifier<T> {
  const CounterProvider({
    super.key,
    required super.child,
    required super.notifier,
  });

  static T of<T extends Listenable>(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CounterProvider<T>>();
    if (provider == null) {
      throw Exception("No Provider found in context");
    }

    final notifier = provider.notifier;
    if (notifier == null) {
      throw Exception("No notifier found in Provider");
    }

    return notifier;
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
