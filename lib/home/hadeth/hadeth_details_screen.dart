import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/hadeth/hadeth_tab.dart';
import 'package:islami_app/home/hadeth/item_hadeth_details.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class HadethDetailsScreen extends StatefulWidget {
  static const String routeName = 'hadeth_details_screen';

  @override
  State<HadethDetailsScreen> createState() => _HadethDetailsScreenState();
}

class _HadethDetailsScreenState extends State<HadethDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    Hadeth args = ModalRoute.of(context)?.settings.arguments as Hadeth;

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
              ? Text(args.title, style: Theme.of(context).textTheme.bodyLarge)
              : Text(args.title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.yellowColor)),
        ),
        body: Container(
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
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHadethDetails(
                content: args.content[index],
              );
            },
            itemCount: args.content.length,
          ),
        ),
      )
    ]);
  }
}
