// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:news/features/news_daily/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioError ? error;
  const RemoteArticleState({
    this.articles,
    this.error,
  });
  @override
  List<Object> get props =>[articles!,error!];

}
class RemoteArticlesLoading extends RemoteArticleState{
  const RemoteArticlesLoading();
}
class RemoteArticlesDone extends RemoteArticleState{
  const RemoteArticlesDone(List<ArticleEntity> article):super(articles: article);
}

class RemoteArticlesError extends RemoteArticleState{

  const RemoteArticlesError(DioError error):super(error: error);
}
