import 'dart:convert';

class ImageCollection {
  String? iconUrl;
  String? mediumUrl;
  String? screenUrl;
  String? screenLargeUrl;
  String? smallUrl;
  String? superUrl;
  String? thumbUrl;
  String? tinyUrl;
  String? originalUrl;
  String? imageTags;

  ImageCollection({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  ImageCollection copyWith({
    String? iconUrl,
    String? mediumUrl,
    String? screenUrl,
    String? screenLargeUrl,
    String? smallUrl,
    String? superUrl,
    String? thumbUrl,
    String? tinyUrl,
    String? originalUrl,
    String? imageTags,
  }) =>
      ImageCollection(
        iconUrl: iconUrl ?? this.iconUrl,
        mediumUrl: mediumUrl ?? this.mediumUrl,
        screenUrl: screenUrl ?? this.screenUrl,
        screenLargeUrl: screenLargeUrl ?? this.screenLargeUrl,
        smallUrl: smallUrl ?? this.smallUrl,
        superUrl: superUrl ?? this.superUrl,
        thumbUrl: thumbUrl ?? this.thumbUrl,
        tinyUrl: tinyUrl ?? this.tinyUrl,
        originalUrl: originalUrl ?? this.originalUrl,
        imageTags: imageTags ?? this.imageTags,
      );

  factory ImageCollection.fromRawJson(String str) =>
      ImageCollection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageCollection.fromJson(Map<String, dynamic> json) =>
      ImageCollection(
        iconUrl: json["icon_url"],
        mediumUrl: json["medium_url"],
        screenUrl: json["screen_url"],
        screenLargeUrl: json["screen_large_url"],
        smallUrl: json["small_url"],
        superUrl: json["super_url"],
        thumbUrl: json["thumb_url"],
        tinyUrl: json["tiny_url"],
        originalUrl: json["original_url"],
        imageTags: json["image_tags"],
      );

  Map<String, dynamic> toJson() => {
        "icon_url": iconUrl,
        "medium_url": mediumUrl,
        "screen_url": screenUrl,
        "screen_large_url": screenLargeUrl,
        "small_url": smallUrl,
        "super_url": superUrl,
        "thumb_url": thumbUrl,
        "tiny_url": tinyUrl,
        "original_url": originalUrl,
        "image_tags": imageTags,
      };
}
