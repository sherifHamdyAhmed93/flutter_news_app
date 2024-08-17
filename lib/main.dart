import 'package:flutter/material.dart';
import 'package:flutter_news_app/home/home_screen.dart';
import 'package:flutter_news_app/home/search_screen/search_screen.dart';
import 'package:flutter_news_app/news_details/news_details_screen.dart';
import 'package:flutter_news_app/provider/app_language_provider.dart';
import 'package:flutter_news_app/provider/source_provider.dart';
import 'package:flutter_news_app/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SourceProvider()),
        ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppLanguageProvider languageProvider =
    Provider.of<AppLanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.currentAppLanguage),
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      initialRoute: HomeScreen.screenName,
      routes: {
        HomeScreen.screenName: (context) => HomeScreen(),
        NewsDetailsScreen.screenName: (context) => NewsDetailsScreen(),
        SearchScreen.screenName :  (context) => SearchScreen()
      },
    );
  }
}

