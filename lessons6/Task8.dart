import 'dart:io';

void main() {
  print('Введите число в диапозоне от -15 до 10: ');
  var num = int.parse(stdin.readLineSync()!);

  if (num >= -15 && num <= 10) {
   print('Yes!');
  } else {
    print('No!');
  }

  switch (num) {
    case >= -15 && <= 10:
      print('YES!');

    default:
      print('NO!');

  }
}