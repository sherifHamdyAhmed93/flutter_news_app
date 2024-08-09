import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key,required this.category});

  Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomRight: Radius.circular(20))
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/${category.imageName}')),
          SizedBox(height: 10,),
          Text('${category.name}',style: Theme.of(context).textTheme.titleMedium,)
        ],
      ),
    );
  }
}
