import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0));

  void increment() {
    emit(CounterState(counter: state.counter + 1));
  }

  void decrement() {
    emit(CounterState(counter: state.counter - 1));
  }

  void divisionCounter () {
    emit(CounterState(counter: state.counter ~/2));
  }

void multiplicationCounter () {
    emit(CounterState(counter: state.counter *2));
  }
}
