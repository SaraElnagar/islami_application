import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/settings/language_bottom_sheet.dart';
import 'package:islami_app/home/settings/theme_bottom_sheet.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          provider.appTheme == ThemeMode.light
              ? Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              : Text(
                  AppLocalizations.of(context)!.language,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.whiteColor),
                ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: provider.appTheme == ThemeMode.light
                ? Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryLightColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.appLanguage == "en"
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 35,
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.yellowColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.appLanguage == "en"
                              ? AppLocalizations.of(context)!.english
                              : AppLocalizations.of(context)!.arabic,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.whiteColor),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 35,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
          ),
          SizedBox(
            height: 15,
          ),
          provider.appTheme == ThemeMode.light
              ? Text(
                  AppLocalizations.of(context)!.theme,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              : Text(
                  AppLocalizations.of(context)!.theme,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.whiteColor),
                ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: provider.appTheme == ThemeMode.light
                ? Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.primaryLightColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.appTheme == ThemeMode.light
                              ? AppLocalizations.of(context)!.light
                              : AppLocalizations.of(context)!.dark,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 35,
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.yellowColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.appTheme == ThemeMode.light
                              ? AppLocalizations.of(context)!.light
                              : AppLocalizations.of(context)!.dark,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.whiteColor),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 35,
                          color: AppColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
