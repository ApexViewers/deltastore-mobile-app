import 'package:get/get.dart';

class DesktopComputerController extends GetxController {
  RxBool isGridView = true.obs;

  void changListType() {
    isGridView.value = !isGridView.value;
  }
}
