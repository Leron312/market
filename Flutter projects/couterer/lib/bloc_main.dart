import 'package:couterer/features/counter/presentation/counter_bloc_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/counter/bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: const CounterBlocPage(),
      ),
    );
  }
}

// class CounterWidget extends StatelessWidget {
//   const CounterWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {


  // }
  //   // final notifier = context.read<CounterNotifier>();
  // }
//     return Scaffold(
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: FloatingActionButton(
//               onPressed: notifier.incrementCounter,
//               child: const Icon(Icons.add),
//             ),
//           ),
//           FloatingActionButton(
//             onPressed: notifier.decrementCounter,
//             child: const Icon(Icons.remove),
//           ),
//           FloatingActionButton(
//             onPressed: notifier.divisionCounter,
//             child: const Icon(CupertinoIcons.divide),
//           ),
//           FloatingActionButton(
//             onPressed: notifier.multiplicationCounter,
//             child: const Icon(Icons.close),
//           ),
//         ],
//       ),
//       body: Center(
//         child: CounterText(),
//       ),
//     );
//   }
//
// }
//
// class CounterText extends StatelessWidget {
//   const CounterText({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<CounterNotifier>(
//       builder: (BuildContext context, CounterNotifier value, Widget? child) {
//         return Text(
//           '${value.counter}',
//           style: const TextStyle(fontSize: 40),
//         );
//       },
//     );
//   }
// }

// class CounterText extends StatelessWidget {
//   const CounterText({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final counter = context.watch<CounterNotifier>().counter;
//     return Text(
//       '$counter',
//       style: const TextStyle(fontSize: 40),
//     );
//   }
// }

