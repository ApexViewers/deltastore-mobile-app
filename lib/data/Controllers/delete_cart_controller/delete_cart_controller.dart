import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../Model/addtocart_model/addto_cart_model.dart';
import '../../Model/delete_cart_model/delete_cart_model.dart';
import '../../Services/add_to_cart_services/add_to_cart.dart';
import '../../Services/delete_cart_services/delete_cart_services.dart';

class DeleteCartDataController extends GetxController {
  RxBool addToCartLoading = false.obs;
  RxString addToCartError = "".obs;

  var deleteCartModel = DeleteCartModel();

  deleteToCart(String itemKey) async {
    addToCartLoading.value = true;
    var response = await DeleteCartService.deleteCartData(itemKey);
    Future.delayed(const Duration(seconds: 5));
    if (kDebugMode) {
      print(itemKey.toString());
    }

    if (response is DeleteCartModel) {
      addToCartLoading.value = false;
      deleteCartModel = response;
      if (kDebugMode) {
        print("hit successfully");
      }
      Get.snackbar("Success", "delete successfully");
    } else {
      addToCartLoading.value = false;
      addToCartError.value = response.toString();
      if (kDebugMode) {
        print("add to cart API not successful");
      }
    }
  }
}
