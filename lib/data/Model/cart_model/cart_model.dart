class CartModel {
  String cartHash;
  String cartKey;
  Currency currency;
  Customer customer;
  List<Item> items;
  int itemCount;
  int itemsWeight;
  List<dynamic> coupons; // Handle this based on the actual data type
  bool needsPayment;
  bool needsShipping;
  Shipping shipping;
  List<dynamic> fees; // Handle this based on the actual data type
  List<dynamic> taxes; // Handle this based on the actual data type
  Totals totals;
  List<dynamic> removedItems; // Handle this based on the actual data type
  List<dynamic> crossSells; // Handle this based on the actual data type
  List<dynamic> notices; // Handle this based on the actual data type

  CartModel({
    required this.cartHash,
    required this.cartKey,
    required this.currency,
    required this.customer,
    required this.items,
    required this.itemCount,
    required this.itemsWeight,
    required this.coupons,
    required this.needsPayment,
    required this.needsShipping,
    required this.shipping,
    required this.fees,
    required this.taxes,
    required this.totals,
    required this.removedItems,
    required this.crossSells,
    required this.notices,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cartHash: json['cart_hash'],
      cartKey: json['cart_key'],
      currency: Currency.fromJson(json['currency']),
      customer: Customer.fromJson(json['customer']),
      // items: List<Item>.from(json['items'].map((item) => Item.fromJson(item))),
      items: (json['items'] as List)
          .map((item) => Item.fromJson(item))
          .toList(),
      itemCount: json['item_count'],
      itemsWeight: json['items_weight'],
      coupons: json['coupons'], // Handle this based on the actual data type
      needsPayment: json['needs_payment'],
      needsShipping: json['needs_shipping'],
      shipping: Shipping.fromJson(json['shipping']),
      fees: json['fees'], // Handle this based on the actual data type
      taxes: json['taxes'], // Handle this based on the actual data type
      totals: Totals.fromJson(json['totals']),
      removedItems: json['removed_items'], // Handle this based on the actual data type
      crossSells: json['cross_sells'], // Handle this based on the actual data type
      notices: json['notices'], // Handle this based on the actual data type
    );
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
}

class Customer {
  BillingAddress billingAddress;
  ShippingAddress shippingAddress;

  Customer({
    required this.billingAddress,
    required this.shippingAddress,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      billingAddress: BillingAddress.fromJson(json['billing_address']),
      shippingAddress: ShippingAddress.fromJson(json['shipping_address']),
    );
  }
}

class BillingAddress {
  String billingFirstName;
  String billingLastName;
  String billingCompany;
  String billingCountry;
  String billingAddress1;
  String billingAddress2;
  String billingPostcode;
  String billingCity;
  String billingState;
  String billingPhone;
  String billingEmail;

  BillingAddress({
    required this.billingFirstName,
    required this.billingLastName,
    required this.billingCompany,
    required this.billingCountry,
    required this.billingAddress1,
    required this.billingAddress2,
    required this.billingPostcode,
    required this.billingCity,
    required this.billingState,
    required this.billingPhone,
    required this.billingEmail,
  });

  factory BillingAddress.fromJson(Map<String, dynamic> json) {
    return BillingAddress(
      billingFirstName: json['billing_first_name'],
      billingLastName: json['billing_last_name'],
      billingCompany: json['billing_company'],
      billingCountry: json['billing_country'],
      billingAddress1: json['billing_address_1'],
      billingAddress2: json['billing_address_2'],
      billingPostcode: json['billing_postcode'],
      billingCity: json['billing_city'],
      billingState: json['billing_state'],
      billingPhone: json['billing_phone'],
      billingEmail: json['billing_email'],
    );
  }
}

class ShippingAddress {
  String shippingFirstName;
  String shippingLastName;
  String shippingCompany;
  String shippingCountry;
  String shippingAddress1;
  String shippingAddress2;
  String shippingPostcode;
  String shippingCity;
  String shippingState;

  ShippingAddress({
    required this.shippingFirstName,
    required this.shippingLastName,
    required this.shippingCompany,
    required this.shippingCountry,
    required this.shippingAddress1,
    required this.shippingAddress2,
    required this.shippingPostcode,
    required this.shippingCity,
    required this.shippingState,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) {
    return ShippingAddress(
      shippingFirstName: json['shipping_first_name'],
      shippingLastName: json['shipping_last_name'],
      shippingCompany: json['shipping_company'],
      shippingCountry: json['shipping_country'],
      shippingAddress1: json['shipping_address_1'],
      shippingAddress2: json['shipping_address_2'],
      shippingPostcode: json['shipping_postcode'],
      shippingCity: json['shipping_city'],
      shippingState: json['shipping_state'],
    );
  }
}

class Item {
  String itemKey;
  int id;
  String name;
  String title;
  String price;
  Quantity quantity;
  Totals totals;
  String slug;
  Map<String, dynamic> meta;
  List<dynamic> cartItemData; // Handle this based on the actual data type
  String featuredImage;

  Item({
    required this.itemKey,
    required this.id,
    required this.name,
    required this.title,
    required this.price,
    required this.quantity,
    required this.totals,
    required this.slug,
    required this.meta,
    required this.cartItemData,
    required this.featuredImage,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemKey: json['item_key'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      title: json['title'] as String,
      price: json['price'] as String,
      quantity: Quantity.fromJson(json['quantity']),
      totals: Totals.fromJson(json['totals']),
      slug: json['slug'] as String,
      meta: json['meta'] as Map<String, dynamic>,
      cartItemData: json['cart_item_data'] as List<dynamic>,
      featuredImage: json['featured_image'] as String
    );
  }
}

class Quantity {
  int value;
  int minPurchase;
  int maxPurchase;

  Quantity({
    required this.value,
    required this.minPurchase,
    required this.maxPurchase,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) {
    return Quantity(
      value: json['value'],
      minPurchase: json['min_purchase'],
      maxPurchase: json['max_purchase'],
    );
  }
}

class TaxData {
  List<dynamic> subtotal; // Handle this based on the actual data type
  List<dynamic> total; // Handle this based on the actual data type

  TaxData({
    required this.subtotal,
    required this.total,
  });

  factory TaxData.fromJson(Map<String, dynamic> json) {
    return TaxData(
      subtotal: json['subtotal'], // Handle this based on the actual data type
      total: json['total'], // Handle this based on the actual data type
    );
  }
}

class Totals {
  String subtotal;
  String subtotalTax;
  String total;
  String tax;

  Totals({
    required this.subtotal,
    required this.subtotalTax,
    required this.total,
    required this.tax,
  });

  factory Totals.fromJson(Map<String, dynamic> json) {
    return Totals(
      subtotal: json['subtotal'].toString(),
      subtotalTax: json['subtotal_tax'].toString(),
      total: json['total'].toString(),
      tax: json['tax'].toString()

    );
  }
}

class Shipping {
  int totalPackages;
  bool showPackageDetails;
  bool hasCalculatedShipping;
  Map<String, Package> packages;

  Shipping({
    required this.totalPackages,
    required this.showPackageDetails,
    required this.hasCalculatedShipping,
    required this.packages,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) {
    Map<String, Package> packages = {};
    (json['packages'] as Map<String, dynamic>).forEach((key, value) {
      packages[key] = Package.fromJson(value);
    });
    return Shipping(
      totalPackages: json['total_packages'],
      showPackageDetails: json['show_package_details'],
      hasCalculatedShipping: json['has_calculated_shipping'],
      packages: packages,
    );
  }
}

class Package {
  String packageName;
  Map<String, dynamic> rates;
  String packageDetails;
  int index;
  String chosenMethod;
  String formattedDestination;

  Package({
    required this.packageName,
    required this.rates,
    required this.packageDetails,
    required this.index,
    required this.chosenMethod,
    required this.formattedDestination,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      packageName: json['package_name'],
      rates: json['rates'],
      packageDetails: json['package_details'],
      index: json['index'],
      chosenMethod: json['chosen_method'],
      formattedDestination: json['formatted_destination'],
    );
  }
}

// class Item {
//   // existing code
//
//   factory Item.fromJson(Map<String, dynamic> json) {
//     return Item(
//       itemKey: json['item_key'],
//       id: json['id'],
//       name: json['name'],
//       title: json['title'],
//       price: json['price'],
//       quantity: Quantity.fromJson(json['quantity']),
//       totals: Totals.fromJson(json['totals']),
//       slug: json['slug'],
//       meta: json['meta'],
//       cartItemData: json['cart_item_data'],
//       featuredImage: json['featured_image'],
//     );
//   }
// }

