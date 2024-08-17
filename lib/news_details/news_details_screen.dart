import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/article_model.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
import 'package:flutter_news_app/util/app_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NewsDetailsScreen extends StatelessWidget {
  NewsDetailsScreen({super.key});

  static const String screenName = 'details_screen';


  @override
  Widget build(BuildContext context) {
    Article article = ModalRoute.of(context)?.settings.arguments as Article;
    String rawDate = article.publishedAt ?? '';
    String formattedDate = AppUtils.formatDate(rawDate);

    return Stack(
      children: [
        Container(
          child: Image.asset(
            'assets/images/pattern.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          color: Colors.white,
        ),
        Scaffold(
          // backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              article.title ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Container(
              clipBehavior: Clip.antiAlias,
              height: MediaQuery.of(context).size.height*0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ), // same as the container
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2,top: 4),
                  child: Text(article.author ?? '',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    article.description ?? '',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primaryTextColor),
                  ),
                ),
                Text(
                  formattedDate,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    child: Text(article.content ?? '',textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),

                InkWell(
                  onTap: (){
                    AppUtils.launchURL(article.url ?? '');
                  },
                  child: Text(
                    AppLocalizations.of(context)!.viewFullArticle,
                    textAlign: TextAlign.end,

                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primaryTextColor),
                  ),
                ),
                Spacer()

              ],
            ),
          ),
        )
      ],
    );
  }
}
