abstract interface class ArticleEvent {
  final String? message;
  ArticleEvent({this.message});
}

class FetchArticlesEvent extends ArticleEvent {
  FetchArticlesEvent() : super();
}

class RefreshArticlesEvent extends ArticleEvent {
  RefreshArticlesEvent() : super();
}

class RemoveArticleEvent extends ArticleEvent {
  final String articleId;
  RemoveArticleEvent({required this.articleId}) : super();
}

class AddFavouriteArticleEvent extends ArticleEvent {
  final String articleId;
  AddFavouriteArticleEvent({required this.articleId}) : super();
}
