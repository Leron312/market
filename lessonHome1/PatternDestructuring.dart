void main() {
  final myList = [1, 2];
  var a = myList[0];
  var b = myList[1];
  print('a: $a, b: $b');

  var [a1, b1] = myList;
  print('a1: $a1, b1: $b1');
  destructuring2();
  destructuring3();
  magic();
  destructuringCopy();
}

void destructuring2() {
  var myList1 = [1, 2, 3, 4, 5];
  final [a, _, _, b, _] = myList1;
  print('a2: $a, b2: $b');
}

void destructuring3() {
  var myList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  final [a, ..., b] = myList;
  print('a3: $a, b3: $b');
}

void magic() {
  var listA = [1, 2, 3];
  var listB = [4, 5, 6];
  var listC = [7, 8, 9];

  [listA, listB, listC] = [listC, listB, listA];
  print(listA);
  print(listB);
  print(listC);
}

void destructuringCopy() {

}
