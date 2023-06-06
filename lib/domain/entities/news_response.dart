// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:news_flutter/domain/entities/article.dart';

class NewsResponse extends Equatable {
  final String status;
  final int totalResults;
  final List<Article> articles;
  const NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  const NewsResponse.empty({
    this.articles = const [],
    this.totalResults = 0,
    this.status = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsResponse.fromMap(Map<String, dynamic> map) {
    return NewsResponse(
      status: map['status'],
      totalResults: map['totalResults'],
      articles:
          List<Article>.from(map['articles']?.map((x) => Article.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsResponse.fromJson(String source) =>
      NewsResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [status, totalResults, articles];
}
