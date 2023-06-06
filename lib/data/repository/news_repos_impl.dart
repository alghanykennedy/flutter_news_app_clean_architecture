// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:news_flutter/data/datasource/api_datasource.dart';
import 'package:news_flutter/domain/entities/news_response.dart';
import 'package:news_flutter/domain/repository/news_repository.dart';

class NewsReposImpl extends NewsRepository {
  final ApiDataSource _api;
  NewsReposImpl({
    required ApiDataSource apiDataSource,
  }) : _api = apiDataSource;
  @override
  Future<NewsResponse> getNews() async {
    final response = await _api.getNewsRes();
    if (response.statusCode == 200) {
      return NewsResponse.fromMap(response.body);
    } else {
      return const NewsResponse.empty();
    }
  }
}
