class Student {
  final String _fio;
  final DateTime _date;
  final double _GPA;

  Student(this._fio, this._date, this._GPA);

  double get points => _GPA;

  DateTime get date => _date;

  String get fio => _fio;

  @override
  String toString() {
    return 'Student (_fio: $_fio, _date: $_date, _points: _GPA)';
  }
}
