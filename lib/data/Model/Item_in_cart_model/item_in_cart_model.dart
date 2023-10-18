// To parse this JSON data, do
//
//     final itemInCartControllerModel = itemInCartControllerModelFromJson(jsonString);

import 'dart:convert';

Map<String, ItemInCartControllerModel> itemInCartControllerModelFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, ItemInCartControllerModel>(k, ItemInCartControllerModel.fromJson(v)));

String itemInCartControllerModelToJson(Map<String, ItemInCartControllerModel> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class ItemInCartControllerModel {
  String? itemKey;
  int? id;
  String? name;
  String? title;
  String? price;
  Quantity? quantity;
  Totals? totals;
  String? slug;
  Meta? meta;
  String? backorders;
  List<dynamic>? cartItemData;
  String? featuredImage;

  ItemInCartControllerModel({
    this.itemKey,
    this.id,
    this.name,
    this.title,
    this.price,
    this.quantity,
    this.totals,
    this.slug,
    this.meta,
    this.backorders,
    this.cartItemData,
    this.featuredImage,
  });

  factory ItemInCartControllerModel.fromJson(Map<String, dynamic> json) => ItemInCartControllerModel(
    itemKey: json["item_key"],
    id: json["id"],
    name: json["name"],
    title: json["title"],
    price: json["price"],
    quantity: json["quantity"] == null ? null : Quantity.fromJson(json["quantity"]),
    totals: json["totals"] == null ? null : Totals.fromJson(json["totals"]),
    slug: json["slug"],
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    backorders: json["backorders"],
    cartItemData: json["cart_item_data"] == null ? [] : List<dynamic>.from(json["cart_item_data"]!.map((x) => x)),
    featuredImage: json["featured_image"],
  );

  Map<String, dynamic> toJson() => {
    "item_key": itemKey,
    "id": id,
    "name": name,
    "title": title,
    "price": price,
    "quantity": quantity?.toJson(),
    "totals": totals?.toJson(),
    "slug": slug,
    "meta": meta?.toJson(),
    "backorders": backorders,
    "cart_item_data": cartItemData == null ? [] : List<dynamic>.from(cartItemData!.map((x) => x)),
    "featured_image": featuredImage,
  };
}

class Meta {
  String? productType;
  String? sku;
  Dimensions? dimensions;
  int? weight;
  List<dynamic>? variation;

  Meta({
    this.productType,
    this.sku,
    this.dimensions,
    this.weight,
    this.variation,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    productType: json["product_type"],
    sku: json["sku"],
    dimensions: json["dimensions"] == null ? null : Dimensions.fromJson(json["dimensions"]),
    weight: json["weight"],
    variation: json["variation"] == null ? [] : List<dynamic>.from(json["variation"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "product_type": productType,
    "sku": sku,
    "dimensions": dimensions?.toJson(),
    "weight": weight,
    "variation": variation == null ? [] : List<dynamic>.from(variation!.map((x) => x)),
  };
}

class Dimensions {
  String? length;
  String? width;
  String? height;
  String? unit;

  Dimensions({
    this.length,
    this.width,
    this.height,
    this.unit,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    length: json["length"],
    width: json["width"],
    height: json["height"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "length": length,
    "width": width,
    "height": height,
    "unit": unit,
  };
}

class Quantity {
  int? value;
  int? minPurchase;
  int? maxPurchase;

  Quantity({
    this.value,
    this.minPurchase,
    this.maxPurchase,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) => Quantity(
    value: json["value"],
    minPurchase: json["min_purchase"],
    maxPurchase: json["max_purchase"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "min_purchase": minPurchase,
    "max_purchase": maxPurchase,
  };
}

class Totals {
  String? subtotal;
  int? subtotalTax;
  double? total;
  int? tax;

  Totals({
    this.subtotal,
    this.subtotalTax,
    this.total,
    this.tax,
  });

  factory Totals.fromJson(Map<String, dynamic> json) => Totals(
    subtotal: json["subtotal"],
    subtotalTax: json["subtotal_tax"],
    total: json["total"]?.toDouble(),
    tax: json["tax"],
  );

  Map<String, dynamic> toJson() => {
    "subtotal": subtotal,
    "subtotal_tax": subtotalTax,
    "total": total,
    "tax": tax,
  };
}
