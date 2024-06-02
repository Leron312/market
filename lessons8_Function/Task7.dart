import 'dart:io';

void main() {
  print('Введите строку: ');
  var input = stdin.readLineSync()!;

  var invertedString = invertString(input);

  print('Инвертированная строка: $invertedString');
}

String invertString(String input) {
  var inverted = '';

  for (var i = input.length - 1; i >= 0; i--) {
    inverted += input[i];
  }

  return inverted;
}
