import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_demo/presentation/bloc/daily_news/article_bloc.dart';
import 'package:news_app_demo/presentation/bloc/daily_news/article_events.dart';
import 'package:news_app_demo/presentation/widgets/daily_news_body.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final articleBloc = context.read<ArticleBloc>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              articleBloc.add(FetchArticlesEvent());
            },
            icon: Icon(Icons.refresh),
          ),
        ],
        title: const Text('Daily News'),
        centerTitle: true,
      ),

      body: DailyNewsBody(articleBloc: articleBloc),
    );
  }
}
