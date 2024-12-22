// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({
    this.counter = 0,
  });

  @override
  List<Object?> get props => [counter];

  CounterState copyWith({
    int? counter,
  }) =>
      CounterState(counter: counter ?? this.counter);
}
