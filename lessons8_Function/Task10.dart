import 'dart:io';

void main() {
  print('Введите число: ');
  var input = int.parse(stdin.readLineSync()!);

  var inCube = cube(input);

  print('Куб числа равен: $inCube');
}

int cube(int input) {

  return input * input * input;
}
