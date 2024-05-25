import 'dart:math';

void main() {
  final random = Random();
  final list = List.generate(50, (index) => random.nextInt(5));
  print('Result $list');

  for (int i = 0; i < list.length - 1; i++) {
    if (list[i] == 2 && list[i + 1] == 3) {
      list[i + 1] = 0;
    }
  }
  print('Result2 $list');
}