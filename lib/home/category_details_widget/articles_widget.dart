import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/home/category_details_widget/card_item.dart';
import 'package:flutter_news_app/model/source_model.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ArticlesWidget extends StatefulWidget {
  ArticlesWidget({super.key, required this.selectedSource});

  Source selectedSource;

  @override
  State<ArticlesWidget> createState() => _ArticlesWidgetState();
}

class _ArticlesWidgetState extends State<ArticlesWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            ApiManager.getArticlesBySource(widget.selectedSource.id ?? ''),
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
                            widget.selectedSource?.name ?? '');
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
                            widget.selectedSource?.name ?? '');
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
        });
  }
}
