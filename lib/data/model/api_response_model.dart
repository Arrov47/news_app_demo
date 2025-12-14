class ApiResponseModel {
  final String status;
  final int totalResults;
  final List<dynamic> articles;
  ApiResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });
  factory ApiResponseModel.fromJson(Map<String, dynamic> json) {
    return ApiResponseModel(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: json['articles'] as List<dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles,
    };
  }
}
