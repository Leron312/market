import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../../../domain/enties/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity> ? articles;
  final DioException ? error;

  const RemoteArticleState({
      this.articles,
      this.error,
});


  @override
  List<Object?> get props =>
      [
        articles!,
        error!,
      ];
}
  class RemoteArticleLoading extends RemoteArticleState {
    const RemoteArticleLoading();
  }

  class RemoteArticaleDone extends RemoteArticleState{
  const RemoteArticaleDone(List<ArticleEntity> article) : super(articles: article);
  }

  class RemoteArticaleError extends RemoteArticleState{
  const RemoteArticaleError(DioException error) : super(error: error);
  }

