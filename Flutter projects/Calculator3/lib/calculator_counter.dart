// import 'package:flutter/cupertino.dart';
// import 'package:math_expressions/math_expressions.dart';
//
// class CalculatorNotifier extends ChangeNotifier {
//   String userInput = "";
//   String result = "0";
//
//   void handleButtonPress(String text) {
//     if (text == "AC") {
//       userInput = "";
//       result = "0";
//       notifyListeners();
//       return;
//     }
//     if (text == "C") {
//       if (userInput.isNotEmpty) {
//         userInput = userInput.substring(0, userInput.length - 1);
//         notifyListeners();
//         return;
//       } else {
//         return;
//       }
//     }
//
//     if (userInput.isNotEmpty &&
//         ['+', '-', '*', '/'].contains(userInput[userInput.length - 1]) &&
//         ['+', '-', '*', '/'].contains(text)) {
//       return;
//     }
//
//     if (text == "." && userInput.endsWith(".")) {
//       return;
//     }
//
//     if (text == "=") {
//       result = calculate();
//       if (userInput.endsWith(".0")) {
//         userInput = userInput.replaceAll(".0", "");
//       }
//       if (result.endsWith(".0")) {
//         result = result.replaceAll(".0", "");
//       }
//       notifyListeners();
//       return;
//     }
//
//     userInput += text;
//     notifyListeners();
//   }
//
//   String calculate() {
//     try {
//       var exp = Parser().parse(userInput);
//       var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
//       return evaluation.toString();
//     } catch (e) {
//       return "Error";
//     }
//   }
// }
