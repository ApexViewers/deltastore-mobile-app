import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Model/dell_laptop_model/dell_laptop_model.dart';

class DellCategoriesServices {
  static Future<dynamic> dellCategoriesList() async {
    try {
      var url = "${AppUrls.baseAddressneed}${AppUrls.dellLaptops}";
      var res = await BaseClientClass.get(url, "");
      print('in tryret');

      if (res is http.Response) {
        print("hit successfullyggggggggggggggg");

        return dellLaptopModelFromJson(res.body);

      } else {
        print("api not work");

        return res;
      }
    } catch (e) {
      print("${e}shhhhhhhhhhhhhh");
      print('in catch');

      return e;
    }
  }
}
