
import 'package:flutter_news_app/model/source_model.dart';

class SourcesResponseModel {
  SourcesResponseModel({
      this.status, 
      this.sources,});

  SourcesResponseModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
  String? status;
  List<Source>? sources;
SourcesResponseModel copyWith({  String? status,
  List<Source>? sources,
}) => SourcesResponseModel(  status: status ?? this.status,
  sources: sources ?? this.sources,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "abc-news"
/// name : "ABC News"
/// description : "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com."
/// url : "https://abcnews.go.com"
/// category : "general"
/// language : "en"
/// country : "us"

