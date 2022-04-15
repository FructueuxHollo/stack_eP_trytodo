abstract class CounterState {}

class CounterInitialState extends CounterState {}

class CounterFetchingState extends CounterState {}

class CounterFetchedState extends CounterState {
  String data;
  CounterFetchedState({required this.data});
}

class CounterErrorState extends CounterState {}
