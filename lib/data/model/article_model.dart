import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_demo/domain/entity/article_entity.dart';
 
part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    // required super.source,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
