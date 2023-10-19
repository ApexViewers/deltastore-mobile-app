import 'package:get/get.dart';

import '../../../screens/categories/view/categories.dart';
import '../../Model/categories_model/categories_model.dart';
import '../../Model/dell_laptop_model/dell_laptop_model.dart';

import '../../Services/all_categories/all_categories.dart';
import '../../Services/dell_laptop_services/dell_laptop_services.dart';


class DellCategoriesListController extends GetxController {
  RxBool hpcategoriesLoading = false.obs;
  RxString hpcategoriesError = "".obs;
  List<DellLaptopModel> hpLaptopModel = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    DellCategoriesController();
  }

  DellCategoriesController() async {
    hpcategoriesLoading.value = true;
    var response = await  DellCategoriesServices.dellCategoriesList();
    if (response is List<DellLaptopModel>) {
     print("hit successfullytttttttt");
      hpcategoriesLoading.value = false;
      hpLaptopModel = response;
    } else {
      print("wrror show");
      hpcategoriesLoading.value = false;
      hpcategoriesError.value = response.toString();
    }
  }
}
