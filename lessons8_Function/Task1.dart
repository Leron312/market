import 'dart:io';

void main() {
  print('Введите челочисленный список: ');
  var str = stdin.readLineSync()!.split(' ');
  var listInt = [for (var i in str) int.tryParse(i)!];
  var max = findMax(listInt);
  print('Big number $max');
}

int findMax(List<int> listInt) {
  var maxNumber = 0;
  for (int i = 0; i < listInt.length; i++) {
    if (listInt[i] > maxNumber) maxNumber = listInt[i];

  }
  return maxNumber;
}
