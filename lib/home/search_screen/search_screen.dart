import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/home/category_details_widget/card_item.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const screenName = 'search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          appBar: AppBar(
            title: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius:
                BorderRadius.circular(20),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                    hintText:
                    AppLocalizations.of(context)!.searchArticle,
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    prefixIcon: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close,
                            size: 30, color: AppColors.primaryColor)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {

                          });
                        },
                        icon: Icon(Icons.search,
                            size: 30, color: AppColors.primaryColor)),
                ),
              ),
            )
          ),
          body: searchController.text.isEmpty ?
          Center(

          )
              :
          FutureBuilder(
              future:
              ApiManager.getArticlesByword(searchController.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ));
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        Text(snapshot.error.toString()),
                        ElevatedButton(
                            onPressed: () {
                              ApiManager.getArticlesBySource(
                                  searchController.text);
                            },
                            child: Text(AppLocalizations.of(context)!.tryAgain))
                      ],
                    ),
                  );
                } else {
                  if (snapshot.data!.status == 'error') {
                    return Column(
                      children: [
                        Text(snapshot.data!.message ?? ''),
                        ElevatedButton(
                            onPressed: () {
                              ApiManager.getArticlesBySource(
                                  searchController.text);
                              setState(() {});
                            },
                            child: Text(AppLocalizations.of(context)!.tryAgain))
                      ],
                    );
                  } else {
                    if (snapshot.data!.articles!.isEmpty) {
                      return Center(
                          child: Text(
                            AppLocalizations.of(context)!.noArticlesFound,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: AppColors.primaryTextColor),
                          ));
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.articles!.length,
                        itemBuilder: (context, index) {
                          return CardItem(
                            article: snapshot.data!.articles![index],
                          );
                        },
                      );
                    }
                  }
                }
              })
        )
      ],
    );
  }
}
