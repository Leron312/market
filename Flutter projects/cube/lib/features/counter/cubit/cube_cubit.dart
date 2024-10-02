import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'cube_state.dart';

class CubeCubit extends Cubit<CubeState> {
  CubeCubit()
      : super(CubeState(firstDice: 'assets/1.png', secondDice: 'assets/2.png'));

  void rolling() {
    var random1 = Random().nextInt(6) + 1;
    var random2 = Random().nextInt(6) + 1;
    emit(CubeState(
      firstDice: 'assets/$random1.png',
      secondDice: 'assets/$random2.png',
    ));
  }
}
