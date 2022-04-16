import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_ep_ttd/bloc/counterstate.dart';

class Printdata extends StatelessWidget {
  const Printdata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
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
    });
  }
}
