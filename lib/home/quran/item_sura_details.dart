import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class ItemSuraDetails extends StatelessWidget {
  String content;
  int index;

  ItemSuraDetails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return provider.appTheme == ThemeMode.light
        ? Text(
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            '$content (${index + 1})',
            style: Theme.of(context).textTheme.titleLarge,
          )
        : Text(
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            '$content (${index + 1})',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColors.whiteColor),
          );
  }
}
