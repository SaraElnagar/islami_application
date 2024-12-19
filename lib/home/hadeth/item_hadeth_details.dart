import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class ItemHadethDetails extends StatelessWidget {
  String content;

  ItemHadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Text(
      content,
      textAlign: TextAlign.center,
      // textDirection:TextDirection.rtl,
      style: provider.appTheme == ThemeMode.light
          ? Theme.of(context).textTheme.titleLarge
          : Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.yellowColor),
    );
  }
}
