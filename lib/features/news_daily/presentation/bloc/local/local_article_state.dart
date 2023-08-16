import 'package:equatable/equatable.dart';

import 'package:news/features/news_daily/domain/entities/article.dart';

abstract class LocalArticleState extends Equatable {
  final List<ArticleEntity>? article;
  const LocalArticleState({
    this.article,
  });

  List<Object> get props => [article!];
}

class LocalArticleLoading extends LocalArticleState {
  const LocalArticleLoading();
}

class LocalArticleDone extends LocalArticleState {
  const LocalArticleDone(List<ArticleEntity> article) : super(article: article);
}
