import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/resourses/data_state.dart';
import 'package:news/features/news_daily/domain/usecase/get_article.dart';
import 'package:news/features/news_daily/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news/features/news_daily/presentation/bloc/article/remote/remote_article_state.dart';
class RemoteArticlesBloc extends Bloc<RemoteArticleEvent,RemoteArticleState>{
  final GetArticleUseCase _getArticleUseCase;
  //RemoteArticlesBloc(super.initialState);
   RemoteArticlesBloc(this._getArticleUseCase):super(const RemoteArticlesLoading()){

    on <GetArticles>(onGetArticles);
   }
   void onGetArticles(GetArticles event ,Emitter<RemoteArticleState>emit)async{
    final dataState = await _getArticleUseCase();
    if(dataState is DataSucess &&  dataState.data!.isNotEmpty){
      emit(
      RemoteArticlesDone(dataState.data!)
      );
    } if(dataState is DataFaild){
      print(dataState.error!.message);
      emit(
        RemoteArticlesError(dataState.error!)
      );
    }

   }
}