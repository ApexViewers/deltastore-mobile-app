import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Model/lenovo_laptop_model/lenvo_laptop_model.dart';

class LenovoCategoriesServices{
  static Future<dynamic> lenovoCategoriesList() async {
    try {
      var url = "${AppUrls.baseAddressneed}${AppUrls.lenovoLaptops}";
      var res = await BaseClientClass.get(url, "");
      print('in tryret');

      if (res is http.Response) {
        print("hit successfully");

        return lenovoLaptopModelFromJson(res.body);
      } else {


        return res;
      }
    } catch (e) {
      print('in catch');

      return e;
    }
  }
}