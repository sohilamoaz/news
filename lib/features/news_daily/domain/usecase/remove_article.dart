import 'package:news/core/usecases/usecase.dart';
import 'package:news/features/news_daily/domain/entities/article.dart';
import 'package:news/features/news_daily/domain/repositary_interface/article_repo.dart';

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepo _articleRepo;

  RemoveArticleUseCase(this._articleRepo);
  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepo.removeArticle(params!);
  }
}
