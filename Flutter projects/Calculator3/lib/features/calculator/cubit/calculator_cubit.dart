import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';
part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorState(userInput: "", result: "0"));

  void handleButtonPress(String text) {
    if (text == "AC") {
      emit(CalculatorState(userInput: "", result: "0"));
      return;
    }
    if (text == "C") {
      if (state.userInput.isNotEmpty) {
        emit(
          state.copyWith(
            userInput: state.userInput.substring(0, state.userInput.length - 1),
          ),
        );
        return;
      }
    }

    if (state.userInput.isNotEmpty &&
        ['+', '-', '*', '/']
            .contains(state.userInput[state.userInput.length - 1]) &&
        ['+', '-', '*', '/'].contains(text)) {
      return;
    }

    if (text == "." && state.userInput.endsWith(".")) {
      return;
    }

    if (text == "=") {
      emit(state.copyWith(result: calculate()));
      if (state.userInput.endsWith(".0")) {
        emit(state.copyWith(userInput: state.userInput.replaceAll(".0", "")));
      }
      if (state.result.endsWith(".0")) {
        emit(state.copyWith(userInput: state.result.replaceAll(".0", "")));
      }
      return;
    }
    emit(
      state.copyWith(userInput: state.userInput + text),
    );
  }

  String calculate() {
    try {
      var exp = Parser().parse(state.userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Error";
    }
  }
}
