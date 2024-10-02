
part of 'explore_bloc.dart';


class ExploreState extends Equatable{
  final List<MarketCategoriesDto> categories;

  const ExploreState({required this.categories});

  ExploreState copyWith ({List<MarketCategoriesDto>? categories}){
    return ExploreState(categories: categories ?? this.categories);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [categories];
}

