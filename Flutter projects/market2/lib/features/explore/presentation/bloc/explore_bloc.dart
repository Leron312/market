import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market2/features/marketApi/data/models/market_info/market_categories_dto.dart';

import '../../../api/data/api/category_api.dart';

part 'explore_event.dart';

part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final CategoryApi explorerApi;

  ExploreBloc(this.explorerApi) : super(const ExploreState(categories: [])) {
    print('homeApi');
    on<CategoryAllDataLoad>(_onDataLoading);
  }

  void _onDataLoading(CategoryAllDataLoad event, Emitter<ExploreState> emit) async {
    final categories = await explorerApi.loadCategories();

    emit(state.copyWith(categories: categories));
  }
}
