import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stack_ep_ttd/bloc/counterbloc.dart';
import 'package:stack_ep_ttd/bloc/counterevent.dart';
import 'package:stack_ep_ttd/bloc/counterstate.dart';
import 'package:stack_ep_ttd/main.dart';
import 'package:stack_ep_ttd/models/counter.dart';

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
              ],
            ),
            BlocProvider(
              create: (context) => CounterBloc(),
              child: BlocConsumer(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is CounterFetchingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CounterFetchedState) {
                      return Center(
                          child: SizedBox(
                        width: 300,
                        height: 200,
                        child: Text(
                          state.data,
                          overflow: TextOverflow.visible,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ));
                    } else {
                      return const Center(
                        child: Text('Something went wrong'),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(IncrementEvent(counter: getIt<Counter>()));
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context)
                  .add(DecrementEvent(counter: getIt<Counter>()));
            },
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
