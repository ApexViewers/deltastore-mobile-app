
import 'package:get/get.dart';

import '../../Model/allProduct_model/all_product_model.dart';
import '../../Model/product_by_id_model/product_by_id_model.dart';
import '../../Services/all_procuct_services/all_product_services.dart';
import '../../Services/product_by_id_services/product_by_id_services.dart';

class ProductIdController extends GetxController {


  RxBool productLoading = false.obs;
  RxBool productLoadbutton = false.obs;
  RxString productError = "".obs;
  var productBYid =ProductBYid();

  productById(int id) async {
    productLoading.value = true;
    productLoadbutton.value = true;
    var response = await ProductById.getProductsid(id);
    if (response is ProductBYid) {
      print("test23");
      productLoading.value = false; productLoadbutton.value = false;
      productBYid = response;
    } else {
      productLoading.value = false;
      productError.value = response.toString();
    }
  }
}

