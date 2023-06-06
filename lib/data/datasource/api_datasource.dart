import 'package:get/get.dart';

class ApiDataSource extends GetConnect {
  static const url =
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=bad036bdc2974b8c88681a80e58e7561';

  Future<Response> getNewsRes() async {
    return await get(url);
  }
}
