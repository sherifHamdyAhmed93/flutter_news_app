import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/home/categories/category_item.dart';
import 'package:flutter_news_app/model/category_model.dart';
import 'package:flutter_news_app/my_drawer/my_drawer.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
import 'package:flutter_news_app/theme/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CategoriesWidget extends StatefulWidget {
  CategoriesWidget({super.key,required this.onSelectCategory});

  Function onSelectCategory;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    // if (categories.isEmpty){
      categories = Category.getCategories(context);
    // }
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: width * 0.06),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              AppLocalizations.of(context)!.pickYourCategory,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // childAspectRatio: 0.8,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15),
              scrollDirection: Axis.vertical,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryItem(category: categories[index],categoryIndex: index,onSelectCategory: widget.onSelectCategory,);
              },
            ),
          ),
        ],
      ),
    );
  }
}
