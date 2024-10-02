import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';
class HomeCubit extends Cubit<HomeState>{

 HomeCubit() : super(const HomeState(index: 0));

 void changeBottonNavItem(int index) => emit(HomeState(index: index));

}