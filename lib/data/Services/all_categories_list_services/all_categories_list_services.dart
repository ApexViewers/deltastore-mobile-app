import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import '../../Model/allCategories_model/all_categories_model.dart';
import '../../Model/allProduct_model/all_product_model.dart';
import 'package:http/http.dart' as http;

import '../../Model/categories_model/categories_model.dart';
import '../../Model/category_by_id_model/category_by_id.dart';
class AllCategoriesListByIdServices{
  static Future<dynamic> getCategoriesAllListByid(int id) async {
    try {
      var url = "${AppUrls.baseAddress}${AppUrls.AlllistofCategoriesbyid}$id";
      var res = await BaseClientClass.get(url, "");
      print('in tryret');

      if (res is http.Response) {
        print("hit successfully");

        return allCategoryByIdFromJson(res.body);
      } else {
        print('in elsedfssad');

        return res;
      }
    } catch (e) {
      print('in catch');

      return e;
    }
  }
}