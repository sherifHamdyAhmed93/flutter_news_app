import 'package:flutter/material.dart';
import 'package:flutter_news_app/components/error_widget.dart';
import 'package:flutter_news_app/home/category_details_widget/card_item.dart';
import 'package:flutter_news_app/home/category_details_widget/category_details_view_model/category_details_view_model.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class ArticlesWidget extends StatefulWidget {
  ArticlesWidget({super.key, required this.viewModel});
  CategoryDetailsViewModel viewModel;

  @override
  State<ArticlesWidget> createState() => _ArticlesWidgetState();
}

class _ArticlesWidgetState extends State<ArticlesWidget> {

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(onScroll);
    widget.viewModel.getArticlesBySource();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryDetailsViewModel>(
        builder: (context,viewModel,child){
           if (viewModel.articlesErrorMessage != null){
            return _buildErrorState(viewModel.errorMessage ?? '');
          }
           else if (viewModel.articles == null){
             return Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
           }
           else if(viewModel.articles!.isEmpty){
             return Text(AppLocalizations.of(context)!.noArticlesFound,style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primaryTextColor),);
          }
           else{
            return ListView.builder(
              controller: scrollController,
              itemCount:  viewModel.isLoadMore ? viewModel.articles!.length + 1 : viewModel.articles!.length,
                itemBuilder: (context, index)
            {
              if (index < viewModel.articles!.length) {
                return CardItem(article: viewModel.articles![index]);
              } else {
                return Center(child: CircularProgressIndicator(
                    color: AppColors.primaryColor));
              }
            });
          }
        }
    );



  }

  Widget _buildErrorState(String errorMessage) {
    return TryAgainWidget(errorMessage: errorMessage ?? AppLocalizations.of(context)!.noArticlesFound, onError: widget.viewModel.getArticlesBySource);
  }

  void onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !widget.viewModel.isLoadMore) {
      widget.viewModel.loadMore();
    }
  }

}
