import 'package:get/get.dart';

import '../../Model/2in1_category_model/twoinone_category_model.dart';
import '../../Services/2in1_categories_services/2in1_Services.dart';

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
