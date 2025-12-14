import 'package:news_app_demo/config/usecases/usecase.dart';
import 'package:news_app_demo/domain/entity/article_entity.dart';
import 'package:news_app_demo/domain/repository/article_repository.dart';

class GetDailyNewsUcase implements UseCase<List<ArticleEntity>, void> {
  ArticleRepository articleRepository;

  GetDailyNewsUcase({required this.articleRepository});

  @override
  Future<List<ArticleEntity>> call(void params) async {
    final net = await articleRepository.getNewsArticles();
    if (net.data != null) {
      return net.data!;
    } else {
      throw net.error!;
    }
  }
}
