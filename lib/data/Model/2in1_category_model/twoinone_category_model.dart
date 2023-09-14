// To parse this JSON data, do
//
//     final twoInOneModel = twoInOneModelFromJson(jsonString);

import 'dart:convert';

TwoInOneModel twoInOneModelFromJson(String str) => TwoInOneModel.fromJson(json.decode(str));

String twoInOneModelToJson(TwoInOneModel data) => json.encode(data.toJson());

class TwoInOneModel {
  int? id;
  String? name;
  String? slug;

  TwoInOneModel({
    this.id,
    this.name,
    this.slug,
  });

  factory TwoInOneModel.fromJson(Map<String, dynamic> json) => TwoInOneModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
  };
}
