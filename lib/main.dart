import 'package:flutter/material.dart';
import 'package:flutter_news_app/categories_screen/categories_screen.dart';
import 'package:flutter_news_app/category_screen/category_screen.dart';
import 'package:flutter_news_app/news_details/news_details_screen.dart';
import 'package:flutter_news_app/provider/source_provider.dart';
import 'package:flutter_news_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SourceProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      initialRoute: CategoryScreen.screenName,
      routes: {
        CategoriesScreen.screenName: (context) => CategoriesScreen(),
        CategoryScreen.screenName: (context) => CategoryScreen(),
        NewsDetailsScreen.screenName: (context) => NewsDetailsScreen(),
      },
    );
  }
}

