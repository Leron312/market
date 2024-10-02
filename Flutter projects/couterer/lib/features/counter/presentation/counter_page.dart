import 'package:couterer/features/counter/cubit/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CounterCubit>();

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: cubit.increment,
              child: const Icon(Icons.add),
            ),
          ),
          FloatingActionButton(
            onPressed: cubit.decrement,
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: cubit.divisionCounter,
            child: const Icon(CupertinoIcons.divide),
          ),
          FloatingActionButton(
            onPressed: cubit.multiplicationCounter,
            child: const Icon(Icons.close),
          ),
        ],
      ),
      body: const Center(
        child: CounterText(),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (BuildContext context, CounterState state) {
        return Text(
          '${state.counter}',
          style: const TextStyle(fontSize: 40),
        );
      },
    );
  }
}
