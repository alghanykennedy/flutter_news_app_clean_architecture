import 'package:get/get.dart';
import 'package:news_flutter/data/datasource/api_datasource.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiDataSource());
  }
}
