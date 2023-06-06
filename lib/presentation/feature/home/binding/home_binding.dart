import 'package:get/get.dart';
import 'package:news_flutter/data/repository/news_repos_impl.dart';
import 'package:news_flutter/domain/repository/news_repository.dart';
import 'package:news_flutter/domain/usecase/get_news_usecase.dart';
import 'package:news_flutter/presentation/feature/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NewsRepository>(NewsReposImpl(apiDataSource: Get.find()));
    Get.put<GetNewsUseCase>(GetNewsUseCaseImpl(newsRepository: Get.find()));
    Get.put<HomeController>(HomeController(getNewsUseCase: Get.find()));
  }
}
