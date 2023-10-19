import 'package:get/get.dart';

class DesktopMonitersController extends GetxController {
  RxBool isGridView = true.obs;

  void changListType() {
    isGridView.value = !isGridView.value;
  }
}
