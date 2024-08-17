import 'package:flutter/material.dart';
import 'package:flutter_news_app/api/api_manager.dart';
import 'package:flutter_news_app/components/error_widget.dart';
import 'package:flutter_news_app/home/category_details_widget/category_details_view_model.dart';
import 'package:flutter_news_app/home/category_details_widget/tab_widget.dart';
import 'package:flutter_news_app/model/category_model.dart';
import 'package:flutter_news_app/model/source_model.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
class CategoryDetailsWidget extends StatefulWidget {
  CategoryDetailsWidget({super.key,required this.selectedCategory});
  Category selectedCategory;
  @override
  State<CategoryDetailsWidget> createState() => _CategoryDetailsWidgetState();
}

class _CategoryDetailsWidgetState extends State<CategoryDetailsWidget> {

  late CategoryDetailsViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    viewModel = CategoryDetailsViewModel(category: widget.selectedCategory);
    viewModel.getSourceByCategory();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<CategoryDetailsViewModel>(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
          builder: (context,viewModel,child){
            if (viewModel.errorMessage != null){
              return TryAgainWidget(errorMessage: viewModel.errorMessage ?? '', onError: viewModel.getSourceByCategory);
            }else if(viewModel.sources == null){
              return Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
            }else{
              return TabWidget(viewModel: viewModel);
            }
          }
      ),
    );
  }
}

