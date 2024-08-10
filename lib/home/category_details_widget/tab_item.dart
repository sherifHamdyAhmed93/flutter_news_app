import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/source_model.dart';
import 'package:flutter_news_app/theme/app_colors.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key,required this.isSelected,required this.source});

  bool isSelected;
  Source source;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        border: Border.all(
          color: AppColors.primaryColor,
          width: isSelected ? 0 : 2
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(source.name ?? '',style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: isSelected ? AppColors.whiteColor : AppColors.primaryColor),
      ),
    );
  }
}
