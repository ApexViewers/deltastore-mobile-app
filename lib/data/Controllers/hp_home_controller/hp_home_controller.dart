import 'package:get/get.dart';


import '../../Model/hp_home_model/hp_home_model.dart';
import '../../Services/hp_home_show_Services/hp_home_services.dart';


class HpHomeController extends GetxController {
  RxBool hpcategoriesLoading = false.obs;
  RxString hpcategoriesError = "".obs;
  List<HpHomeModel> hphomeModel = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    HpCategoriesController();
  }

  HpCategoriesController() async {
    hpcategoriesLoading.value = true;
    var response = await  HpHomeServices.hpHomeList();
    if (response is List<HpHomeModel>) {
      print(response.toString());
      hpcategoriesLoading.value = false;
      hphomeModel = response;
    } else {
      hpcategoriesLoading.value = false;
      hpcategoriesError.value = response.toString();
    }
  }
}
