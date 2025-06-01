import 'package:flutter/material.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/hadeth/hadeth_details_screen.dart';
import 'l10n/app_localizations.dart';

void main() async {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    initSharedPref();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDetailsScreen.routeName: (context) => HadethDetailsScreen(),
      },
      theme: MyThemeData.lightMode,
      themeMode: provider.appTheme,
      darkTheme: MyThemeData.darkMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
    );
  }

  void initSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString("language");
    if (language != null) {
      provider.appLanguage = language;
    }
    bool? isDark = prefs.getBool("isDark");
    if (isDark == true) {
      provider.changeTheme(ThemeMode.dark);
    } else if (isDark == false) {
      provider.changeTheme(ThemeMode.light);
    }
  }
}
