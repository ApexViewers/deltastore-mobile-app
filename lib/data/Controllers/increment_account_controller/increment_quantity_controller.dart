import 'package:get/get.dart';

import '../../Model/incrementAmountModel/incrementAccountModel.dart';
import '../../Services/increment_quantity_services/increment_quantity_services.dart';

class IncrementAmountController extends GetxController {
  RxBool addToCartLoading = false.obs;
  RxBool addToloading = false.obs;
  RxString addToCartError = "".obs;
  RxString buttonText = "Add to Cart".obs;
  var incrementAmountModel = IncrementAmountModel();


  incrementAmountToCart(String quantity,String itemkey) async {
    addToCartLoading.value = true;



    var response = await IncrementCartService.incrementCartAmount(quantity,itemkey);


    if (response is IncrementAmountModel) {
      addToloading.value=true;
      addToCartLoading.value = false;
      incrementAmountModel  = response;
      print("hit successfully");


    } else {
      addToloading.value=false;
      addToCartLoading.value = false;
      addToCartError.value = response.toString();
      print("add to cart API not successful");
    }
  }
}
