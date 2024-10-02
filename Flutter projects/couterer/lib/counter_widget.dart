import 'package:flutter/cupertino.dart';

class CounterNotifier extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    if(counter > 0){
      _counter--;
    }
    notifyListeners();
  }

  void divisionCounter() {
    if (counter > 0) _counter = _counter ~/ 2;
    notifyListeners();
  }

  void multiplicationCounter() {
    if (_counter != 0) _counter *= 2;
    notifyListeners();
  }
}