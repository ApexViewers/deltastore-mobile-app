import 'package:get/get.dart';
import 'package:test_app/data/Services/LogoutServices/logout_services.dart';
import '../../Model/LogoutModel/logout_model.dart';

class LogoutController extends GetxController {
  RxBool logoutLoading = false.obs;
  RxString logoutError = "".obs;
  RxString buttonText = "Logout".obs;

  logout() async {
    logoutLoading.value = true;
    var response = await LogoutService.LogoutData();
    if(response.body){
      logoutLoading.value = false;
      Get.snackbar("Success", "Logged out Successfully");
    }
    else{
      Get.snackbar("Error", "Logout Error");
    }
  }
}