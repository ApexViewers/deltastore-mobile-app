// To parse this JSON data, do
//
//     final addToCartModel = addToCartModelFromJson(jsonString);

import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) => AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
  String? cartHash;
  String? cartKey;
  Currency? currency;
  Customer? customer;
  List<Item>? items;
  int? itemCount;
  int? itemsWeight;
  List<dynamic>? coupons;
  bool? needsPayment;
  bool? needsShipping;
  Shipping? shipping;
  List<dynamic>? fees;
  List<dynamic>? taxes;
  AddToCartModelTotals? totals;
  List<dynamic>? removedItems;
  List<dynamic>? crossSells;
  Notices? notices;

  AddToCartModel({
    this.cartHash,
    this.cartKey,
    this.currency,
    this.customer,
    this.items,
    this.itemCount,
    this.itemsWeight,
    this.coupons,
    this.needsPayment,
    this.needsShipping,
    this.shipping,
    this.fees,
    this.taxes,
    this.totals,
    this.removedItems,
    this.crossSells,
    this.notices,
  });

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
    cartHash: json["cart_hash"],
    cartKey: json["cart_key"],
    currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    itemCount: json["item_count"],
    itemsWeight: json["items_weight"],
    coupons: json["coupons"] == null ? [] : List<dynamic>.from(json["coupons"]!.map((x) => x)),
    needsPayment: json["needs_payment"],
    needsShipping: json["needs_shipping"],
    shipping: json["shipping"] == null ? null : Shipping.fromJson(json["shipping"]),
    fees: json["fees"] == null ? [] : List<dynamic>.from(json["fees"]!.map((x) => x)),
    taxes: json["taxes"] == null ? [] : List<dynamic>.from(json["taxes"]!.map((x) => x)),
    totals: json["totals"] == null ? null : AddToCartModelTotals.fromJson(json["totals"]),
   // removedItems: json["removed_items"] == null ? [] : List<dynamic>.from(json["removed_items"]!.map((x) => x)),
    crossSells: json["cross_sells"] == null ? [] : List<dynamic>.from(json["cross_sells"]!.map((x) => x)),
    notices: json["notices"] == null ? null : Notices.fromJson(json["notices"]),
  );

  Map<String, dynamic> toJson() => {
    "cart_hash": cartHash,
    "cart_key": cartKey,
    "currency": currency?.toJson(),
    "customer": customer?.toJson(),
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "item_count": itemCount,
    "items_weight": itemsWeight,
    "coupons": coupons == null ? [] : List<dynamic>.from(coupons!.map((x) => x)),
    "needs_payment": needsPayment,
    "needs_shipping": needsShipping,
    "shipping": shipping?.toJson(),
    "fees": fees == null ? [] : List<dynamic>.from(fees!.map((x) => x)),
    "taxes": taxes == null ? [] : List<dynamic>.from(taxes!.map((x) => x)),
    "totals": totals?.toJson(),
    "removed_items": removedItems == null ? [] : List<dynamic>.from(removedItems!.map((x) => x)),
    "cross_sells": crossSells == null ? [] : List<dynamic>.from(crossSells!.map((x) => x)),
    "notices": notices?.toJson(),
  };
}

class Currency {
  String? currencyCode;
  String? currencySymbol;
  int? currencyMinorUnit;
  String? currencyDecimalSeparator;
  String? currencyThousandSeparator;
  String? currencyPrefix;
  String? currencySuffix;

  Currency({
    this.currencyCode,
    this.currencySymbol,
    this.currencyMinorUnit,
    this.currencyDecimalSeparator,
    this.currencyThousandSeparator,
    this.currencyPrefix,
    this.currencySuffix,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    currencyCode: json["currency_code"],
    currencySymbol: json["currency_symbol"],
    currencyMinorUnit: json["currency_minor_unit"],
    currencyDecimalSeparator: json["currency_decimal_separator"],
    currencyThousandSeparator: json["currency_thousand_separator"],
    currencyPrefix: json["currency_prefix"],
    currencySuffix: json["currency_suffix"],
  );

  Map<String, dynamic> toJson() => {
    "currency_code": currencyCode,
    "currency_symbol": currencySymbol,
    "currency_minor_unit": currencyMinorUnit,
    "currency_decimal_separator": currencyDecimalSeparator,
    "currency_thousand_separator": currencyThousandSeparator,
    "currency_prefix": currencyPrefix,
    "currency_suffix": currencySuffix,
  };
}

class Customer {
  BillingAddress? billingAddress;
  ShippingAddress? shippingAddress;

