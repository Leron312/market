
part of 'home_bloc.dart';


class HomeState extends Equatable{
  final List<MarketProductsDto> producs;

  const HomeState({required this.producs});

  HomeState copyWith ({List<MarketProductsDto>? producs}){
    return HomeState(producs: producs ?? this.producs);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [producs];
}

