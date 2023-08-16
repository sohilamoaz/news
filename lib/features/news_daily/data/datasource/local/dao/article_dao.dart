

import 'package:floor/floor.dart';
import 'package:news/features/news_daily/data/models/article_model.dart';

@dao
abstract class ArticleDao{
  @Insert()

Future<void> insertArticle(ArticleModel article);

@delete
Future<void> deleteArticle (ArticleModel articleModel);

@Query('SELECT * FROM article')
Future<List<ArticleModel>> getArticles();
}