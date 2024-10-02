

import 'package:new_app/core/resources/data_state.dart';

abstract class ArticleRepository{
  Future<DataState<List<ArticleRepository>>> getNewsArticles();
}