
import 'package:get/get.dart';


import '../../Model/allCategories_model/all_categories_model.dart';
import '../../Model/category_by_id_model/category_by_id.dart';
import '../../Services/all_categories_by_id/AllCategoriesById.dart';
import '../../Services/all_categories_list_services/all_categories_list_services.dart';

class ShowAllCategoryByIdController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  RxBool productLoading = false.obs;
  RxString productError = "".obs;
  List<AllCategoryById> allCategoryById = [];

  getAllCatagoryById(int id) async {
    productLoading.value = true;
    var response = await AllCategoriesListByIdServices.getCategoriesAllListByid(id);
    print(id.toString());
    if (response is List<AllCategoryById>) {
      productLoading.value = false;
      allCategoryById = response;

      print(response.length.toString()+"show length of data needdd");

    } else {
      productLoading.value = false;
      productError.value = response.toString();
    }
  }
}

