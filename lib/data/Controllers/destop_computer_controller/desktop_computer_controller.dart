import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Model/desktop_computer_model/desktop_model.dart';
import '../../Services/desktop_laptop_services/desktop_laptop_services.dart';

class DesktopComputerDataController extends GetxController {
  RxInt selectedDesign = 1.obs;

  RxBool  desktopComputerLoading = false.obs;
  RxString  desktopComputerError = "".obs;
  List<DesktopComputerModel> desktopComputerModel = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    HpCategoriesController();
  }

  HpCategoriesController() async {
    desktopComputerLoading.value = true;
    var response = await  DesktopLaptopServices.desktopLaptop();
    if (response is List<DesktopComputerModel>) {
      print(response.toString());
      desktopComputerLoading.value = false;
      desktopComputerModel = response;
    } else {
      desktopComputerLoading.value = false;
      desktopComputerError.value = response.toString();
    }
  }


  void changecategoriesdata(int design) {
    selectedDesign.value = design;
  }
}