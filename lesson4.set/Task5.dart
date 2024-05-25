import 'dart:convert';

void main() {
  var record = (23, 89, pef: 'Oo', pruf: 3.976);

  var secondValue = record.$2;

  var prufValue = record.pruf;

  var result = secondValue * prufValue;

  print(result);
}


