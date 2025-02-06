import 'package:flutter/material.dart';

//* OPTION 3: InheritedWidget + ValueNotifier
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
