import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/quran/sura_details_screen.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ItemSuraName extends StatelessWidget {
  String name;
  int index;

  ItemSuraName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(name: name, index: index),
          );
        },
        child: Text(
          name,
          style: provider.appTheme == ThemeMode.light
              ? Theme.of(context).textTheme.bodySmall
              : Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.whiteColor),
          textAlign: TextAlign.center,
        ));
  }
}
