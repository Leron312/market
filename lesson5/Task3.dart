import 'dart:io';

void main() {
  print('Введите Map <int, String> в виде "ключ : значение"');
  var keyValue = stdin.readLineSync()!.split(' ');

  Map<int, String> map = {};
  for (var meaning in keyValue) {
    var kVal = meaning.split(':');
    map[int.parse(kVal[0])] = kVal[1];
  }

  print('map: $map');

  if (map.length > 5 && map.containsValue('999') || map.containsValue('666')) {
    print ('Map: $map');
  } else {
    print('Pattern no matched');
  }
}
