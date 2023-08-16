import 'package:news/core/usecases/usecase.dart';
import 'package:news/features/news_daily/domain/entities/article.dart';
import 'package:news/features/news_daily/domain/repositary_interface/article_repo.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepo _articleRepo;

  GetSavedArticleUseCase(this._articleRepo);
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepo.getSavedArticles();
  }
}
