import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/category_screen/articles_widget.dart';
import 'package:flutter_news_app/category_screen/card_item.dart';
import 'package:flutter_news_app/category_screen/tab_widget.dart';
import 'package:flutter_news_app/model/category_model.dart';
import 'package:flutter_news_app/model/source_model.dart';
import 'package:flutter_news_app/provider/source_provider.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key});

  static const String screenName = 'category_screen';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  Source? selectedSource;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var category = (ModalRoute.of(context)?.settings.arguments ?? Category.getCategories().first) as Category;
    SourceProvider sourceProvider = Provider.of<SourceProvider>(context);

    return Stack(
      children: [
        Container(
          child: Image.asset('assets/images/pattern.png',height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
          color: Colors.white,
        ),
        Scaffold(
          // backgroundColor: Colors.transparent,
          appBar: AppBar(title: Text(category.name,style: Theme.of(context).textTheme.titleMedium,),centerTitle: true,),
          body: Column(
            children: [
              sourceProvider.sources == null ?
              FutureBuilder(
                  future: ApiManager.getSourcesByCategory(category.name),
                  builder: (context,snapshot){
                    if  (snapshot.connectionState == ConnectionState.waiting){
                      return CircularProgressIndicator(color: AppColors.primaryColor,);
                    }
                    else if(snapshot.hasError){
                      return Center(
                        child: Column(
                          children: [
                            Text(snapshot.error.toString()),
                            TextButton(onPressed: (){
                              ApiManager.getSourcesByCategory(category.name);
                              setState(() {

                              });
                            }, child: Text('Try Again'))
                          ],
                        ),
                      );
                    }
                    else{
                      sourceProvider.sources = snapshot.data!.sources;
                      return TabWidget(sources: snapshot.data!.sources!,onSelectSource: (source){
                        selectedSource = source;
                        sourceProvider.selectedSource = source;
                        setState(() {

                        });
                      },);
                    }
                  }
              )
              :
              TabWidget(sources: sourceProvider.sources!,onSelectSource: (source){
                    selectedSource = source;
                    sourceProvider.selectedSource = source;
                    setState(() {

                    });
               },)
                  ,
              Expanded(
                child: ArticlesWidget(selectedSource: selectedSource,),
              ),
            ],
          ),
        )
      ],
    );
  }
}

