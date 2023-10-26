import 'package:get/get.dart';

import '../../Model/dell_home_model/dell_home_model.dart';

import '../../Services/dell_home_show_services/dell_home_show.dart';


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
