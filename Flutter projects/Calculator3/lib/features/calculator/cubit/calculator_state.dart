part of 'calculator_cubit.dart';

class CalculatorState {
  final String userInput;
  final String result;

  CalculatorState({this.userInput = "",
    this.result = "0"});

  CalculatorState copyWith({
    String? userInput,
    String? result,
  }) {
    return CalculatorState(
      userInput: userInput ?? this.userInput,
      result: result ?? this.result,
    );
  }
}
