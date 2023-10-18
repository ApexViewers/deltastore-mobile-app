import 'package:get/get.dart';

import '../../Model/addtocart_model/addto_cart_model.dart';
import '../../Model/total_amount_model/total_amount_model.dart';
import '../../Services/add_to_cart_services/add_to_cart.dart';
import '../../Services/total_amount_services/total_amount_services.dart';

class TotalAmountController extends GetxController {
  RxBool addToCartLoading = false.obs;
  RxBool addToloading = false.obs;
  RxString addToCartError = "".obs;
  RxString buttonText = "Add to Cart".obs;
  var totalAmountModel = TotalAmountModel();

  totalAmountToCart() async {
    addToCartLoading.value = true;



    var response = await TotalAmountCartService.addToCartAmount();


    if (response is TotalAmountModel) {
      addToloading.value=true;
      addToCartLoading.value = false;
      totalAmountModel  = response;
      print("hit successfully");


    } else {
      addToloading.value=false;
      addToCartLoading.value = false;
      addToCartError.value = response.toString();
      print("add to cart API not successful");
    }
  }
}
