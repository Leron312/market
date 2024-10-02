import 'package:couterer/features/counter/bloc/counter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CounterBloc>();

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () => bloc.add(CounterIncrementPressed()),
              child: const Icon(Icons.add),
            ),
          ),
          FloatingActionButton(
            onPressed: () => bloc.add(CounterDecrementPressed()),
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () => bloc.add(CounterDivisionPressed()),
            child: const Icon(CupertinoIcons.divide),
          ),
          FloatingActionButton(
            onPressed: () => bloc.add(CounterMultiplicationPressed()),
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
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (BuildContext context, CounterState state) {
        return Text(
          '${state.counter}',
          style: const TextStyle(fontSize: 40),
        );
      },
    );
  }
}
