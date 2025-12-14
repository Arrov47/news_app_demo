import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:news_app_demo/data/data_source/remote/news_api_service.dart';
import 'package:news_app_demo/data/repository/article_repository_impl.dart';
import 'package:news_app_demo/domain/repository/article_repository.dart';
import 'package:news_app_demo/presentation/bloc/daily_news/article_bloc.dart';
import 'package:news_app_demo/presentation/usecases/get_daily_news_ucase.dart';

final sl = GetIt.instance;
final logger = Logger(printer: PrettyPrinter());
final dio = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ),
);

Future<void> initializeDependencies() async {
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        logger.i('Request[${options.method}] => PATH: ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.i(
          'Response[${response.statusCode}] => PATH: ${response.requestOptions.path} | DATA ${response.data}',
        );
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        logger.e(
          'Error[${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
        );
        return handler.next(e);
      },
    ),
  );

  sl.registerSingleton<Dio>(dio);

  sl.registerSingleton<NewsApiService>(NewsApiService(sl<Dio>()));

  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(apiService: sl<NewsApiService>()),
  );

  sl.registerSingleton<GetDailyNewsUcase>(
    GetDailyNewsUcase(articleRepository: sl<ArticleRepository>()),
  );

  sl.registerFactory<ArticleBloc>(
    () => ArticleBloc(getDailyNewsUcase: sl<GetDailyNewsUcase>()),
  );
}
