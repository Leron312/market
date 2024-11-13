import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_product_event.dart';

part 'search_product_state.dart';

const apiUrl = 'https://api.escuelajs.co/api/v1/products';

EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  SearchProductBloc() : super(SearchProductState()) {
    on<SearchProductEvent>(_onSearch);
  }

  final _httpClient = Dio();

  _onSearch(SearchProductEvent event, Emitter<SearchProductState> emit) async {
   if(event.query.length < 3) return;
    final result = await _httpClient.get(
      apiUrl,
      queryParameters: {
        'q': event.query,
      },
    );
    emit(SearchProductState(products: result.data['title']));
  }
}
