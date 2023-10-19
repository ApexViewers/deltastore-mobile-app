import 'package:get/get.dart';

class DellLaptopController extends GetxController {
  RxBool isGridView = true.obs;

  void changListType() {
    isGridView.value = !isGridView.value;
  }
}
