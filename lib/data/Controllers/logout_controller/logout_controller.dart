import 'package:get/get.dart';
import 'package:test_app/data/Controllers/login_account_controller/login_account_controller.dart';
import 'package:test_app/data/Services/LogoutServices/logout_services.dart';
import 'package:test_app/screens/home/components/nav_bar_component.dart';

class LogoutController extends GetxController {
  RxBool logoutLoading = false.obs;
  RxString logoutError = "".obs;
  RxString buttonText = "Logout".obs;
  var loginController = Get.put(LoginAccountController());

  Future<void> logout() async {
    logoutLoading.value = true;
    var response = await LogoutService.LogoutData();
    if(response){
      logoutLoading.value = false;
      loginController.deleteCredentials();
      loginController.deleteUsername();
      Get.appUpdate();
      Get.offAll(() => Bar());
      Get.snackbar("Success", "Logged out Successfully");
    }
    else{
      Get.snackbar("Error", "Logout Error");
    }
  }
}