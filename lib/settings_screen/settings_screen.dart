import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_news_app/my_drawer/my_drawer.dart';
import 'package:flutter_news_app/settings_screen/language_screen.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../provider/app_language_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    AppLanguageProvider provider = Provider.of<AppLanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: width * 0.02),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04,
          vertical: MediaQuery.of(context).size.width * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLanguageWidget(provider),
            SizedBox(
              height: 30,
            ),
            // _buildThemeWidget(themeProvider)
          ],
        ),
      ),
    );

  }

  Widget _buildLanguageWidget(
      AppLanguageProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${AppLocalizations.of(context)!.language}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 14,
            color: AppColors.primaryTextColor
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: _showActionSheetForLanguage,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${provider.getCurrentLanguageName(context)}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.primaryColor
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: AppColors.primaryColor,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Widget _buildThemeWidget(AppThemeProvider provider) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         '${AppLocalizations.of(context)!.theme}',
  //         style: Theme.of(context).textTheme.titleSmall,
  //       ),
  //       SizedBox(
  //         height: 10,
  //       ),
  //       GestureDetector(
  //         onTap: _showActionSheetForTheme,
  //         child: Container(
  //           padding: EdgeInsets.all(20),
  //           decoration: BoxDecoration(
  //               color: provider.getFieldBackgroundColor(),
  //               border: Border.all(color: AppColors.primaryColor),
  //               borderRadius: BorderRadius.circular(10)),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 provider.getCurrentThemeName(context),
  //                 style: Theme.of(context).textTheme.displaySmall,
  //               ),
  //               Icon(
  //                 Icons.keyboard_arrow_down,
  //                 size: 30,
  //                 color: AppColors.primaryColor,
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  void _showActionSheetForLanguage() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return LanguageScreen();
        });
  }

  // void _showActionSheetForTheme() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return ThemeScreen();
  //       });
  // }
}
