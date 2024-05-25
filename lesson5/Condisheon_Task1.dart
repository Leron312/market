import 'dart:io';


void main () {
  print('Ввелите строку:');
  var text = stdin.readLineSync() ?? ' ';
  if (text.length > 0 && text.length < 15 && text[0] =='W') {
     print('Строка удовлетворяет требованиям: $text');
  } else {
    print('Pattern on matched');
  }
}