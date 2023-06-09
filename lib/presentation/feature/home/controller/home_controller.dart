import 'package:get/get.dart';
import 'package:news_flutter/domain/entities/article.dart';
import 'package:news_flutter/domain/entities/news_response.dart';
import 'package:news_flutter/domain/usecase/get_news_usecase.dart';

class HomeController extends GetxController with StateMixin<List<Article>> {
  final GetNewsUseCase _getNewsUseCase;
  HomeController({
    required GetNewsUseCase getNewsUseCase,
  }) : _getNewsUseCase = getNewsUseCase;

  List<Article> articles = [];
  NewsResponse newsResponse = const NewsResponse.empty();

  @override
  void onReady() {
    getNews();
    super.onReady();
  }

  Future<void> getNews() async {
    change(articles, status: RxStatus.loading());
    final result = await _getNewsUseCase.call(null);
    if (result.isSuccess) {
      articles = result.news.articles;
      if (result.news.articles.isEmpty) {
        change(articles, status: RxStatus.empty());
      } else {
        change(articles, status: RxStatus.success());
      }
    } else {
      articles = result.news.articles;
      change(articles, status: RxStatus.error());
    }
  }
}
