import 'package:get/get.dart';

import '../../Model/product_by_id_model/product_by_id_model.dart';

import '../../Services/create_account_services/create_account_services.dart';

class CreatAccountController extends GetxController {
  RxBool loadingcontactus = false.obs;
  RxString errorloadingcontactus = ''.obs;
  var productBYidToJson = ProductBYid();

  void postCreateAccount(String name, String email, String password) async {
    loadingcontactus.value = true;
    errorloadingcontactus.value = '';
    var res = await CreateAccount.postUserAccountCreate(
      name,
      email,
      password,
    );

    loadingcontactus.value = false;
    if (res is ProductBYid) {
      productBYidToJson = res;
      print(res);
    } else {
      errorloadingcontactus.value = res;
    }
  }
}
