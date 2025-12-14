import 'package:dio/dio.dart';
import 'package:news_app_demo/config/constants/constants.dart';
import 'package:news_app_demo/data/model/api_response_model.dart';
import 'package:news_app_demo/data/model/article_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<ApiResponseModel>> fetchHeadlines({
    @Query("country") String? country,
    @Query("category") String? category,
    @Query("apiKey") String? apiKey,
  });
}
