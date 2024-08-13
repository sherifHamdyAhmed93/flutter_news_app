import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/model/article_model.dart';

class SearchScreenViewModel extends ChangeNotifier{
  int page = 1;
  List<Article>? articles;
  int totalArticlesCount = 0;
  String? errorMessage;
  bool isLoadMore = false;
  TextEditingController searchController = TextEditingController();

  SearchScreenViewModel(){
    articles = [];
  }

  Future<void> searchArticlesByWord() async{
    // if(searchController.text.isEmpty){
    //   articles = [];
    //   notifyListeners();
    //   return;
    // }
    try{
      var response = await ApiManager.getArticlesByword(searchText: searchController.text,page: page);
      if (response!.status == 'error'){
        errorMessage = response.message;
      }else{
        if (page == 1){
          articles = response.articles;
        }else{
          articles?.addAll(response.articles ?? []);
        }
      }
    }catch (e){
      errorMessage = e.toString();
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
    searchArticlesByWord();
  }

  void resetSearch(){
    errorMessage = null;
    page = 1;
    articles = null;
    notifyListeners();
    searchArticlesByWord();
  }

}