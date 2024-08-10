import 'package:flutter/material.dart';
import 'package:flutter_news_app/settings_screen/settings_screen.dart';
import 'package:flutter_news_app/theme/app_colors.dart';

class MyDrawer extends StatelessWidget {

  MyDrawer({required this.onSideMenuItemSelect});

  static const int categoriesTab = 1;
  static const int settingsTab = 2;

  Function onSideMenuItemSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Center(child: Text('News App!',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.whiteColor),)),
          ),
          ListTile(
            onTap: (){
              onSideMenuItemSelect(categoriesTab);
              // Navigator.pop(context);
              // if (ModalRoute.of(context)?.settings.name != CategoriesWidget.screenName) {
              //   Navigator.pushReplacementNamed(context, CategoriesWidget.screenName);
              // }
            },
            leading: Icon(Icons.list,size: 30,color: AppColors.primaryTextColor,),
            title: Text('Categories',style: Theme.of(context).textTheme.titleLarge,),
          ),
          ListTile(
            onTap: (){
              onSideMenuItemSelect(settingsTab);
              // Navigator.pop(context);
              // if (ModalRoute.of(context)?.settings.name != SettingsScreen.screenName) {
              //   Navigator.pushReplacementNamed(context, SettingsScreen.screenName);
              // }
            },
            leading: Icon(Icons.settings,size: 30,color: AppColors.primaryTextColor,),
            title: Text('Settings',style: Theme.of(context).textTheme.titleLarge,),
          ),
        ],
      ),
    );
  }
}