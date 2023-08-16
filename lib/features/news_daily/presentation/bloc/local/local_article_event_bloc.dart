import 'package:equatable/equatable.dart';

import 'package:news/features/news_daily/domain/entities/article.dart';

abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;
  const LocalArticleEvent({
    this.article,
  });

  @override
  List<Object> get props => [article!];
}

class GetSavedArticle extends LocalArticleEvent {
  const GetSavedArticle();
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(ArticleEntity article) : super(article: article);
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(ArticleEntity article) : super(article: article);
}
