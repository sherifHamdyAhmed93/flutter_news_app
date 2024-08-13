import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/home/category_details_widget/card_item.dart';
import 'package:flutter_news_app/model/article_model.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
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

  int page = 1;
  bool _isLoading = false;
  List<Article> articles = [];
  int totalArticlesCount = 0;
  ScrollController scrollController = ScrollController();
  bool _hasError = false;
  String? _errorMessage;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    scrollController.addListener(onScroll);
  }

  TextEditingController searchController = TextEditingController();

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
                controller: searchController,
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
                          _startNewSearch();
                        },
                        icon: Icon(Icons.search,
                            size: 30, color: AppColors.primaryColor)),
                ),
              ),
            )
          ),
          body: searchController.text.isEmpty ?
          Center(

          )
              :
              _buildBody()
        )
      ],
    );
  }

  void _startNewSearch() {
    setState(() {
      page = 1;
      articles.clear();
      totalArticlesCount = 0;
      _isLoading = true;
      _hasError = false;
      _errorMessage = null;
    });
    _fetchArticles();
  }

  Widget _buildBody() {
    if (searchController.text.isEmpty) {
      return Center(child: Text(AppLocalizations.of(context)!.searchArticle));
    }

    if (_hasError) {
      return _buildErrorState();
    }

    if (articles.isEmpty && _isLoading) {
      return Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
    }

    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    return articles.isEmpty ?
    _buildEmptyState()
        :
    ListView.builder(
      controller: scrollController,
      itemCount: _isLoading ? articles.length + 1 : articles.length,
      itemBuilder: (context, index) {
        if (index < articles.length) {
          return CardItem(article: articles[index]);
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

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_errorMessage ?? AppLocalizations.of(context)!.noArticlesFound),
          ElevatedButton(
            onPressed: () {
              _startNewSearch();
            },
            child: Text(AppLocalizations.of(context)!.tryAgain),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(AppLocalizations.of(context)!.noArticlesFound)
    );
  }

  void onScroll() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !_isLoading) {
      setState(() {
        _isLoading = true;
      });
      page++;
      _fetchArticles();
    }
  }

  void _fetchArticles() async {
    try {
      var response = await ApiManager.getArticlesByword(searchText: searchController.text, page: page);
      totalArticlesCount = response?.totalResults ?? 0;
      setState(() {
        if (response!.articles != null) {
          articles.addAll(response.articles!);
          print( '${response.totalResults ?? 0} : ${articles.length}');
        }
        _isLoading = false;
        _hasError = false;
        _errorMessage = null;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _errorMessage = error.toString();
      });
    }
  }
}


