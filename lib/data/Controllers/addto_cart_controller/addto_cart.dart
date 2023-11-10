import 'package:get/get.dart';

import '../../Model/addtocart_model/addto_cart_model.dart';
import '../../Services/add_to_cart_services/add_to_cart.dart';

class AddToCartDataController extends GetxController {
  RxBool addToCartLoading = false.obs;
  RxBool addToloading = false.obs;
  RxString addToCartError = "".obs;
  RxString buttonText = "Add to Cart".obs;
  var addToCartModel = AddToCartModel();

  // Define the resetButtonText method here
  void resetButtonText() {
    buttonText.value = "Add to Cart";
  }

  addToCart(String id, String quantity) async {
    addToCartLoading.value = true;

    if (buttonText.value != "Checkout") {
      // Only set the buttonText to "Add to Cart" if it's not already "Checkout"
      buttonText.value = "Add to Cart";
    }

    var response = await AddToCartService.addToCartData(id, quantity);
    print(id.toString());

    if (response is AddToCartModel) {
      addToloading.value = true;
      addToCartLoading.value = false;
      addToCartModel = response;
      print("hit successfullyyy");

      Get.snackbar("Success", "Item added to cart successfully");

      buttonText.value = "Checkout";
    } else {
      addToloading.value = false;
      addToCartLoading.value = false;
      addToCartError.value = response.toString();
      print("add to cart API not successful");
    }
  }
}
