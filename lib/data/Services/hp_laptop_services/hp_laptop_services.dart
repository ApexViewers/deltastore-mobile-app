import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Model/hp_laptop_model/hp_laptop_model.dart';

class HpCategoriesServices{
  static Future<dynamic> HpCategoriesList() async {
    try {
      var url = "${AppUrls.baseAddressneed}${AppUrls.hpLaptops}";
      var res = await BaseClientClass.get(url, "");
      print('in tryret');

      if (res is http.Response) {
        print("hit successfully");

        return hpLaptopModelFromJson(res.body);
      } else {


        return res;
      }
    } catch (e) {
      print('in catch');

      return e;
    }
  }
}