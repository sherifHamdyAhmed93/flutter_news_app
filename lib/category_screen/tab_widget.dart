import 'package:flutter/material.dart';
import 'package:flutter_news_app/category_screen/tab_item.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8,
        child: Column(
          children: [
            TabBar(
              tabAlignment: TabAlignment.start,
              padding: EdgeInsets.symmetric(vertical: 10),
              isScrollable: true,
              indicatorColor: Colors.transparent,
                tabs: [
                  TabItem(isSelected: true,),
                  TabItem(isSelected: false,),
                  TabItem(isSelected: false,),
                  TabItem(isSelected: false,),
                  TabItem(isSelected: true,),
                  TabItem(isSelected: false,),
                  TabItem(isSelected: false,),
                  TabItem(isSelected: false,),
                ]
            ),
          ],
        )
    );
  }
}
