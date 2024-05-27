import 'dart:io';

void main() {
  print('Введите числа: ');
  var numbers = stdin.readLineSync() ?? ' ';
  var list = numbers.split(' ');
  dynamic listNumber = [for (String str in list) int.tryParse(str) ?? 0];
  if (listNumber case [int a, ..., int c]
      when a == 7 && c == 15 && list.length > 0 && list.length < 15) {
    print('Список соответствует требованиям: $listNumber');
  } else {
    print('Список не соответствует требованиям!');
  }
}
// 4,5,3