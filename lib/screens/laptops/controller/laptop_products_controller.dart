import 'package:get/get.dart';

class LaptopController extends GetxController {
  RxBool isGridView = true.obs;

  void changListType() {
    isGridView.value = !isGridView.value;
  }
}
