import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:islami_app/model/radio_model.dart';
import 'package:provider/provider.dart';

import '../../app_colors.dart';
import '../../providers/app_config_provider.dart';

class RadioItem extends StatelessWidget {
  AudioPlayer player;
  Radios radios;

  RadioItem({super.key, required this.radios, required this.player});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    bool isLightTheme = provider.appTheme == ThemeMode.light;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          " إذاعه الشيخ ${radios.name ?? ""}",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color:
                    isLightTheme ? AppColors.blackColor : AppColors.whiteColor,
              ),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () async {
                await player.play(UrlSource(radios.url ?? ""));
              },
              icon: const Icon(Icons.play_arrow_rounded),
              color: isLightTheme
                  ? AppColors.primaryLightColor
                  : AppColors.yellowColor,
              style: const ButtonStyle(iconSize: WidgetStatePropertyAll(48)),
            ),
            IconButton(
              onPressed: () async {
                await player.pause();
              },
              icon: const Icon(Icons.stop_circle_rounded),
              color: isLightTheme
                  ? AppColors.primaryLightColor
                  : AppColors.yellowColor,
              style: const ButtonStyle(iconSize: WidgetStatePropertyAll(47)),
            ),
          ],
        )
      ],
    );
  }
}
