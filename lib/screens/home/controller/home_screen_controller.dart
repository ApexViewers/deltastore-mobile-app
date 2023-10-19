
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  RxBool ontapTextformfiled = false.obs;


  // @override
  // void onInit() {
  //   getProducts();
  //   super.onInit();
  // }
  //
  void changListType() {
    ontapTextformfiled.value = !ontapTextformfiled.value;
  }
  //
  // void changDealsOfDayListType() {
  //   isDealsOfDayGridView.value = !isDealsOfDayGridView.value;
  // }
  //
  // void changFeaturedProductListType() {
  //   isFeaturedProductsGridView.value = !isFeaturedProductsGridView.value;
  // }
  //
  // void switchSerachField() {
  //   isShowSerchField.value = !isShowSerchField.value;
  // }
  //
  // //////////////////////get all products
  // var loadingAllProducts = false.obs;
  // var errorGettingProducts = "".obs;
  // List<AllProductsResponse> allProducts = [];
  //
  // void getProducts() async {
  //   loadingAllProducts.value = true;
  //   errorGettingProducts.value = "";
  //   var res = await AppProductService.getAllProducts();
  //   loadingAllProducts.value = false;
  //   if (res is List<AllProductsResponse>) {
  //     allProducts = res;
  //   } else {
  //     errorGettingProducts.value = res.toString();
  //     loadingAllProducts.value = false;
  //   }
  // }
}
