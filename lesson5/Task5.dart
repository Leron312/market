import 'dart:io';

void main() {
  print('Введите список чисел, разделяя их через пробел: ');
  var numbers = stdin.readLineSync()!.split(' ');
  var list = numbers.map((element) => int.parse(element)).toList();

  if (list.first == list.last && list.reduce((a, b) => a + b) > 40) {
    print('Список: $list');
  } else {
    print('Pattern no matched');
  }
}
