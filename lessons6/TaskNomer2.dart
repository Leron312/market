import 'dart:io';

void main() {
  print('Введите первое число: ');
  var vul1 = int.parse(stdin.readLineSync()!);

  print('Введите второе число: ');
  var vul2 = int.parse(stdin.readLineSync() ?? '');

  if ((vul1 * vul2) > 400) {
    print('Произведение двух чисел равно: ${vul1 * vul2}');
  } else {
    print('Сумма двух чисел равна: ${vul1 + vul2}');
  }

  switch ((vul1 * vul2) < 400) {
    case true:
      print('Сумма: ${vul1 + vul2}');
      break;
    case false:
      print('Произведение: ${vul1 * vul2}');
      break;
  }
}