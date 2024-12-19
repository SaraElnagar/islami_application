import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/home/hadeth/item_hadeth_name.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (ahadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset("assets/images/hadeth_logo.png")),
        provider.appTheme == ThemeMode.light
            ? Divider(
                color: AppColors.primaryLightColor,
                thickness: 3,
              )
            : Divider(
                color: AppColors.yellowColor,
                thickness: 3,
              ),
        provider.appTheme == ThemeMode.light
            ? Text(
                provider.appLanguage == "en"
                    ? AppLocalizations.of(context)!.hadeth_name
                    : AppLocalizations.of(context)!.hadeth_name,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            : Text(
                provider.appLanguage == "en"
                    ? AppLocalizations.of(context)!.hadeth_name
                    : AppLocalizations.of(context)!.hadeth_name,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.whiteColor),
              ),
        provider.appTheme == ThemeMode.light
            ? Divider(
                color: AppColors.primaryLightColor,
                thickness: 3,
              )
            : Divider(
                color: AppColors.yellowColor,
                thickness: 3,
              ),
        Expanded(
          flex: 2,
          child: ahadethList.isEmpty
              ? Center(
                  child: provider.appTheme == ThemeMode.light
                      ? CircularProgressIndicator(
                          color: AppColors.primaryLightColor,
                        )
                      : CircularProgressIndicator(
                          color: AppColors.yellowColor,
                        ),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return provider.appTheme == ThemeMode.light
                        ? Divider(
                            color: AppColors.primaryLightColor,
                            thickness: 2,
                          )
                        : Divider(
                            color: AppColors.yellowColor,
                            thickness: 2,
                          );
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethName(hadeth: ahadethList[index]);
                  },
                  itemCount: ahadethList.length,
                ),
        )
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = hadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      // print(hadethList[i]);
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, content: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

/// data class
class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.title, required this.content});
}
