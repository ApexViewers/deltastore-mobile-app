import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import '../../Model/allProduct_model/all_product_model.dart';
import 'package:http/http.dart' as http;

import '../../Model/categories_model/categories_model.dart';
class AllCategoriesServices{
  static Future<dynamic> getCategoriesList() async {
    try {
      var url = "${AppUrls.baseAddress}${AppUrls.listofCategories}";
      var res = await BaseClientClass.get(url, "");
      print('in tryret');

      if (res is http.Response) {
        print("hit successfully");

        return allCategoriesModelFromJson(res.body);
      } else {


        return res;
      }
    } catch (e) {
      print('in catch');

      return e;
    }
  }
}