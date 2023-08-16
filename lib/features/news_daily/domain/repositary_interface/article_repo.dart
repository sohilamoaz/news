import 'package:news/core/resourses/data_state.dart';
import 'package:news/features/news_daily/domain/entities/article.dart';

abstract class ArticleRepo {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
  Future<List<ArticleEntity>> getSavedArticles();
  Future<void> saveArticle(ArticleEntity article);
  Future<void> removeArticle(ArticleEntity article);
}
