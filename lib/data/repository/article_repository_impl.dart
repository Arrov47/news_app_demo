import 'package:news_app_demo/config/util/data_state.dart';
import 'package:news_app_demo/data/model/article_model.dart';
import 'package:news_app_demo/domain/entity/article_entity.dart';
import 'package:news_app_demo/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }

}