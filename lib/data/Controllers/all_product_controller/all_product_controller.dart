
import 'package:get/get.dart';

import '../../Model/allProduct_model/all_product_model.dart';
import '../../Services/all_procuct_services/all_product_services.dart';

class AllProductController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllProducts();
  }

  RxBool productLoading = false.obs;
  RxString productError = "".obs;
  List<AllProductModel> productModel = [];

  getAllProducts() async {
    productLoading.value = true;
    var response = await AllProducts.getProducts();
    if (response is List<AllProductModel>) {
      productLoading.value = false;
      productModel = response;
      print("${response.length}show length of data");

    } else {
      productLoading.value = false;
      productError.value = response.toString();
    }
  }
}

