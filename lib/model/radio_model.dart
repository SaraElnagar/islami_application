class RadioModel {
  List<Radios>? radios;

  RadioModel({this.radios});

  RadioModel.fromJson(Map<String, dynamic> json) {
    if (json['radios'] != null) {
      radios = <Radios>[];
      json['radios'].forEach((v) {
        radios!.add(Radios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (radios != null) {
      data['radios'] = radios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Radios {
  int? id;
  String? name;
  String? url;
  String? recentDate;

  Radios({this.id, this.name, this.url, this.recentDate});

  Radios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['recent_date'] = recentDate;
    return data;
  }
}
