import 'dart:io';

void main() {
  winter();
  winter2();
}

void winter() {
  var numberMonth = stdin.readLineSync() ?? ' ';
  var month = int.tryParse(numberMonth) ?? 0;
  var seasons = switch (month) {
    1 || 2 || 12 => 'Зима',
    <= 1 => 'Январь',
    <= 2 => 'Февраль',
    <= 12 => 'Декабрь',
    _ => 'Не коректный ввод',
  };
  print(seasons);
}

void winter2() {
  var numberMonth = stdin.readLineSync() ?? ' ';
  var month = int.tryParse(numberMonth) ?? 0;
  if (month <= 0)
    print('Error');
  else if (month <= 1 || month <= 2 || month <= 12)
    print('Зима');
  else if (month <= 3 || month <= 4 || month <= 5)
    print('Весна');
  else if (month <= 6 || month <= 7 || month <= 8)
    print('Лето');
  else if (month <= 9 || month <= 10 || month <= 11)
    print('Осень');
}
