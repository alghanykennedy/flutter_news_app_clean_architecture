import 'package:news_flutter/domain/entities/news_response.dart';

abstract class NewsRepository {
  Future<NewsResponse> getNews();
}
