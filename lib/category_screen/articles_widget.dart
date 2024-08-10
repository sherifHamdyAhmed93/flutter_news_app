import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/category_screen/card_item.dart';
import 'package:flutter_news_app/model/source_model.dart';
import 'package:flutter_news_app/theme/app_colors.dart';

class ArticlesWidget extends StatefulWidget {
  ArticlesWidget({super.key,this.selectedSource});

  Source? selectedSource;

  @override
  State<ArticlesWidget> createState() => _ArticlesWidgetState();
}

class _ArticlesWidgetState extends State<ArticlesWidget> {
  Future? _articlesFuture;

  @override
  void didUpdateWidget(covariant ArticlesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedSource != widget.selectedSource) {
      _articlesFuture = ApiManager.getArticlesBySource(widget.selectedSource?.name ?? '');
    }
  }
  @override
  void initState() {
    super.initState();
    _articlesFuture = ApiManager.getArticlesBySource(widget.selectedSource?.name ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return widget.selectedSource != null ? FutureBuilder(
        future: _articlesFuture,
        builder: (context,snapshot){
          if  (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
          }
          else if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  Text(snapshot.error.toString()),
                  TextButton(onPressed: (){
                    ApiManager.getArticlesBySource(widget.selectedSource?.name ?? '');
                  }, child: Text('Try Again'))
                ],
              ),
            );
          }
          else{
            if (snapshot.data!.articles!.length == 0){
              return Center(child: Text('No Articles Found for this source',style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primaryTextColor),));
            }else {
              return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) {
                  return CardItem(article: snapshot.data!.articles![index],);
                },
              );
            }
          }
        }
    ) : Container() ;
  }
}
