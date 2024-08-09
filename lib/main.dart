import 'package:flutter/material.dart';
import 'package:flutter_news_app/categories_screen/categories_screen.dart';
import 'package:flutter_news_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: CategoriesScreen(),
    );
  }
}

