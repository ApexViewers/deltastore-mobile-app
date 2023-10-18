import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../Model/delete_cart_model/delete_cart_model.dart';
import '../../Model/incrementAmountModel/incrementAccountModel.dart';
import '../../Services/delete_cart_services/delete_cart_services.dart';
import '../../Services/increment_quantity_services/increment_quantity_services.dart';
import '../total_amount_cart_controller/total_amount_controller.dart';

class ItemInCartController extends GetxController {
  RxMap items = {}.obs;
  RxBool isLoading = false.obs;
  RxString error = ''.obs;
  RxBool addToCartLoading = false.obs;
  RxString addToCartError = "".obs;

  RxBool addToloading = false.obs;
  var totalAmoutController = Get.put(TotalAmountController());
  RxString buttonText = "Add to Cart".obs;
  var incrementAmountModel = IncrementAmountModel();
  var deleteCartModel = DeleteCartModel();
  String consumerKey = 'ck_7a6f61313c9c4fac5f8a5ec4f50545edb79ebfe5'; // Replace with your consumer key
  String secretKey = 'cs_ed196a2bae6d54ba6869b92ab8f4a19ca532f594'; // Replace with your secret key

  @override
  void onInit() {
    super.onInit();
    fetchDataFromApi();
  }


  void fetchDataFromApi() async {
    isLoading.value = true;

    try {
      Uri apiUrl = Uri.parse(
          'https://stagging.ditllcae.com/wp-json/cocart/v2/cart/items');
      print(apiUrl);
      Map<String, String> headers = {
        'Authorization': 'Basic ' +
            base64Encode(utf8.encode('$consumerKey:$secretKey')),
      };

      final response = await http.get(apiUrl, headers: headers);

      final Map<String, dynamic> data = json.decode(response.body);
print(data.toString()+"show data");
      if (response.statusCode == 200) {
        if(totalAmoutController.totalAmountModel.items!.length >=0){
          print("loading me");
        }else{
          print("test abbbbbbbb");
          // Data is not empty, update the cart
          totalAmoutController.totalAmountToCart();
          items = data.obs; // Assign the data directly to your RxMap.
          error.value = '';
          print(data.toString()+"show data2");
          print(totalAmoutController.totalAmountModel.items!.length .toString()+"show length");
        }
        print("test abbbbbbbb");
        // Data is not empty, update the cart
        totalAmoutController.totalAmountToCart();
        items = data.obs; // Assign the data directly to your RxMap.
        error.value = '';
        print(data.toString()+"show data2");
        print(totalAmoutController.totalAmountModel.items!.length .toString()+"show length");
        // Clear any previous error message
      } else if (totalAmoutController.totalAmountModel.items == []) {
        error.value = 'Failed to fetch data';
        print("no data");
      }
    } catch (e) {
      error.value = 'An error occurred: $e';
    }

    isLoading.value = false;
  }


  deleteToCart(String itemKey) async {
    isLoading.value = true;


    var response = await DeleteCartService.deleteCartData(itemKey);
    print(itemKey.toString());

    if (response is DeleteCartModel) {

        addToCartLoading.value = false;
      deleteCartModel = response;
      print("hit successfully");

      Get.snackbar("Success", "delete successfully");
      fetchDataFromApi();
      totalAmoutController.totalAmountToCart();
    }


    else {
      fetchDataFromApi();
      totalAmoutController.totalAmountToCart();
      addToCartLoading.value = false;
      addToCartError.value = response.toString();
      print("add to cart API not successful");
    }
  }

  incrementAmountToCart(String quantity, String itemkey) async {
    addToCartLoading.value = true;


    var response = await IncrementCartService.incrementCartAmount(
        quantity, itemkey);


    if (response is IncrementAmountModel) {
      totalAmoutController.totalAmountToCart();
      fetchDataFromApi();
      addToloading.value = true;
      addToCartLoading.value = false;
      incrementAmountModel = response;
      print("hit successfully");
    } else {
      addToloading.value = false;
      addToCartLoading.value = false;
      addToCartError.value = response.toString();
      print("add to cart API not successful");
    }
  }
}
