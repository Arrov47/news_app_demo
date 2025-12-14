import 'package:news_app_demo/domain/entity/article_entity.dart';

abstract interface class ArticleState {
  final String? message;
  ArticleState({this.message});
}

class ArticleLoadingState extends ArticleState {
  ArticleLoadingState() : super();
}

class ArticleLoadedState extends ArticleState {
  List<ArticleEntity> articles;
  ArticleLoadedState({required this.articles}) : super();
}

class ArticleFailedState extends ArticleState {
  ArticleFailedState({required String message}) : super(message: message);
}
