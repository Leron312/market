import 'dart:io';

import 'student2.dart';

class Studentsgroup {
  List<Student> list = [];

  void Studentad(Student student) {
    var points = student.points;
    if (points < 2.0 || points > 4.0) {
      print('Проходной бал не соответствует!');
    } else {
      print('Проходной бал соответствует!');
    }
  }

  List <Student> searchStudentInBase(String fio) {
    for (i = 0; i < fio.length; i++) {

    }
  }

  return fio;

  ;
}
