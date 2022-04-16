import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_ep_ttd/bloc/counterbloc.dart';
import 'package:stack_ep_ttd/bloc/counterevent.dart';
import 'package:stack_ep_ttd/models/counter.dart';
import 'package:stack_ep_ttd/services/di.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        return Row(
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
        );
      },
    );
  }
}
