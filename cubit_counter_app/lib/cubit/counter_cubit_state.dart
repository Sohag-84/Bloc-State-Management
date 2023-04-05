import 'package:equatable/equatable.dart';

abstract class CounterCubitState extends Equatable {
  const CounterCubitState();
}

class CounterInitiate extends CounterCubitState {
  @override
  List<Object?> get props => [];
}

class CounterValueUpdated extends CounterCubitState {
  int counter;
  CounterValueUpdated({required this.counter});
  @override
  List<Object?> get props => [counter];
}
