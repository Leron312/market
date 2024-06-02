import 'dart:io';

import '../lessons8_Function/Task7.dart';

String invertingString(String input) {
  var inverted = '';

  for (var i = input.length - 1; i < 0; i++) {
    inverted += input;
  }
  return inverted;
}

void main() {
  print('Write string: ');
  var input = stdin.readLineSync();

  var invertedString = invertString(input!);

  print('Invert string: $invertedString');
}
