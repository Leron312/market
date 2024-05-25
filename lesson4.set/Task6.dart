import 'dart:convert';

void main() {
  var record = (23, 89, pef: 'Oo', pruf: 3.976);

  var firstValue = record.$1;
  var secondValue = record.$2;
  
  var result = firstValue - secondValue;

  print(result);

}