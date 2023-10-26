import 'package:get/get.dart';

import '../../Model/categories_model/categories_model.dart';
import '../../Services/all_categories/all_categories.dart';

class AllCategoriesListController extends GetxController {
  RxBool categoriesLoading = false.obs;
  RxString categoriesError = "".obs;
  List<AllCategoriesModel> categoriesModel = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    CategoriesController();
  }

  CategoriesController() async {
    categoriesLoading.value = true;
    var response = await AllCategoriesServices.getCategoriesList();
    if (response is List<AllCategoriesModel>) {
      print(response.toString());
      categoriesLoading.value = false;
      categoriesModel = response;
    } else {
      categoriesLoading.value = false;
      categoriesError.value = response.toString();
    }
  }
}
