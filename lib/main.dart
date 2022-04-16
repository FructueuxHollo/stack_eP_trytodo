import 'package:flutter/material.dart';
// import 'package:stack_ep_ttd/bloc/counterblocobserver.dart';
import 'package:stack_ep_ttd/pages/homepage.dart';
import 'package:stack_ep_ttd/pages/settings.dart';
import 'package:stack_ep_ttd/services/di.dart' as di;

var getIt = di.getIt;
void main() {
  // CounterBlocObserver observer = CounterBlocObserver();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
