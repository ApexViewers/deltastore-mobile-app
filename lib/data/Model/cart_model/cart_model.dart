
class CartModel {
  String? cartHash;
  String? cartKey;
  Currency? currency;
  Customer? customer;
  List<Items>? items;
  int? itemCount;
  int? itemsWeight;
  List<String>? coupons;
  bool? needsPayment;
  bool? needsShipping;
  Shipping? shipping;
  List<dynamic>? fees;
  List<dynamic>? taxes;
  Totals? totals;
  List<dynamic>? removedItems;
  List<dynamic>? crossSells;
  List<dynamic>? notices;

  CartModel({
    this.cartHash,
    this.cartKey,
    this.currency,
    this.customer,
    this.items = const [],
    this.itemCount,
    this.itemsWeight,
    this.coupons = const [],
    this.needsPayment,
    this.needsShipping,
    this.shipping,
    this.fees = const [],
    this.taxes = const [],
    this.totals,
    this.removedItems = const [],
    this.crossSells = const [],
    this.notices = const [],
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartHash: json['cart_hash'],
      cartKey: json['cart_key'],
      currency: json['currency'] != null ? Currency.fromJson(json['currency']) : null,
      customer: json['customer'] != null ? Customer.fromJson(json['customer']) : null,
      items: List<Items>.from(json['items'].map((x) => Items.fromJson(x))),
      itemCount: json['item_count'],
      itemsWeight: json['items_weight'],
      coupons: List<String>.from(json['coupons'].map((x) => x)),
      needsPayment: json['needs_payment'],
      needsShipping: json['needs_shipping'],
      shipping: json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null,
      fees: List<dynamic>.from(json['fees'].map((x) => x)),
      taxes: List<dynamic>.from(json['taxes'].map((x) => x)),
      totals: json['totals'] != null ? Totals.fromJson(json['totals']) : null,
      removedItems: List<dynamic>.from(json['removed_items'].map((x) => x)),
      crossSells: List<dynamic>.from(json['cross_sells'].map((x) => x)),
      notices: List<dynamic>.from(json['notices'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cart_hash': cartHash,
      'cart_key': cartKey,
      'currency': currency?.toJson(),
      'customer': customer?.toJson(),
      'items': items?.map((x) => x.toJson()).toList(),
      'item_count': itemCount,
      'items_weight': itemsWeight,
      'coupons': coupons,
      'needs_payment': needsPayment,
      'needs_shipping': needsShipping,
      'shipping': shipping?.toJson(),
      'fees': fees,
      'taxes': taxes,
      'totals': totals?.toJson(),
      'removed_items': removedItems,
      'cross_sells': crossSells,
      'notices': notices,
    };
  }
}

class Currency {
  String currencyCode;
  String currencySymbol;
  int currencyMinorUnit;
  String currencyDecimalSeparator;
  String currencyThousandSeparator;
  String currencyPrefix;
  String currencySuffix;

  Currency({
    required this.currencyCode,
    required this.currencySymbol,
    required this.currencyMinorUnit,
    required this.currencyDecimalSeparator,
    required this.currencyThousandSeparator,
    required this.currencyPrefix,
    required this.currencySuffix,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      currencyCode: json['currency_code'],
      currencySymbol: json['currency_symbol'],
      currencyMinorUnit: json['currency_minor_unit'],
      currencyDecimalSeparator: json['currency_decimal_separator'],
      currencyThousandSeparator: json['currency_thousand_separator'],
      currencyPrefix: json['currency_prefix'],
      currencySuffix: json['currency_suffix'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency_code': currencyCode,
      'currency_symbol': currencySymbol,
      'currency_minor_unit': currencyMinorUnit,
      'currency_decimal_separator': currencyDecimalSeparator,
      'currency_thousand_separator': currencyThousandSeparator,
      'currency_prefix': currencyPrefix,
      'currency_suffix': currencySuffix,
    };
  }
}

class Customer {
  BillingAddress? billingAddress;
  ShippingAddress? shippingAddress;

  Customer({this.billingAddress, this.shippingAddress});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      billingAddress: json['billing_address'] != null ? BillingAddress.fromJson(json['billing_address']) : null,
      shippingAddress: json['shipping_address'] != null ? ShippingAddress.fromJson(json['shipping_address']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'billing_address': billingAddress?.toJson(),
      'shipping_address': shippingAddress?.toJson(),
    };
  }
}

class BillingAddress {
  String? billingEmail;
  String? billingFirstName;
  String? billingLastName;
  String? billingPhone;
  String? billingCompany;
  String billingCountry;
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
    required this.billingCountry,
    this.billingAddress1,
    this.billingAddress2,
    this.billingCity,
    this.billingState,
    this.billingPostcode,
  });

