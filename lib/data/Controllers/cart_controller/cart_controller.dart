import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Model/cart_model/cart_model.dart';

class CartController extends GetxController {
  Rx<CartModel> cart = CartModel().obs;
  RxBool isLoading = false.obs;
  RxString error = ''.obs;

  String consumerKey = 'ck_7a6f61313c9c4fac5f8a5ec4f50545edb79ebfe5';
  String secretKey = 'cs_ed196a2bae6d54ba6869b92ab8f4a19ca532f594'; //

  @override
  void onInit() {
    super.onInit();
    fetchCartData();
  }

  void fetchCartData() async {
    isLoading.value = true;

    try {
      Uri apiUrl = Uri.parse('https://yourdomain.com/wp-json/cocart/v2/cart');
      Map<String, String> headers = {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
      };

      final response = await http.get(apiUrl, headers: headers);

      if (response.statusCode == 200) {
        cart.value = CartModel.fromJson(json.decode(response.body));
        error.value = '';
      } else {
        error.value = 'Failed to fetch data';
      }
    } catch (e) {
      error.value = 'Error fetching data: $e';
    }

    isLoading.value = false;
  }

  void deleteCartItem(String itemId) async {
    isLoading.value = true;

    try {
      Uri apiUrl = Uri.parse('https://yourdomain.com/wp-json/cocart/v2/cart/item');
      Map<String, String> headers = {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
      };

      final response = await http.delete(apiUrl, headers: headers, body: {'key': itemId});

      if (response.statusCode == 200) {
        fetchCartData();
      } else {
        error.value = 'Failed to delete item from cart';
      }
    } catch (e) {
      error.value = 'Error deleting item from cart: $e';
    }

    isLoading.value = false;
  }

  void updateCartItem(String itemId, int quantity) async {
    isLoading.value = true;

    try {
      Uri apiUrl = Uri.parse('https://yourdomain.com/wp-json/cocart/v2/cart/item');
      Map<String, String> headers = {
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$consumerKey:$secretKey')),
      };

      final response = await http.post(apiUrl, headers: headers, body: {'key': itemId, 'quantity': quantity.toString()});

      if (response.statusCode == 200) {
        fetchCartData();
      } else {
        error.value = 'Failed to update item in cart';
      }
    } catch (e) {
      error.value = 'Error updating item in cart: $e';
    }

    isLoading.value = false;
  }

  void addToCart(String productId, int quantity) async {
    isLoading.value = true;

    try {
      Uri apiUrl = Uri.parse('https://stagging.ditllcae.com/wp-json/cocart/v2/cart');
      Map<String, String> headers = {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$consumerKey:$secretKey'))}',
      };

      final response = await http.post(apiUrl, headers: headers, body: {'product_id': productId, 'quantity': quantity.toString()});

      if (response.statusCode == 200) {
        fetchCartData();
      } else {
        error.value = 'Failed to add item to cart';
      }
    } catch (e) {
      error.value = 'Error adding item to cart: $e';
    }

    isLoading.value = false;
  }
}
