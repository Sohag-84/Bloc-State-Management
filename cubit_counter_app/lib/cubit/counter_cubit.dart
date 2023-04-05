import 'package:cubit_counter_app/cubit/counter_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit(): super(CounterInitiate());
  int counter = 0;

  void counterIncrease() {
    counter++;
    emit(CounterValueUpdated(counter: counter));
  }

  void counterDecrease() {
    counter--;
    emit(CounterValueUpdated(counter: counter));
  }
}
