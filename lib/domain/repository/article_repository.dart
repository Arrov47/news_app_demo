import 'package:news_app_demo/config/util/data_state.dart';
import 'package:news_app_demo/domain/entity/article_entity.dart';

abstract interface class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}