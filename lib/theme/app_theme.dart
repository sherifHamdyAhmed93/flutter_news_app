import 'package:flutter/material.dart';
import 'package:flutter_news_app/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.whiteColor,
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40))
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.categoriesTextColor
      ),
      titleMedium: GoogleFonts.exo(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor
      ),
      labelSmall: GoogleFonts.exo(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor
      ),
      headlineMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryTextColor
      ),
      headlineSmall: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColors.secondaryTextColor
      ),
      labelMedium: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.thirdTextColor
      )
    ),
  );

}