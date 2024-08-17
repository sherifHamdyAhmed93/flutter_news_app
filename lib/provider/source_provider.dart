
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/model/article_model.dart';
import 'package:flutter_news_app/model/category_model.dart';
import 'package:flutter_news_app/model/source_model.dart';
import 'package:flutter_news_app/model/sources_response_model.dart';

class SourceProvider extends ChangeNotifier{

  // Category? selectedCategory;
  // List<Source>? sources;
  // Source? selectedSource;
  // List<Article>? articles;
  //
  // void setCategory(Category category){
  //  // selectedCategory = category;
  // }
  //
  // Future<void> getSources()async{
  //   // var response = await ApiManager.getSourcesByCategory(selectedCategory?.name ?? '');
  //   // sources = response.sources;
  //   // notifyListeners();
  // }
  //
  // Future<void> getArticlesBySources()async{
  //   var response = await ApiManager.getArticlesBySource(selectedSource?.name ?? '');
  //   articles = response.articles;
  //   notifyListeners();
  // }

}