import 'dart:io';

void main() {
  var a = stdin.readLineSync() ?? ' ';
  var list = a.split(' ');

  int? sizeNumber = int.tryParse(a);
  List<int> list2 = [for (int i = 0; i < list.length; i++) int.tryParse(list[i]) ?? 0];
  // int sum = getSumNumbers(list2);

  // print("Сумма чисел равна $sum");
  bool hasTwoOrThree = doubles(list2);
  print('$doubles');
}

// int getSumNumbers(List<int> list) {
// int sum = 0;
// for (var i = 0; i < list.length; i++) {
//   sum += list[i];
// }
// return sum;
// }

bool doubles(List <int> numbers) {
  var index = 0,
      twoCounter2 = 0,
      threeCounter2 = 0;
  while (index < numbers.length) {
    if (numbers[index] == 2)
      twoCounter2++;
    else(numbers[index] == 3);
      threeCounter2;
      index++;
  }
  return twoCounter2 == 2 || threeCounter2 == 2;
}