  factory BillingAddress.fromJson(Map<String, dynamic> json) {
    return BillingAddress(
      billingEmail: json['billing_email'],
      billingFirstName: json['billing_first_name'],
      billingLastName: json['billing_last_name'],
      billingPhone: json['billing_phone'],
      billingCompany: json['billing_company'],
      billingCountry: json['billing_country'],
      billingAddress1: json['billing_address_1'],
      billingAddress2: json['billing_address_2'],
      billingCity: json['billing_city'],
      billingState: json['billing_state'],
      billingPostcode: json['billing_postcode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'billing_email': billingEmail,
      'billing_first_name': billingFirstName,
      'billing_last_name': billingLastName,
      'billing_phone': billingPhone,
      'billing_company': billingCompany,
      'billing_country': billingCountry,
      'billing_address_1': billingAddress1,
      'billing_address_2': billingAddress2,
      'billing_city': billingCity,
      'billing_state': billingState,
      'billing_postcode': billingPostcode,
    };
  }
}

class ShippingAddress {
  String? shippingFirstName;
  String? shippingLastName;
  String? shippingCompany;
  String shippingCountry;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingCity;
  String? shippingState;
  String? shippingPostcode;

  ShippingAddress({
    this.shippingFirstName,
    this.shippingLastName,
    this.shippingCompany,
    required this.shippingCountry,
    this.shippingAddress1,
    this.shippingAddress2,
    this.shippingCity,
    this.shippingState,
    this.shippingPostcode,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      shippingFirstName: json['shipping_first_name'],
      shippingLastName: json['shipping_last_name'],
      shippingCompany: json['shipping_company'],
      shippingCountry: json['shipping_country'],
      shippingAddress1: json['shipping_address_1'],
      shippingAddress2: json['shipping_address_2'],
      shippingCity: json['shipping_city'],
      shippingState: json['shipping_state'],
      shippingPostcode: json['shipping_postcode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shipping_first_name': shippingFirstName,
      'shipping_last_name': shippingLastName,
      'shipping_company': shippingCompany,
      'shipping_country': shippingCountry,
      'shipping_address_1': shippingAddress1,
      'shipping_address_2': shippingAddress2,
      'shipping_city': shippingCity,
      'shipping_state': shippingState,
      'shipping_postcode': shippingPostcode,
    };
  }
}

class Items {
  Items();

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class Shipping {
  int totalPackages;
  bool showPackageDetails;
  bool hasCalculatedShipping;
  List<dynamic> packages;

  Shipping({
    required this.totalPackages,
    required this.showPackageDetails,
    required this.hasCalculatedShipping,
    required this.packages,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) {
    return Shipping(
      totalPackages: json['total_packages'],
      showPackageDetails: json['show_package_details'],
      hasCalculatedShipping: json['has_calculated_shipping'],
      packages: List<dynamic>.from(json['packages'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_packages': totalPackages,
      'show_package_details': showPackageDetails,
      'has_calculated_shipping': hasCalculatedShipping,
      'packages': packages,
    };
  }
}

class Totals {
  String subtotal;
  String subtotalTax;
  String feeTotal;
  String feeTax;
  String discountTotal;
  String discountTax;
  String shippingTotal;
  String shippingTax;
  String total;
  String totalTax;

  Totals({
    required this.subtotal,
    required this.subtotalTax,
    required this.feeTotal,
    required this.feeTax,
    required this.discountTotal,
    required this.discountTax,
    required this.shippingTotal,
    required this.shippingTax,
    required this.total,
    required this.totalTax,
  });

  factory Totals.fromJson(Map<String, dynamic> json) {
    return Totals(
      subtotal: json['subtotal'],
      subtotalTax: json['subtotal_tax'],
      feeTotal: json['fee_total'],
      feeTax: json['fee_tax'],
      discountTotal: json['discount_total'],
      discountTax: json['discount_tax'],
      shippingTotal: json['shipping_total'],
      shippingTax: json['shipping_tax'],
      total: json['total'],
      totalTax: json['total_tax'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'subtotal_tax': subtotalTax,
      'fee_total': feeTotal,
      'fee_tax': feeTax,
      'discount_total': discountTotal,
      'discount_tax': discountTax,
      'shipping_total': shippingTotal,
      'shipping_tax': shippingTax,
      'total': total,
      'total_tax': totalTax,
    };
  }
}
