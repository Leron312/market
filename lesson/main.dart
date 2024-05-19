import 'dart:io';

void main() {
  print("Введите 3 числа");

  String? a = stdin.readLineSync();
  int? firstNumber = int.tryParse(a!) ?? 0;

  String? b = stdin.readLineSync();
  int? secondNumber = int.tryParse(b!) ?? 0;

  String? c = stdin.readLineSync();
  int? thirdNumber = int.tryParse(c!) ?? 0;

  var record = (firstNumber, secondNumber, thirdNumber);
  print(record);

  (int maxNumber, int minNumbers) record1 = maxNumberAndMinNumber(record);
  print(record1);

}

(int, int) maxNumberAndMinNumber((int, int, int) numbers) {
  int maxNumber = numbers.$1;
  int minNumber = numbers.$1;

  if (numbers.$2 > maxNumber) maxNumber = numbers.$2;
  if (numbers.$3 > maxNumber) maxNumber = numbers.$3;

  if (numbers.$2 < minNumber) minNumber = numbers.$2;
  if (numbers.$3 < minNumber) minNumber = numbers.$3;

  return(maxNumber, minNumber);
}
