import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/quran/item_sura_details.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Stack(children: [
      provider.appTheme == ThemeMode.light
          ? Image.asset(
              "assets/images/main_background.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              "assets/images/main_background_night.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
      Scaffold(
        appBar: AppBar(
          title: provider.appTheme == ThemeMode.light
              ? Text(args.name, style: Theme.of(context).textTheme.bodyLarge)
              : Text(args.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.yellowColor)),
        ),
        body: verses.isEmpty
            ? Center(
                child: provider.appTheme == ThemeMode.light
                    ? const CircularProgressIndicator(
                        color: AppColors.primaryLightColor,
                      )
                    : const CircularProgressIndicator(
                        color: AppColors.yellowColor,
                      ),
              )
            : Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.04),
                decoration: provider.appTheme == ThemeMode.light
                    ? BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(24))
                    : BoxDecoration(
                        color: AppColors.primaryDarkColor,
                        borderRadius: BorderRadius.circular(24)),
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return provider.appTheme == ThemeMode.light
                        ? const Divider(
                            color: AppColors.primaryLightColor,
                            thickness: 2,
                          )
                        : const Divider(
                            color: AppColors.yellowColor,
                            thickness: 2,
                          );
                  },
                  itemBuilder: (context, index) {
                    return ItemSuraDetails(
                      content: verses[index],
                      index: index,
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      )
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split("\n");
    verses = lines;
    setState(() {});
  }
}

/// data class
class SuraDetailsArgs {
  String name;
  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
