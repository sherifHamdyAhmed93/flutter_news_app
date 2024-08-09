import 'package:flutter/material.dart';
import 'package:flutter_news_app/news_details/news_details_screen.dart';
import 'package:flutter_news_app/theme/app_colors.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(NewsDetailsScreen.screenName);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
                child: Image.asset('assets/images/NewsTest.png',fit: BoxFit.fill,)
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text('BBC news',style: Theme.of(context).textTheme.headlineSmall),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                'Why are footballs biggest clubs starting a new tournament? clubs starting a new tournament?',
                maxLines: 2,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primaryTextColor),
              ),
            ),
            Text(
              '3 Hours',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.labelMedium,
            ),

          ],
        ),
      ),
    );
  }
}
