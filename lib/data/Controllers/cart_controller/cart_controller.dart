import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../Model/cart_model/cart_model.dart';

class CartController extends GetxController {
  var cartData = CartModel(
    cartHash: '',
    cartKey: '',
    currency: Currency(
      currencyCode: '',
      currencySymbol: '',
      currencyMinorUnit: 0,
      currencyDecimalSeparator: '',
      currencyThousandSeparator: '',
      currencyPrefix: '',
      currencySuffix: '',
    ),
    customer: Customer(
      billingAddress: BillingAddress(
        billingFirstName: '',
        billingLastName: '',
        billingCompany: '',
        billingCountry: '',
        billingAddress1: '',
        billingAddress2: '',
        billingPostcode: '',
        billingCity: '',
        billingState: '',
        billingPhone: '',
        billingEmail: '',
      ),
      shippingAddress: ShippingAddress(
        shippingFirstName: '',
        shippingLastName: '',
        shippingCompany: '',
        shippingCountry: '',
        shippingAddress1: '',
        shippingAddress2: '',
        shippingPostcode: '',
        shippingCity: '',
        shippingState: '',
      ),
    ),
    items: [],
    itemCount: 0,
    itemsWeight: 0,
    coupons: [],
    needsPayment: false,
    needsShipping: false,
    shipping: Shipping(
      totalPackages: 0,
      showPackageDetails: false,
      hasCalculatedShipping: false,
      packages: {},
    ),
    fees: [],
    taxes: [],
    totals: Totals(
      subtotal: '',
      subtotalTax: '',
      total: '',
      tax: '',
    ),
    removedItems: [],
    crossSells: [],
    notices: [],
  ).obs;

  final String consumerKey = 'ck_7a6f61313c9c4fac5f8a5ec4f50545edb79ebfe5';
  final String secretKey = 'cs_ed196a2bae6d54ba6869b92ab8f4a19ca532f594';

  Future<bool> fetchCartData() async {
    try {
      Uri apiUrl =
          Uri.parse('https://stagging.ditllcae.com/wp-json/cocart/v2/cart');
      Map<String, String> headers = {
        'Authorization':
            'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
      };

      final response = await http.get(apiUrl, headers: headers);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        cartData.value = CartModel.fromJson(data);
        return true;
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}.');
        }
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
