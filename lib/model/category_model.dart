import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Category{
  final String name;
  final String imageName;
  final Color backgroundColor;
  final String key;

  Category({required this.name, required this.imageName, required this.backgroundColor, required this.key});

  static List<Category> getCategories(BuildContext context){
    return [
      Category(name: AppLocalizations.of(context)!.sports, imageName: 'assets/images/ball.png', backgroundColor: Color(0xffC91C22), key: 'sports'),
      Category(name: AppLocalizations.of(context)!.science, imageName: 'assets/images/science.png', backgroundColor: Color(0xffF2D352), key: 'science'),
      Category(name: AppLocalizations.of(context)!.health, imageName: 'assets/images/health.png', backgroundColor: Color(0xffED1E79), key: 'health'),
      Category(name: AppLocalizations.of(context)!.business, imageName: 'assets/images/bussines.png', backgroundColor: Color(0xffCF7E48), key: 'business'),
      Category(name: AppLocalizations.of(context)!.entertainment, imageName: 'assets/images/environment.png', backgroundColor: Color(0xff4882CF), key: 'entertainment'),
      Category(name: AppLocalizations.of(context)!.general, imageName: 'assets/images/Politics.png', backgroundColor: Color(0xff003E90), key: 'general'),
    ];
  }

}

