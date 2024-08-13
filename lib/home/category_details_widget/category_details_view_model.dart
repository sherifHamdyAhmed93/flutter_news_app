import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/model/article_model.dart';
import 'package:flutter_news_app/model/category_model.dart';
import 'package:flutter_news_app/model/source_model.dart';

class CategoryDetailsViewModel extends ChangeNotifier{

  int page = 1;
  List<Article>? articles;
  bool isLoadMore = false;
  String? articlesErrorMessage;

  List<Source>? sources;
  String? errorMessage;

  Category category;
  Source? selectedSource;
  CategoryDetailsViewModel({required this.category});

  Future<void> getSourceByCategory() async{
    try{
      var response = await ApiManager.getSourcesByCategory(category.key);
      if (response!.status == 'error'){
        errorMessage = response.message;
      }else{
        sources = response.sources;
        selectedSource = sources?.first;
      }
    }catch (e){
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> getArticlesBySource() async{
    if (selectedSource == null){
      return;
    }
    try{
      var response = await ApiManager.getArticlesBySource(selectedSource?.id ?? '',page: page);
      if (response!.status == 'error'){
        articlesErrorMessage = response.message;
      }else{
        if (page == 1){
          articles = response.articles;
        }else{
          articles?.addAll(response.articles ?? []);
        }
      }
    }catch (e){
      articlesErrorMessage = e.toString();
    }
    if (isLoadMore == true){
      isLoadMore = false;
    }
    notifyListeners();
  }

  void loadMore(){
    page += 1;
    isLoadMore = true;
    notifyListeners();
    getArticlesBySource();
  }

  void didTabOnSource({int? index}){
    articlesErrorMessage = null;
    page = 1;
    articles = null;
    selectedSource = index == null ? sources?.first : sources?[index];
    notifyListeners();
    getArticlesBySource();
  }

}