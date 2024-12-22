import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/bloc/counter/counter_bloc.dart';
import 'package:testing_project/bloc/counter/counter_event.dart';
import 'package:testing_project/bloc/counter/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
            icon: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(DecrementEvent()),
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) => Text(state.counter.toString()),
        ),
      ),
    );
  }
}
