import 'dart:convert';

import 'package:flutter_news_app/constants/app_constants.dart';
import 'package:flutter_news_app/model/articles_response_model.dart';
import 'package:flutter_news_app/model/sources_response_model.dart';
import 'package:flutter_news_app/shared_preference/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiManager{
  static final PreferencesService _preferencesService = PreferencesService();

  static Future<SourcesResponseModel?> getSourcesByCategory(String categoryName) async {
    final String lang = await _preferencesService.getLang() ?? 'en';

    var params = {
      'category':categoryName,
      'apiKey':AppConstants.apiKey,
      'language': lang
    };
    var uri = Uri.https(AppConstants.baseUrl,AppConstants.sourcesApi,params);
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

  static Future<ArticlesResponseModel?> getArticlesBySource(String sourceName) async {
    final String lang = await _preferencesService.getLang() ?? 'en';
    var params = {
      'pageSize' : AppConstants.pageSize,
      'sources':sourceName,
      'apiKey':AppConstants.apiKey,
      'language': lang
    };
    var uri = Uri.https(AppConstants.baseUrl,AppConstants.newsApi,params);
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

  static Future<ArticlesResponseModel?> getArticlesByword({required String searchText,int page = 1}) async {
    final String lang = await _preferencesService.getLang() ?? 'en';
    var params = {
      'pageSize' : AppConstants.pageSize,
      'page' : '$page',
      'q':searchText,
      'apiKey':AppConstants.apiKey,
      'language': lang
    };
    var uri = Uri.https(AppConstants.baseUrl,AppConstants.newsApi,params);
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

