import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/quran/item_sura_name.dart';
import 'package:islami_app/providers/app_config_provider.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  List<String> name = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Column(
      children: [
        Expanded(flex: 1, child: Image.asset("assets/images/quran_logo.png")),
        provider.appTheme == ThemeMode.light
            ? const Divider(
                color: AppColors.primaryLightColor,
                thickness: 3,
              )
            : const Divider(
                color: AppColors.yellowColor,
                thickness: 3,
              ),
        provider.appTheme == ThemeMode.light
            ? Text(
                provider.appLanguage == "en"
                    ? AppLocalizations.of(context)!.sura_name
                    : AppLocalizations.of(context)!.sura_name,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            : Text(
                provider.appLanguage == "en"
                    ? AppLocalizations.of(context)!.sura_name
                    : AppLocalizations.of(context)!.sura_name,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.whiteColor),
              ),
        provider.appTheme == ThemeMode.light
            ? const Divider(
                color: AppColors.primaryLightColor,
                thickness: 3,
              )
            : const Divider(
                color: AppColors.yellowColor,
                thickness: 3,
              ),
        Expanded(
          flex: 2,
          child: ListView.separated(
            separatorBuilder: (context, index) {
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
              return ItemSuraName(
                name: name[index],
                index: index,
              );
            },
            itemCount: name.length,
          ),
        )
      ],
    );
  }
}
