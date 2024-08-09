import 'package:flutter/material.dart';
import 'package:flutter_news_app/categories_screen/category_item.dart';
import 'package:flutter_news_app/model/category_model.dart';
import 'package:flutter_news_app/theme/app_theme.dart';

class CategoriesScreen extends StatefulWidget {
   CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  final List<Category> categories = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          child: Image.asset('assets/images/pattern.png',height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
          color: Colors.white,
        ),
        Scaffold(
          // backgroundColor: Colors.transparent,
          appBar: AppBar(title: Text('News App',style: Theme.of(context).textTheme.titleMedium,),centerTitle: true,),
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height*0.06,
                horizontal: width*0.12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text('Pick your category of interest',maxLines: 2,style: Theme.of(context).textTheme.titleLarge,),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: categories.length,
                    itemBuilder: (context,index){
                      return CategoryItem(category: categories[index],);
                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
