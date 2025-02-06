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

  void increment() => value = value.copyWith(count: value.count + 1);

  void decrement() => value = value.copyWith(count: value.count - 1);
}

class CounterModel {
  final int count;

  CounterModel({this.count = 0});

  CounterModel copyWith({
    final int? count,
  }) =>
      CounterModel(count: count ?? this.count);
}
