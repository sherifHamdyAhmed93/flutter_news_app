import 'package:flutter_news_app/model/article_model.dart';

/// status : "ok"
/// totalResults : 10
/// articles : [{"-\"source\"":{"id":"bbc-news","name":"BBC News"},"author":"BBC News","title":"What does science tell us about boxing’s gender row?","description":"Research is shedding light on different chromosomal make-ups and what advantages they may bring to sport.","url":"https://www.bbc.co.uk/news/articles/crlr8gp813ko","urlToImage":"https://ichef.bbci.co.uk/news/1024/branded_news/7bfc/live/dc3fca20-5599-11ef-8f0f-0577398c3339.png","publishedAt":"2024-08-10T00:52:11.0025483Z","content":"There are some people born with XY chromosomes who have lost what Dr Hilton calls the \"make-male\" gene.\r\nThese people dont make testosterone. They develop a very typical female anatomy, Dr Hilton say… [+3701 chars]"}]

class ArticlesResponseModel {
  ArticlesResponseModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  ArticlesResponseModel.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    code = json['code'];
    message = json['message'];

    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }
  String? status;
  int? totalResults;
  List<Article>? articles;
  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    map['message'] = message;
    map['code'] = code;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
