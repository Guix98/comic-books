import 'dart:convert';

import 'package:comic_book/models/image_collection.dart';

class Comic {
  List<Credit>? characterCredits;
  ImageCollection? image;
  List<Credit>? locationCredits;
  String? name;
  List<Credit>? teamCredits;

  Comic({
    this.characterCredits,
    this.image,
    this.locationCredits,
    this.name,
    this.teamCredits,
  });

  Comic copyWith({
    List<Credit>? characterCredits,
    ImageCollection? image,
    List<Credit>? locationCredits,
    String? name,
    List<Credit>? teamCredits,
  }) =>
      Comic(
        characterCredits: characterCredits ?? this.characterCredits,
        image: image ?? this.image,
        locationCredits: locationCredits ?? this.locationCredits,
        name: name ?? this.name,
        teamCredits: teamCredits ?? this.teamCredits,
      );

  factory Comic.fromRawJson(String str) => Comic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comic.fromJson(Map<String, dynamic> json) => Comic(
        characterCredits: json["character_credits"] == null
            ? []
            : List<Credit>.from(
                json["character_credits"]!.map((x) => Credit.fromJson(x))),
        image: json["image"] == null
            ? null
            : ImageCollection.fromJson(json["image"]),
        locationCredits: json["location_credits"] == null
            ? []
            : List<Credit>.from(
                json["location_credits"]!.map((x) => Credit.fromJson(x))),
        name: json["name"],
        teamCredits: json["team_credits"] == null
            ? []
            : List<Credit>.from(
                json["team_credits"]!.map((x) => Credit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "character_credits": characterCredits == null
            ? []
            : List<dynamic>.from(characterCredits!.map((x) => x.toJson())),
        "image": image?.toJson(),
        "location_credits": locationCredits == null
            ? []
            : List<dynamic>.from(locationCredits!.map((x) => x.toJson())),
        "name": name,
        "team_credits": teamCredits == null
            ? []
            : List<dynamic>.from(teamCredits!.map((x) => x.toJson())),
      };
}

class Credit {
  String? apiDetailUrl;
  int? id;
  String? name;
  String? siteDetailUrl;

  Credit({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  Credit copyWith({
    String? apiDetailUrl,
    int? id,
    String? name,
    String? siteDetailUrl,
  }) =>
      Credit(
        apiDetailUrl: apiDetailUrl ?? this.apiDetailUrl,
        id: id ?? this.id,
        name: name ?? this.name,
        siteDetailUrl: siteDetailUrl ?? this.siteDetailUrl,
      );

  factory Credit.fromRawJson(String str) => Credit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Credit.fromJson(Map<String, dynamic> json) => Credit(
        apiDetailUrl: json["api_detail_url"],
        id: json["id"],
        name: json["name"],
        siteDetailUrl: json["site_detail_url"],
      );

  Map<String, dynamic> toJson() => {
        "api_detail_url": apiDetailUrl,
        "id": id,
        "name": name,
        "site_detail_url": siteDetailUrl,
      };
}
