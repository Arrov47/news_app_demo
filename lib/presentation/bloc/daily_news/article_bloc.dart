import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_demo/presentation/bloc/daily_news/article_events.dart';
import 'package:news_app_demo/presentation/bloc/daily_news/article_states.dart';
import 'package:news_app_demo/presentation/usecases/get_daily_news_ucase.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetDailyNewsUcase getDailyNewsUcase;

  ArticleBloc({required this.getDailyNewsUcase}) : super(ArticleLoadingState()) {
    on<FetchArticlesEvent>((event, emit) async {
      emit(ArticleLoadingState());
      try {
        final articles = await getDailyNewsUcase.call(null);
        emit(ArticleLoadedState(articles: articles));
      } catch (e) {
        emit(ArticleFailedState(message: e.toString()));
      }
    });
  }
}