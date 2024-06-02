import 'dart:io';

int DaysInMonth(int month) {
  if (1 > month || month > 12) {
    return 0;
  }

  const daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  return daysInMonth[month - 1];
}

void main() {
  print('Введите номер месяца: ');
  var input = int.parse(stdin.readLineSync()!);

  var days = DaysInMonth(input);

  print('В этом месяце $days дней.');
}
