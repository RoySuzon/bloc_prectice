import 'package:testing_project/bloc/counter/counter_event.dart';
import 'package:testing_project/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementEvent>(_imcrement);
    on<DecrementEvent>(_decrement);
  }
  void _imcrement(IncrementEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrement(DecrementEvent event, Emitter<CounterState> emit) {
    if (state.counter != 0) {
      emit(state.copyWith(counter: state.counter - 1));
    }
  }
}
