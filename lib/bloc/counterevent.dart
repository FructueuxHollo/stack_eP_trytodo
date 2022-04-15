import 'package:stack_ep_ttd/models/counter.dart';

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {
  Counter counter;
  IncrementEvent({required this.counter});
}

class DecrementEvent extends CounterEvent {
  Counter counter;
  DecrementEvent({required this.counter});
}
