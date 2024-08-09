import 'package:flutter/material.dart';
import 'package:flutter_news_app/theme/app_colors.dart';

class NewsDetailsScreen extends StatelessWidget {
  NewsDetailsScreen({super.key});

  static const String screenName = 'details_screen';

  String ttst = '''
  Why are football's biggest clubs starting a new tournament Why are football’s biggest clubs
  starting a new tournamentWhy are football’s biggest clubs starting a new tournamentWhy are football’s
  biggest clubs starting a new tournamentWhy are football’s biggest clubs starting a new tournament.
  Why are football’s biggest clubs starting a new  tournamentWhy are football’s biggest clubs starting
  a new tournamentWhy are football’s biggest clubs starting a new tournamentWhy are football’s biggest
  clubs starting a new tournamentWhy are football’s biggest clubs starting a new tournamentWhy are
  football’s biggest clubs starting a new tournament Why are football’s biggest clubs starting a new tournament
   Why are football's biggest clubs starting a new tournament Why are football’s biggest clubs
  starting a new tournamentWhy are football’s biggest clubs starting a new tournamentWhy are football’s
  biggest clubs starting a new tournamentWhy are football’s biggest clubs starting a new tournament.
  Why are football’s biggest clubs starting a new  tournamentWhy are football’s biggest clubs starting
  a new tournamentWhy are football’s biggest clubs starting a new tournamentWhy are football’s biggest
  clubs starting a new tournamentWhy are football’s biggest clubs starting a new tournamentWhy are
  football’s biggest clubs starting a new tournament Why are football’s biggest clubs starting a new tournament
  ''';

  @override
  Widget build(BuildContext context) {
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
              'Sports',
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
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/NewsTest.png',
                      fit: BoxFit.fill,
                    )),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text('BBC news',
                      style: Theme.of(context).textTheme.headlineSmall),
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    child: Text(ttst,textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),

                InkWell(
                  onTap: (){

                  },
                  child: Text(
                    'View Full Article',
                    textAlign: TextAlign.end,

                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primaryTextColor),
                  ),
                ),


              ],
            ),
          ),
        )
      ],
    );
  }
}
