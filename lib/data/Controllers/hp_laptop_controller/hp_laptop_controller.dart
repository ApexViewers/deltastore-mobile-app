import 'package:get/get.dart';


import '../../Model/hp_laptop_model/hp_laptop_model.dart';
import '../../Services/hp_laptop_services/hp_laptop_services.dart';


class HpCategoriesListController extends GetxController {
  RxBool hpcategoriesLoading = false.obs;
  RxString hpcategoriesError = "".obs;
  List<HpLaptopModel> hpLaptopModel = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    HpCategoriesController();
  }

  HpCategoriesController() async {
    hpcategoriesLoading.value = true;
    var response = await  HpCategoriesServices.HpCategoriesList();
    if (response is List<HpLaptopModel>) {
      print(response.toString());
      hpcategoriesLoading.value = false;
      hpLaptopModel = response;
    } else {
      hpcategoriesLoading.value = false;
      hpcategoriesError.value = response.toString();
    }
  }
}