  Customer({
    this.billingAddress,
    this.shippingAddress,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    billingAddress: json["billing_address"] == null ? null : BillingAddress.fromJson(json["billing_address"]),
    shippingAddress: json["shipping_address"] == null ? null : ShippingAddress.fromJson(json["shipping_address"]),
  );

  Map<String, dynamic> toJson() => {
    "billing_address": billingAddress?.toJson(),
    "shipping_address": shippingAddress?.toJson(),
  };
}

class BillingAddress {
  String? billingEmail;
  String? billingFirstName;
  String? billingLastName;
  String? billingPhone;
  String? billingCompany;
  String? billingCountry;
  String? billingAddress1;
  String? billingAddress2;
  String? billingCity;
  String? billingState;
  String? billingPostcode;

  BillingAddress({
    this.billingEmail,
    this.billingFirstName,
    this.billingLastName,
    this.billingPhone,
    this.billingCompany,
    this.billingCountry,
    this.billingAddress1,
    this.billingAddress2,
    this.billingCity,
    this.billingState,
    this.billingPostcode,
  });

  factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
    billingEmail: json["billing_email"],
    billingFirstName: json["billing_first_name"],
    billingLastName: json["billing_last_name"],
    billingPhone: json["billing_phone"],
    billingCompany: json["billing_company"],
    billingCountry: json["billing_country"],
    billingAddress1: json["billing_address_1"],
    billingAddress2: json["billing_address_2"],
    billingCity: json["billing_city"],
    billingState: json["billing_state"],
    billingPostcode: json["billing_postcode"],
  );

  Map<String, dynamic> toJson() => {
    "billing_email": billingEmail,
    "billing_first_name": billingFirstName,
    "billing_last_name": billingLastName,
    "billing_phone": billingPhone,
    "billing_company": billingCompany,
    "billing_country": billingCountry,
    "billing_address_1": billingAddress1,
    "billing_address_2": billingAddress2,
    "billing_city": billingCity,
    "billing_state": billingState,
    "billing_postcode": billingPostcode,
  };
}

class ShippingAddress {
  String? shippingFirstName;
  String? shippingLastName;
  String? shippingCompany;
  String? shippingCountry;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingCity;
  String? shippingState;
  String? shippingPostcode;

  ShippingAddress({
    this.shippingFirstName,
    this.shippingLastName,
    this.shippingCompany,
    this.shippingCountry,
    this.shippingAddress1,
    this.shippingAddress2,
    this.shippingCity,
    this.shippingState,
    this.shippingPostcode,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
    shippingFirstName: json["shipping_first_name"],
    shippingLastName: json["shipping_last_name"],
    shippingCompany: json["shipping_company"],
    shippingCountry: json["shipping_country"],
    shippingAddress1: json["shipping_address_1"],
    shippingAddress2: json["shipping_address_2"],
    shippingCity: json["shipping_city"],
    shippingState: json["shipping_state"],
    shippingPostcode: json["shipping_postcode"],
  );

  Map<String, dynamic> toJson() => {
    "shipping_first_name": shippingFirstName,
    "shipping_last_name": shippingLastName,
    "shipping_company": shippingCompany,
    "shipping_country": shippingCountry,
    "shipping_address_1": shippingAddress1,
    "shipping_address_2": shippingAddress2,
    "shipping_city": shippingCity,
    "shipping_state": shippingState,
    "shipping_postcode": shippingPostcode,
  };
}

class Item {
  String? itemKey;
  int? id;
  String? name;
  String? title;
  String? price;
  Quantity? quantity;
  ItemTotals? totals;
  String? slug;
  Meta? meta;
  String? backorders;
  List<dynamic>? cartItemData;
  String? featuredImage;

