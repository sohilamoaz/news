import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/features/news_daily/data/datasource/remote/news_api_server.dart';
import 'package:news/features/news_daily/data/repositries/article_reposiy_impl.dart';
import 'package:news/features/news_daily/domain/repositary_interface/article_repo.dart';
import 'package:news/features/news_daily/domain/usecase/get_article.dart';
import 'package:news/features/news_daily/domain/usecase/get_saved.dart';
import 'package:news/features/news_daily/domain/usecase/remove_article.dart';
import 'package:news/features/news_daily/domain/usecase/save_article.dart';
import 'package:news/features/news_daily/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news/features/news_daily/presentation/bloc/local/local_article_bloc.dart';

import 'news_daily/data/datasource/local/app_database.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDataBase>(database);
  //dio
  sl.registerSingleton<Dio>(Dio());
  //dependencies
  sl.registerSingleton<NewsApiServer>(NewsApiServer(sl()));
  sl.registerSingleton<ArticleRepo>(ArticleRepoImplementation(sl(), sl()));
  //usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));
  sl.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()));
  sl.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()));
  sl.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()));
  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(() => LocalArticleBloc(
        sl(),
        sl(),
        sl(),
      ));
}
