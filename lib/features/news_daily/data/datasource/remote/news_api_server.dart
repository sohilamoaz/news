import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:news/core/constance/constance.dart';
import 'package:news/features/news_daily/data/models/article_model.dart';

part 'news_api_server.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiServer {
  factory NewsApiServer(Dio dio) = _NewsApiServer;
  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
