
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:new_app/features/daily_news/data/repository/articale_repository_impl.dart';
import 'package:new_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:new_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:new_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
   sl.registerSingleton<Dio>(Dio());
   sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
   sl.registerSingleton<ArticleRepository>(
     ArticaleRepositoryimpl(sl())
   );
   sl.registerSingleton<GetArticleUseCase>(
     GetArticleUseCase(sl())
   );
   sl.registerFactory<RemoteArticleBloc>(
       ()=> RemoteArticleBloc(sl())
   );

}