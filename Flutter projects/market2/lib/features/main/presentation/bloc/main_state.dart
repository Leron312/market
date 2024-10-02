
part of 'main_cubit.dart';

class HomeState extends Equatable{
  final int index;

  const HomeState ({required this.index});

  HomeState copyWith({int? index}){
    return HomeState(index: index ?? this.index);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}