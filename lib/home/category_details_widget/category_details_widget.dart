import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/home/category_details_widget/tab_widget.dart';
import 'package:flutter_news_app/model/category_model.dart';
import 'package:flutter_news_app/model/source_model.dart';
import 'package:flutter_news_app/theme/app_colors.dart';

class CategoryDetailsWidget extends StatefulWidget {
  CategoryDetailsWidget({super.key,required this.selectedCategory});
  Category selectedCategory;
  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {

  Source? selectedSource;
  List<Source>? sources = null;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future: ApiManager.getSourcesByCategory(widget.selectedCategory.name),
        builder: (context,snapshot){
          if  (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: AppColors.primaryColor,));
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: (){
                  ApiManager.getSourcesByCategory(widget.selectedCategory.name);
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          else{
            if (snapshot.data!.status == 'error'){
              return Column(
                children: [
                  Text(snapshot.data!.message ?? ''),
                  ElevatedButton(onPressed: (){
                    ApiManager.getSourcesByCategory(widget.selectedCategory.name);
                    setState(() {

                    });
                  }, child: Text('Try Again'))
                ],
              );
            }
            else{
              sources = snapshot.data!.sources;
              return TabWidget(sources: sources!);
            }
          }
        }
    );
    // Column(
    //   children: [
    //     sources == null ?
    //
    //         :
    //     TabWidget(sources: sources!,onSelectSource: (source){
    //       selectedSource = source;
    //       setState(() {
    //
    //       });
    //     },)
    //     ,
    //     Expanded(
    //       child: ArticlesWidget(selectedSource: selectedSource,),
    //     ),
    //   ],
    // );
  }
}

