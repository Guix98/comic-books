import 'dart:convert';

import 'package:comic_book/models/image_collection.dart';

class Issue {
  int? id;
  DateTime? dateAdded;
  ImageCollection? image;
  String? issueNumber;
  String? name;

  Issue({
    this.id,
    this.dateAdded,
    this.image,
    this.issueNumber,
    this.name,
  });

  Issue copyWith({
    int? id,
    DateTime? dateAdded,
    ImageCollection? image,
    String? issueNumber,
    String? name,
  }) =>
      Issue(
        id: id ?? this.id,
        dateAdded: dateAdded ?? this.dateAdded,
        image: image ?? this.image,
        issueNumber: issueNumber ?? this.issueNumber,
        name: name ?? this.name,
      );

  factory Issue.fromRawJson(String str) => Issue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        id: json["id"],
        dateAdded: json["date_added"] == null
            ? null
            : DateTime.parse(json["date_added"]),
        image: json["image"] == null
            ? null
            : ImageCollection.fromJson(json["image"]),
        issueNumber: json["issue_number"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_added": dateAdded?.toIso8601String(),
        "image": image?.toJson(),
        "issue_number": issueNumber,
        "name": name,
      };
}
