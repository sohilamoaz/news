import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news/core/constance/constance.dart';
import 'package:news/features/news_daily/data/datasource/local/app_database.dart';
import 'package:news/features/news_daily/data/datasource/remote/news_api_server.dart';
import 'package:news/features/news_daily/data/models/article_model.dart';
import 'package:news/core/resourses/data_state.dart';
import 'package:news/features/news_daily/domain/entities/article.dart';
import 'package:news/features/news_daily/domain/repositary_interface/article_repo.dart';

class ArticleRepoImplementation implements ArticleRepo {
  final NewsApiServer _newsApiServer;
  final AppDataBase _appDataBase;

  ArticleRepoImplementation(this._newsApiServer, this._appDataBase);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpReponse = await _newsApiServer.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );
      if (httpReponse.response.statusCode == HttpStatus.ok) {
        return DataSucess(httpReponse.data);
      } else {
        return DataFaild(DioError(
            error: httpReponse.response.statusMessage,
            response: httpReponse.response,
            type: DioErrorType.response,
            requestOptions: httpReponse.response.requestOptions));
      }
    } on DioError catch (e) {
      return DataFaild(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() async {
    return _appDataBase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDataBase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDataBase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
