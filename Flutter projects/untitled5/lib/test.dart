// import 'package:flutter/material.dart';
//
// void main() => runApp(const ScreenWidget());
//
// class ScreenWidget extends StatelessWidget {
//   const ScreenWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Center(
//             child: Text('Container Widget'),
//           ),
//         ),
//         body: const SimpleWidget(),
//       ),
//     );
//   }
// }
//
// class SimpleWidget extends StatelessWidget {
//   const SimpleWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 300,
//         width: double.infinity,
//         alignment: Alignment.center,
//         margin: const EdgeInsets.all(50),
//         decoration: const BoxDecoration(
//              color: Colors.yellow,
//             image: DecorationImage(
//               image: NetworkImage(
//                 'https://img.freepik.com/free-photo/mountainous-nature-landscape-with-lake_23-2150705757.jpg?w=740&t=st=1722158579~exp=1722159179~hmac=e53e1e0c0629b9a81d5d2f3af863eb5422e1b8ad278ddd1a130c61e348c38f1a',
//               ),
//               fit: BoxFit.cover,
//             ),
//             shape: BoxShape.circle,
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black45,
//                   offset: Offset(5, -5),
//                   blurRadius: 5,
//                   spreadRadius: 5)
//             ]),
//         child: const Text(
//           'Panda',
//           style: TextStyle(
//             color: Colors.green,
//             fontSize: 54,
//           ),
//         ),
//       ),
//     );
//   }
// }