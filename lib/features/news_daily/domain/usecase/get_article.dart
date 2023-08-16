import 'package:news/core/resourses/data_state.dart';
import 'package:news/core/usecases/usecase.dart';
import 'package:news/features/news_daily/domain/entities/article.dart';
import 'package:news/features/news_daily/domain/repositary_interface/article_repo.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{
  final ArticleRepo _articleRepo;

  GetArticleUseCase(this._articleRepo);
  @override
  Future <DataState<List<ArticleEntity>>>call({ void params}) {
    return _articleRepo.getNewsArticles();

   
  }

}