import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news_app/components/error_widget.dart';
import 'package:flutter_news_app/home/category_details_widget/card_item.dart';
import 'package:flutter_news_app/home/search_screen/search_view_model/search_screen_view_model.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
import 'package:provider/provider.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  static const screenName = 'search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  static const snackBar = SnackBar(
    content: Text('No more data to load'),
  );

  ScrollController scrollController = ScrollController();
  SearchScreenViewModel viewModel = SearchScreenViewModel();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    scrollController.addListener(onScroll);
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image.asset(
            'assets/images/pattern.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          // backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius:
                BorderRadius.circular(20),
              ),
              child: TextField(
                controller: viewModel.searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                    hintText:
                    AppLocalizations.of(context)!.searchArticle,
                    hintStyle: Theme.of(context).textTheme.labelMedium,
                    prefixIcon: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close,
                            size: 30, color: AppColors.primaryColor)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.resetSearch();
                        },
                        icon: Icon(Icons.search,
                            size: 30, color: AppColors.primaryColor)),
                ),
              ),
            )
          ),
          body: ChangeNotifierProvider<SearchScreenViewModel>(
              create: (context) => viewModel,
            child: Consumer<SearchScreenViewModel>(
                builder: (context,viewModel,child){
                  if (viewModel.errorMessage != null){
                    return TryAgainWidget(errorMessage: viewModel.errorMessage ?? AppLocalizations.of(context)!.noArticlesFound, onError: viewModel.resetSearch);
                  }else if(viewModel.articles == null){
                    return Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
                  }else{
                    return _buildSearchResults();
                  }
                }
            ),
          )
        )
      ],
    );
  }

  Widget _buildSearchResults() {
    return viewModel.articles!.isEmpty ?
    _buildEmptyState()
        :
    ListView.builder(
      controller: scrollController,
      itemCount: viewModel.isLoadMore ? viewModel.articles!.length + 1 : viewModel.articles!.length,
      itemBuilder: (context, index) {
        if (index < viewModel.articles!.length) {
          return CardItem(article: viewModel.articles![index]);
        } else {
          // return totalArticlesCount == articles.length ?
          // Center(child: Text('No more data to load',style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.primaryTextColor),))
          // :
          // if (totalArticlesCount == articles.length){
          //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // }
         return Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
        }
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(AppLocalizations.of(context)!.noArticlesFound)
    );
  }

  void onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !viewModel.isLoadMore) {
     viewModel.loadMore();
    }
  }

}


