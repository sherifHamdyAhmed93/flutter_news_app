import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/article_model.dart';
import 'package:flutter_news_app/news_details/news_details_screen.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
import 'package:flutter_news_app/util/app_utils.dart';

class CardItem extends StatelessWidget {
  CardItem({super.key,required this.article});

  Article article;

  @override
  Widget build(BuildContext context) {

    String rawDate = article.publishedAt ?? '';
    String formattedDate = AppUtils.formatDate(rawDate);


    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(NewsDetailsScreen.screenName,arguments: article);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10), // same as the container
                child: Image.network(
                  article.urlToImage ?? '',fit: BoxFit.fill,
                  // width: double.infinity, // make the image fill the container's width
                  // height: double.infinity,
                )
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 2,top: 4),
              child: Text(article.author ?? '',style: Theme.of(context).textTheme.headlineSmall),
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

          ],
        ),
      ),
    );
  }



}
