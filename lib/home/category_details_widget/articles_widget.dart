import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/components/error_widget.dart';
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
            return  _buildErrorState(snapshot.error.toString() ?? AppLocalizations.of(context)!.noArticlesFound);
          } else {
            if (snapshot.data!.status == 'error') {
              return  _buildErrorState(snapshot.data!.message ?? '');
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

  Widget _buildErrorState(String errorMessage) {
    return TryAgainWidget(errorMessage: errorMessage ?? AppLocalizations.of(context)!.noArticlesFound, onError: callApi);
  }

  void callApi(){
    ApiManager.getArticlesBySource(
        widget.selectedSource.name ?? '');
  }

}
