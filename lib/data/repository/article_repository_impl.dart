import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_demo/config/constants/constants.dart';
import 'package:news_app_demo/config/util/data_state.dart';
import 'package:news_app_demo/data/data_source/remote/news_api_service.dart';
import 'package:news_app_demo/data/model/article_model.dart';
import 'package:news_app_demo/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  NewsApiService apiService;
  ArticleRepositoryImpl({required this.apiService});
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    final net = await apiService.fetchHeadlines(
      country: Constants.country,
      category: Constants.category,
      apiKey: Constants.apiKey,
    );
    if (net.response.statusCode == HttpStatus.ok) {
      return DataSuccess(
        net.data.articles
            .map<ArticleModel>((e) => ArticleModel.fromJson(e))
            .toList(),
      );
    } else {
      return DataFailed(
        DioException(
          requestOptions: net.response.requestOptions,
          response: net.response,
          error: net.response.statusCode,
          message: net.response.statusMessage,
        ),
      );
    }
  }
}
