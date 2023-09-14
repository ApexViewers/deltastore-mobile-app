import 'package:get/get.dart';

class HpLaptopController extends GetxController {
  RxBool isGridView = true.obs;

  void changListType() {
    isGridView.value = !isGridView.value;
  }
}
