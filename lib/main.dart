import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_demo/presentation/bloc/daily_news/article_bloc.dart';
import 'package:news_app_demo/presentation/pages/daily_news.dart';
import 'package:news_app_demo/service_locator.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ArticleBloc>(),
      child: const MaterialApp(home: DailyNewsPage()),
    );
  }
}
