import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int index = 0;
  double turn = 0.0;
  List<String> praises = [
    "سبحان الله",
    "الحمد الله",
    "الله اكبر",
    "لا اله الا الله",
    "لا حول و لا قوة الا بالله"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    bool isLightTheme = provider.appTheme == ThemeMode.light;

    return Center(
      child: Column(
        children: [
          Stack(children: [
            Positioned(
              // top: 0.5,
              // left: 110,
              top: MediaQuery.of(context).size.width * 0.003,
              left: MediaQuery.of(context).size.height * 0.12,
              child: Image.asset(isLightTheme
                  ? "assets/images/head_sebha.png"
                  : "assets/images/dark_head_sebha.png"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: GestureDetector(
                onTap: onTap,
                child: AnimatedRotation(
                  turns: turn,
                  duration: const Duration(seconds: 1),
                  child: Image.asset(isLightTheme
                      ? "assets/images/body_sebha.png"
                      : "assets/images/dark_body_sebha.png"),
                ),
              ),
            ),
          ]),
          const SizedBox(
            height: 55,
          ),
          Text(
            AppLocalizations.of(context)!.number_of_praises,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isLightTheme
                      ? AppColors.blackColor
                      : AppColors.whiteColor,
                ),
          ),
          const SizedBox(
            height: 35,
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.03),
            decoration: BoxDecoration(
              color:
                  isLightTheme ? AppColors.beigeColor : AppColors.darkBlueColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "$counter",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color:
                    isLightTheme ? AppColors.blackColor : AppColors.whiteColor,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            decoration: BoxDecoration(
              color: isLightTheme
                  ? AppColors.primaryLightColor
                  : AppColors.yellowColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              praises[index],
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  onTap() {
    turn += 0.2;
    counter++;
    if (counter % 33 == 0) {
      index++;
    }
    if (index == praises.length) {
      index = 0;
      counter = 0;
    }
    setState(() {});
  }
}
