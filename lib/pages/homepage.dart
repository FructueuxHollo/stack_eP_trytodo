import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stack_ep_ttd/bloc/counterbloc.dart';
import 'package:stack_ep_ttd/bloc/counterevent.dart';
import 'package:stack_ep_ttd/bloc/counterstate.dart';
import 'package:stack_ep_ttd/main.dart';
import 'package:stack_ep_ttd/models/counter.dart';
import 'package:stack_ep_ttd/widgets/actionbuttons.dart';
import 'package:stack_ep_ttd/widgets/printdata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            FaIcon(FontAwesomeIcons.stackOverflow),
            SizedBox(
              width: 20,
            ),
            Text('eP Stack'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  getIt<Counter>().count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                ),
                const Printdata()
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: ActionButtons(),
    );
  }
}
