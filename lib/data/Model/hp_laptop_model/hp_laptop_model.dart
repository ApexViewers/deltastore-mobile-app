// To parse this JSON data, do
//
//     final hpLaptopModel = hpLaptopModelFromJson(jsonString);

import 'dart:convert';

List<HpLaptopModel> hpLaptopModelFromJson(String str) => List<HpLaptopModel>.from(json.decode(str).map((x) => HpLaptopModel.fromJson(x)));

String hpLaptopModelToJson(List<HpLaptopModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HpLaptopModel {
  int? id;
  String? name;
  String? slug;
  String? price;
  String? regularPrice;
  String? salePrice;
  List<Image>? images;

  HpLaptopModel({
    this.id,
    this.name,
    this.slug,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.images,
  });

  factory HpLaptopModel.fromJson(Map<String, dynamic> json) => HpLaptopModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "price": price,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}

class Image {
  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  Image({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    dateCreatedGmt: json["date_created_gmt"] == null ? null : DateTime.parse(json["date_created_gmt"]),
    dateModified: json["date_modified"] == null ? null : DateTime.parse(json["date_modified"]),
    dateModifiedGmt: json["date_modified_gmt"] == null ? null : DateTime.parse(json["date_modified_gmt"]),
    src: json["src"],
    name: json["name"],
    alt: json["alt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated?.toIso8601String(),
    "date_created_gmt": dateCreatedGmt?.toIso8601String(),
    "date_modified": dateModified?.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
    "src": src,
    "name": name,
    "alt": alt,
  };
}
