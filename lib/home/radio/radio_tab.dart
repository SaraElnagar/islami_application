import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart' hide Radio;
import 'package:http/http.dart' as http;
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/home/radio/radio_item.dart';
import 'package:islami_app/model/radio_model.dart';
import 'package:provider/provider.dart';

import '../../providers/app_config_provider.dart';

class RadioTab extends StatelessWidget {
  AudioPlayer player = AudioPlayer();
  Radios? radios;

  RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    bool isLightTheme = provider.appTheme == ThemeMode.light;
    return FutureBuilder(
        future: getRadios(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Radios>? radios = snapshot.data?.radios ?? [];
            return Column(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/radio_logo.png",
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: RadioItem(
                      player: player,
                      radios: radios[index],
                    ),
                  ),
                  itemCount: radios.length,
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                ))
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
                child: CircularProgressIndicator(
              color:
                  isLightTheme ? AppColors.beigeColor : AppColors.yellowColor,
            ));
          } else {
            return const Center();
          }
        });
  }

  Future<RadioModel?> getRadios() async {
    var uri = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // print(response.body);
      return RadioModel.fromJson(json);
    }
  }
}