  Item({
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

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemKey: json["item_key"],
    id: json["id"],
    name: json["name"],
    title: json["title"],
    price: json["price"],
    quantity: json["quantity"] == null ? null : Quantity.fromJson(json["quantity"]),
    totals: json["totals"] == null ? null : ItemTotals.fromJson(json["totals"]),
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

class ItemTotals {
  String? subtotal;
  int? subtotalTax;
  double? total;
  int? tax;

  ItemTotals({
    this.subtotal,
    this.subtotalTax,
    this.total,
    this.tax,
  });

  factory ItemTotals.fromJson(Map<String, dynamic> json) => ItemTotals(
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

class Notices {
  List<String>? success;

  Notices({
    this.success,
  });

  factory Notices.fromJson(Map<String, dynamic> json) => Notices(
    success: json["success"] == null ? [] : List<String>.from(json["success"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? [] : List<dynamic>.from(success!.map((x) => x)),
  };
}

class Shipping {
  int? totalPackages;
  bool? showPackageDetails;
  bool? hasCalculatedShipping;
  Packages? packages;

  Shipping({
    this.totalPackages,
    this.showPackageDetails,
    this.hasCalculatedShipping,
    this.packages,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
    totalPackages: json["total_packages"],
    showPackageDetails: json["show_package_details"],
    hasCalculatedShipping: json["has_calculated_shipping"],
    packages: json["packages"] == null ? null : Packages.fromJson(json["packages"]),
  );

  Map<String, dynamic> toJson() => {
    "total_packages": totalPackages,
    "show_package_details": showPackageDetails,
    "has_calculated_shipping": hasCalculatedShipping,
    "packages": packages?.toJson(),
  };
}

class Packages {
  Default? packagesDefault;

  Packages({
    this.packagesDefault,
  });

  factory Packages.fromJson(Map<String, dynamic> json) => Packages(
    packagesDefault: json["default"] == null ? null : Default.fromJson(json["default"]),
  );

  Map<String, dynamic> toJson() => {
    "default": packagesDefault?.toJson(),
  };
}

class Default {
  String? packageName;
  Rates? rates;
  String? packageDetails;
  int? index;
  String? chosenMethod;
  String? formattedDestination;

  Default({
    this.packageName,
    this.rates,
    this.packageDetails,
    this.index,
    this.chosenMethod,
    this.formattedDestination,
  });

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    packageName: json["package_name"],
    rates: json["rates"] == null ? null : Rates.fromJson(json["rates"]),
    packageDetails: json["package_details"],
    index: json["index"],
    chosenMethod: json["chosen_method"],
    formattedDestination: json["formatted_destination"],
  );

  Map<String, dynamic> toJson() => {
    "package_name": packageName,
    "rates": rates?.toJson(),
    "package_details": packageDetails,
    "index": index,
    "chosen_method": chosenMethod,
    "formatted_destination": formattedDestination,
  };
}

class Rates {
  FlatRate6? freeShipping1;
  FlatRate6? flatRate6;

  Rates({
    this.freeShipping1,
    this.flatRate6,
  });

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
    freeShipping1: json["free_shipping:1"] == null ? null : FlatRate6.fromJson(json["free_shipping:1"]),
    flatRate6: json["flat_rate:6"] == null ? null : FlatRate6.fromJson(json["flat_rate:6"]),
  );

  Map<String, dynamic> toJson() => {
    "free_shipping:1": freeShipping1?.toJson(),
    "flat_rate:6": flatRate6?.toJson(),
  };
}

class FlatRate6 {
  String? key;
  String? methodId;
  int? instanceId;
  String? label;
  String? cost;
  String? html;
  String? taxes;
  bool? chosenMethod;
  MetaData? metaData;

  FlatRate6({
    this.key,
    this.methodId,
    this.instanceId,
    this.label,
    this.cost,
    this.html,
    this.taxes,
    this.chosenMethod,
    this.metaData,
  });

  factory FlatRate6.fromJson(Map<String, dynamic> json) => FlatRate6(
    key: json["key"],
    methodId: json["method_id"],
    instanceId: json["instance_id"],
    label: json["label"],
    cost: json["cost"],
    html: json["html"],
    taxes: json["taxes"],
    chosenMethod: json["chosen_method"],
    metaData: json["meta_data"] == null ? null : MetaData.fromJson(json["meta_data"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "method_id": methodId,
    "instance_id": instanceId,
    "label": label,
    "cost": cost,
    "html": html,
    "taxes": taxes,
    "chosen_method": chosenMethod,
    "meta_data": metaData?.toJson(),
  };
}

class MetaData {
  String? items;

  MetaData({
    this.items,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
    items: json["items"],
  );

  Map<String, dynamic> toJson() => {
    "items": items,
  };
}

class AddToCartModelTotals {
  String? subtotal;
  String? subtotalTax;
  String? feeTotal;
  String? feeTax;
  String? discountTotal;
  String? discountTax;
  String? shippingTotal;
  String? shippingTax;
  String? total;
  String? totalTax;

  AddToCartModelTotals({
    this.subtotal,
    this.subtotalTax,
    this.feeTotal,
    this.feeTax,
    this.discountTotal,
    this.discountTax,
    this.shippingTotal,
    this.shippingTax,
    this.total,
    this.totalTax,
  });

  factory AddToCartModelTotals.fromJson(Map<String, dynamic> json) => AddToCartModelTotals(
    subtotal: json["subtotal"],
    subtotalTax: json["subtotal_tax"],
    feeTotal: json["fee_total"],
    feeTax: json["fee_tax"],
    discountTotal: json["discount_total"],
    discountTax: json["discount_tax"],
    shippingTotal: json["shipping_total"],
    shippingTax: json["shipping_tax"],
    total: json["total"],
    totalTax: json["total_tax"],
  );

  Map<String, dynamic> toJson() => {
    "subtotal": subtotal,
    "subtotal_tax": subtotalTax,
    "fee_total": feeTotal,
    "fee_tax": feeTax,
    "discount_total": discountTotal,
    "discount_tax": discountTax,
    "shipping_total": shippingTotal,
    "shipping_tax": shippingTax,
    "total": total,
    "total_tax": totalTax,
  };
}
