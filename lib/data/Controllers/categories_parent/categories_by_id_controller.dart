
import 'package:get/get.dart';


import '../../Model/category_by_id_model/category_by_id.dart';
import '../../Services/all_categories_by_id/AllCategoriesById.dart';

class AllCategoryByIdController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  RxBool productLoading = false.obs;
  RxString productError = "".obs;
  List<CategoryById> categoryById = [];

  getAllCatagoryById(int id) async {
    productLoading.value = true;
    var response = await AllCategoriesByIdServices.getCategoriesListByid(id);
    print(id.toString());
    if (response is List<CategoryById>) {
      productLoading.value = false;
      categoryById = response;

      print("${response.length}show length of dafdsfasta");

    } else {
      productLoading.value = false;
      productError.value = response.toString();
    }
  }
}

