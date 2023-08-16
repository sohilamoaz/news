import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/news_daily/domain/usecase/get_saved.dart';
import 'package:news/features/news_daily/domain/usecase/remove_article.dart';
import 'package:news/features/news_daily/domain/usecase/save_article.dart';
import 'package:news/features/news_daily/presentation/bloc/local/local_article_event_bloc.dart';
import 'package:news/features/news_daily/presentation/bloc/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase, this._saveArticleUseCase,
      this._removeArticleUseCase)
      : super(const LocalArticleLoading()) {
    on<GetSavedArticle>(onGetSavedArticles);
    on<RemoveArticle>(onRemoveArticle);
    on<SaveArticle>(onSavedArticle);
  }

  void onGetSavedArticles(
      GetSavedArticle event, Emitter<LocalArticleState> emit) async {
    final article = await _getSavedArticleUseCase();
    // ignore: invalid_use_of_visible_for_testing_member
    emit(LocalArticleDone(article));
  }

  void onRemoveArticle(
      RemoveArticle removeArticle, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);
    final article = await _getSavedArticleUseCase();
    emit(LocalArticleDone(article));
  }

  void onSavedArticle(
      SaveArticle savedArticle, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: savedArticle.article);
    final article = await _getSavedArticleUseCase();
    emit(LocalArticleDone(article));
  }
}
