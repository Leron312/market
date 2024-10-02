
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
 final int index;

 const HomeState({required this.index});

 HomeState copywith({int? index}){
   return HomeState(index: index ?? this.index);

 }

 @override
  List<Object?> get props => [index];

}