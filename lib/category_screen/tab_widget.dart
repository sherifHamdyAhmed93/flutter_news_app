import 'package:flutter/material.dart';
import 'package:flutter_news_app/category_screen/tab_item.dart';
import 'package:flutter_news_app/model/source_model.dart';

class TabWidget extends StatefulWidget {
   TabWidget({super.key,required this.sources,required this.onSelectSource});
   Function onSelectSource;

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
                widget.onSelectSource(widget.sources[index]);
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
          ],
        )
    );
  }
}
