import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_ep_ttd/bloc/counterevent.dart';
import 'package:stack_ep_ttd/bloc/counterstate.dart';
import 'package:stack_ep_ttd/models/numberdata.dart';
import 'package:stack_ep_ttd/services/di.dart';
import 'package:stack_ep_ttd/services/dio.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState());
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterFetchingState();
      event.counter.count++;
      Response<Map<String, dynamic>> _response =
          await getIt<DioHelper>().fetchData(event.counter.count);
      Map<String, dynamic>? map = _response.data;
      NumberData numberData = NumberData.fromJson(map);
      event.counter.data = numberData.text;
      yield CounterFetchedState(data: event.counter.data ?? "");
    } else if (event is DecrementEvent) {
      yield CounterFetchingState();
      event.counter.count--;
      Response<Map<String, dynamic>> _response =
          await getIt<DioHelper>().fetchData(event.counter.count);
      Map<String, dynamic>? map = _response.data;
      NumberData numberData = NumberData.fromJson(map);
      event.counter.data = numberData.text;
      yield CounterFetchedState(data: event.counter.data ?? "");
    } else {
      yield CounterErrorState();
    }
  }
}
