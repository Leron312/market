import 'dart:convert';

void main() {
  var record = (23, 89, pef: 'Oo', pruf: 3.976);

  var firstValue = record.pef;
  var secondValue = record.pruf;

  print(firstValue);
  print(secondValue);
}