import 'package:get/get.dart';

import '../../../screens/categories/view/categories.dart';
import '../../Model/categories_model/categories_model.dart';
import '../../Model/dell_laptop_model/dell_laptop_model.dart';

import '../../Model/hp_laptop_model/hp_laptop_model.dart';
import '../../Services/all_categories/all_categories.dart';
import '../../Services/dell_laptop_services/dell_laptop_services.dart';
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
