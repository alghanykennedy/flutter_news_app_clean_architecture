// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, avoid_renaming_method_parameters
import 'package:news_flutter/domain/entities/news_response.dart';
import 'package:news_flutter/domain/repository/news_repository.dart';
import 'package:news_flutter/domain/usecase/usecase.dart';

abstract class GetNewsUseCase extends BaseUseCase<GetNewsResult, void> {}

class GetNewsUseCaseImpl extends GetNewsUseCase {
  final NewsRepository _repository;
  GetNewsUseCaseImpl({
    required NewsRepository newsRepository,
  }) : _repository = newsRepository;
  @override
  Future<GetNewsResult> call(void noParams) async {
    try {
      return GetNewsResult(news: await _repository.getNews());
    } on Exception catch (e) {
      return GetNewsResult(news: const NewsResponse.empty(), exception: e);
    }
  }
}

class GetNewsResult extends UseCaseResult {
  final NewsResponse news;
  @override
  final Exception? exception;
  GetNewsResult({
    required this.news,
    this.exception,
  }) : super(exception: exception);
}
