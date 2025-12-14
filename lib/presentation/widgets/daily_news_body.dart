import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_demo/presentation/bloc/daily_news/article_bloc.dart';
import 'package:news_app_demo/presentation/bloc/daily_news/article_events.dart';
import 'package:news_app_demo/presentation/bloc/daily_news/article_states.dart';

class DailyNewsBody extends StatefulWidget {
  const DailyNewsBody({super.key, required this.articleBloc});
  final ArticleBloc articleBloc;

  @override
  State<DailyNewsBody> createState() => _DailyNewsBodyState();
}

class _DailyNewsBodyState extends State<DailyNewsBody> {
  @override
  void initState() {
    widget.articleBloc.add(FetchArticlesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoadedState) {
          final articles = state.articles;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ListTile(
                title: Text(article.title),
                subtitle: Text(article.description ?? ''),
              );
            },
          );
        } else if (state is ArticleFailedState) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Center(
            child: CupertinoActivityIndicator(radius: 40, color: Colors.blue),
          );
        }
      },
    );
  }
}
