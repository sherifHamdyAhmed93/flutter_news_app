import 'package:flutter/material.dart';
import 'package:flutter_news_app/home/categories/categories_widget.dart';
import 'package:flutter_news_app/home/category_details_widget/category_details_widget.dart';
import 'package:flutter_news_app/model/category_model.dart';
import 'package:flutter_news_app/my_drawer/my_drawer.dart';
import 'package:flutter_news_app/settings_screen/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String screenName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Category? selectedCategory;
  int selectedSideMenuItem = MyDrawer.categoriesTab;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/pattern.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          // backgroundColor: Colors.transparent,
          drawer: MyDrawer(onSideMenuItemSelect:onSideMenuItemSelect),
          appBar: AppBar(
            title: Text(
              selectedSideMenuItem == MyDrawer.settingsTab ?
              AppLocalizations.of(context)!.settings :
              (selectedCategory == null ? AppLocalizations.of(context)!.newsApp : selectedCategory!.name ?? ''),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            centerTitle: true,
          ),
          body:
          selectedSideMenuItem == MyDrawer.settingsTab ?
          SettingsScreen()
              :
          selectedCategory == null ? CategoriesWidget(onSelectCategory: onSelectCategory,) : CategoryDetailsWidget(selectedCategory: selectedCategory!,),
        )
      ],
    );
  }

  void onSelectCategory(Category newCategory){
    selectedCategory = newCategory;
    setState(() {

    });
  }

  void onSideMenuItemSelect(int item){
    Navigator.pop(context);
    selectedSideMenuItem = item;
    selectedCategory = null;
    setState(() {

    });
  }

}
