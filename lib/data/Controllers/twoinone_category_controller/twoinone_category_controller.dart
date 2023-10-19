import 'package:get/get.dart';

import '../../../screens/categories/view/categories.dart';
import '../../Model/2in1_category_model/twoinone_category_model.dart';
import '../../Model/categories_model/categories_model.dart';
import '../../Services/2in1_categories_services/2in1_Services.dart';
import '../../Services/all_categories/all_categories.dart';

class TwoInOneCategoriesController extends GetxController {
  RxBool productLoading = false.obs;
  RxString productError = "".obs;
  var twoInOneModel =TwoInOneModel();

  productById(int id) async {
    productLoading.value = true;
    var response = await TwoInOneCategoriesServices.TwoinonegetCategoriesList(id);
    if (response is TwoInOneModel) {

      productLoading.value = false;

      twoInOneModel = response;
    } else {
      productLoading.value = false;
      productError.value = response.toString();
    }
  }
}
