import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/category_model.dart';
import 'package:flutter_news_app/provider/source_provider.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key,required this.category,required this.categoryIndex,required this.onSelectCategory});

  Category category;
  int categoryIndex;
  Function onSelectCategory;

  @override
  Widget build(BuildContext context) {
    SourceProvider sourceProvider = Provider.of<SourceProvider>(context);
    return InkWell(
      onTap: (){
       onSelectCategory(category);
      },
      child: Container(
        decoration: BoxDecoration(
            color: category.backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: categoryIndex % 2 != 0 ? Radius.circular(20) : Radius.circular(0),
              bottomLeft: categoryIndex % 2 == 0 ? Radius.circular(20) : Radius.circular(0)
            )
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(child: Image.asset(category.imageName,fit: BoxFit.fill,width: double.infinity,height: MediaQuery.of(context).size.height*0.12,)),
            SizedBox(height: 10,),
            Text(category.name,style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
      ),
    );
  }
}
