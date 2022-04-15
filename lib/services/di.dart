import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stack_ep_ttd/models/counter.dart';
import 'package:stack_ep_ttd/models/numberdata.dart';
import 'package:stack_ep_ttd/services/dio.dart';

bool connected = true;
GetIt getIt = GetIt.instance;
void init() async {
  getIt.registerSingleton<Counter>(Counter(), signalsReady: true);
  getIt.registerSingleton<DioHelper>(DioHelper(), signalsReady: true);
  Response<Map<String, dynamic>> _response =
      await getIt<DioHelper>().fetchData(getIt<Counter>().count);
  Map<String, dynamic>? map = _response.data;
  NumberData numberData = NumberData.fromJson(map);
  getIt<Counter>().data = numberData.text;
  final StreamSubscription<InternetConnectionStatus> listener =
      InternetConnectionChecker()
          .onStatusChange
          .listen((InternetConnectionStatus status) {
    switch (status) {
      case InternetConnectionStatus.connected:
        connected = true;
        // ignore: avoid_print
        print('Data connection is available.');
        break;
      case InternetConnectionStatus.disconnected:
        connected = false;
        // ignore: avoid_print
        print('You are disconnected from the internet.');
        break;
    }
  });
}
