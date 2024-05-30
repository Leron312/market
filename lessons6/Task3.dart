import 'dart:io';

void main() {
  print('Введите список от шести цифр через пробел: ');
  var input = stdin.readLineSync()!.split(' ');
  var list = input.map((element) => int.parse(element)).toList();

  if (list.length < 6) {
    print('Список должен содержать не меньше 6 чисел!!!');
    return;
  }


  print(list.first == list.last ? 'True' : 'False');


  switch (list.first == list.last) {
    case true:
      print('TRUE');
      break;
    case false:
      print('FALSE');
      break;
  }

  if (list.first == list.last) {
    print('true');
  } else {
    print('false');
  }
}
