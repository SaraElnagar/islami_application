import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  var provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },

            /// english
            child: provider.appLanguage == "en"
                ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                : getUnSelectedItemWidget(
                    AppLocalizations.of(context)!.english),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },

            /// arabic
            child: provider.appLanguage == "ar"
                ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                : getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic),
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
            ? const Icon(
                Icons.check,
                color: AppColors.whiteColor,
                size: 35,
              )
            : const Icon(
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
