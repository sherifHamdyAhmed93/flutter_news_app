import 'package:flutter/material.dart';
import 'package:flutter_news_app/home/category_details_widget/articles_widget.dart';
import 'package:flutter_news_app/home/category_details_widget/tab_item.dart';
import 'package:flutter_news_app/model/source_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
class TabWidget extends StatefulWidget {
   TabWidget({super.key,required this.sources});
  List<Source> sources;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                selectedIndex = index;
                setState(() {

                });
              },
              tabAlignment: TabAlignment.start,
              padding: EdgeInsets.symmetric(vertical: 10),
              isScrollable: true,
              indicatorColor: Colors.transparent,
                tabs: widget.sources.map((e){
                  return TabItem(isSelected: widget.sources.indexOf(e) == selectedIndex,source: e,);
                }).toList()
            ),
            widget.sources.isEmpty ?
                Text(AppLocalizations.of(context)!.noArticlesFound,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primaryTextColor),)
                :
              Expanded(child: ArticlesWidget(selectedSource: widget.sources[selectedIndex],))
          ],
        )
    );
  }
}
