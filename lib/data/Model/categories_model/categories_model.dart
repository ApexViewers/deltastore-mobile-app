import 'dart:convert';

List<AllCategoriesModel> allCategoriesModelFromJson(String str) => List<AllCategoriesModel>.from(json.decode(str).map((x) => AllCategoriesModel.fromJson(x)));

String allCategoriesModelToJson(List<AllCategoriesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCategoriesModel {
  int? id;
  String? name;
  String? slug;

  AllCategoriesModel({
    this.id,
    this.name,
    this.slug,
  });

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) => AllCategoriesModel(
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