import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  var provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              /// change theme to light
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.appTheme == ThemeMode.light
                ? getSelectedItemWidget(AppLocalizations.of(context)!.light)
                : getUnSelectedItemWidget(AppLocalizations.of(context)!.light),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              /// change theme to dark
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.appTheme == ThemeMode.dark
                ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                : getUnSelectedItemWidget(AppLocalizations.of(context)!.dark),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        provider.appTheme == ThemeMode.light
            ? Text(text,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.blackColor))
            : Text(text,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.whiteColor)),
        provider.appTheme == ThemeMode.light
            ? Icon(
                Icons.check,
                color: AppColors.whiteColor,
                size: 35,
              )
            : Icon(
                Icons.check,
                color: AppColors.yellowColor,
                size: 35,
              ),
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return provider.appTheme == ThemeMode.light
        ? Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.blackColor),
          )
        : Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.whiteColor),
          );
  }
}
