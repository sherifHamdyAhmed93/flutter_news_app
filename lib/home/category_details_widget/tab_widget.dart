import 'package:flutter/material.dart';
import 'package:flutter_news_app/home/category_details_widget/articles_widget.dart';
import 'package:flutter_news_app/home/category_details_widget/category_details_view_model/category_details_view_model.dart';
import 'package:flutter_news_app/home/category_details_widget/tab_item.dart';
class TabWidget extends StatefulWidget {
   TabWidget({super.key,required this.viewModel});
   CategoryDetailsViewModel viewModel;
  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  void initState() {
    // TODO: implement initState
    // widget.viewModel.didTabOnSource();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   widget.viewModel.didTabOnSource();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: widget.viewModel.sources!.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index){
                 widget.viewModel.didTabOnSource(index:index);
                },
                tabAlignment: TabAlignment.start,
                padding: EdgeInsets.symmetric(vertical: 10),
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.viewModel.sources!.map((e){
                  return TabItem(isSelected: widget.viewModel.sources!.indexOf(e) == widget.viewModel.sources?.indexOf(widget.viewModel.selectedSource!),source: e,);
                }).toList()
            ),
            // widget.viewModel.selectedSource == null ?
            //     Container()  :
            // widget.viewModel.articles == null ?
            //     Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
            //     :
            Expanded(child: ArticlesWidget(viewModel: widget.viewModel))
          ],
        )
    );
  }
}
