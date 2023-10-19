import 'package:get/get.dart';

import '../../../screens/categories/view/categories.dart';
import '../../Model/categories_model/categories_model.dart';
import '../../Model/dell_laptop_model/dell_laptop_model.dart';

import '../../Model/hp_laptop_model/hp_laptop_model.dart';
import '../../Model/lenovo_laptop_model/lenvo_laptop_model.dart';
import '../../Services/all_categories/all_categories.dart';
import '../../Services/dell_laptop_services/dell_laptop_services.dart';
import '../../Services/hp_laptop_services/hp_laptop_services.dart';
import '../../Services/lenvo_laptop_services/lenvo_laptop_services.dart';


class LenpvoCategoriesListController extends GetxController {
  RxBool lenovocategoriesLoading = false.obs;
  RxString lenovocategoriesError = "".obs;
  List<LenovoLaptopModel> lenovoLaptopModel = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    lenovoCategoriesController();
  }

  lenovoCategoriesController() async {
    lenovocategoriesLoading.value = true;
    var response = await  LenovoCategoriesServices.lenovoCategoriesList();
    if (response is List<LenovoLaptopModel>) {
      print(response.toString());
      lenovocategoriesLoading.value = false;
      lenovoLaptopModel = response;
    } else {
      lenovocategoriesLoading.value = false;
      lenovocategoriesError.value = response.toString();
    }
  }
}
