import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/data/api/home_api.dart';
import '../../../marketApi/data/models/market_info/market_products_dto.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeApi homeApi;

  HomeBloc(this.homeApi) : super(const HomeState(producs: [])) {
    print('homeApi');
    on<HomeAllDataLoad>(_onDataLoading);
  }

  void _onDataLoading(HomeAllDataLoad event, Emitter<HomeState> emit) async {
    final products = await homeApi.loadProducts();

    emit(state.copyWith(producs: products));
  }
}
