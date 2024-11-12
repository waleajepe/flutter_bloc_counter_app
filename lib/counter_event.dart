part of 'counter_bloc.dart';

sealed class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {
  DecrementCounterEvent({required this.currentValue});
  final int currentValue;
}
