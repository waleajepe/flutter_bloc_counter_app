import 'package:bloc/bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementCounterEvent>((event, emit) {
      emit(state + 1);
    });

    on<DecrementCounterEvent>((event, emit) {
      // prevent decrement below zero to avoid negative values
      if (event.currentValue == 0) {
        emit(state);
      } else {
        emit(state - 1);
      }
    });
  }
}




