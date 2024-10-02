import 'package:bloc/bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState>{

  HomeCubit() : super(const HomeState(index: 0));

  void changeBottonNavItem(int index) => emit (HomeState(index: index));
}