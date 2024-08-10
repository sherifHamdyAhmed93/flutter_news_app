import 'dart:convert';

import 'package:flutter_news_app/constants/app_constants.dart';
import 'package:flutter_news_app/model/articles_response_model.dart';
import 'package:flutter_news_app/model/sources_response_model.dart';
import 'package:http/http.dart' as http;

class ApiManager{

  static Future<SourcesResponseModel> getSourcesByCategory(String categoryName) async {
    var params = {
      'category':categoryName,
      'apiKey':AppConstants.apiKey,
    };
    var uri = Uri.https(AppConstants.baseUrl,'/v2/top-headlines/sources',params);
    print(uri);
    try{
      var response = await http.get(uri);
      var body = response.body;
      var json = jsonDecode(body);
      var data = SourcesResponseModel.fromJson(json);
      return data;
    }catch (e){
      print(e.toString());
      throw e;
    }
  }

  static Future<ArticlesResponseModel> getArticlesBySource(String sourceName) async {
    var params = {
      'sources':sourceName,
      'apiKey':AppConstants.apiKey,
    };
    var uri = Uri.https(AppConstants.baseUrl,'/v2/top-headlines',params);
    print(uri);
    try{
      var response = await http.get(uri);
      var body = response.body;
      var json = jsonDecode(body);
      var data = ArticlesResponseModel.fromJson(json);
      return data;
    }catch (e){
      print(e.toString());
      throw e;
    }
  }


}

