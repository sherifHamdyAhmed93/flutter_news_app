import 'package:flutter/material.dart';

class Category{
  final String name;
  final String imageName;
  final Color backgroundColor;
  final String key;

  Category({required this.name, required this.imageName, required this.backgroundColor, required this.key});

  static List<Category> getCategories(){
    return [
      Category(name: 'Sports', imageName: 'ball.png', backgroundColor: Color(0xffC91C22), key: 'sports'),
      Category(name: 'Science', imageName: 'science.png', backgroundColor: Color(0xffF2D352), key: 'science'),
      Category(name: 'Health', imageName: 'health.png', backgroundColor: Color(0xffED1E79), key: 'health'),
      Category(name: 'Business', imageName: 'bussines.png', backgroundColor: Color(0xffCF7E48), key: 'business'),
      Category(name: 'Entertainment', imageName: 'environment.png', backgroundColor: Color(0xff4882CF), key: 'entertainment'),

      // Category(name: 'General', imageName: 'bussines.png', backgroundColor: Color(0xffCF7E48), key: 'general'),
      // Category(name: 'technology', imageName: 'bussines.png', backgroundColor: Color(0xffCF7E48), key: 'technology'),

    ];
  }

}

