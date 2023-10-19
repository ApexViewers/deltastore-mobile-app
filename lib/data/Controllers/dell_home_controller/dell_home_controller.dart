import 'package:get/get.dart';

import '../../../screens/categories/view/categories.dart';
import '../../Model/categories_model/categories_model.dart';
import '../../Model/dell_home_model/dell_home_model.dart';
import '../../Model/dell_laptop_model/dell_laptop_model.dart';

import '../../Services/all_categories/all_categories.dart';
import '../../Services/dell_home_show_services/dell_home_show.dart';
import '../../Services/dell_laptop_services/dell_laptop_services.dart';


class DellHomeController extends GetxController {
  RxBool hpcategoriesLoading = false.obs;
  RxString hpcategoriesError = "".obs;
  List<DellHomeModel> dellhomeModel = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    DellCategoriesController();
  }

  DellCategoriesController() async {
    hpcategoriesLoading.value = true;
    var response = await  DellHomeServices.dellHomeList();
    if (response is List<DellHomeModel>) {
      print(response.toString());
      hpcategoriesLoading.value = false;
      dellhomeModel = response;
    } else {
      hpcategoriesLoading.value = false;
      hpcategoriesError.value = response.toString();
    }
  }
}
