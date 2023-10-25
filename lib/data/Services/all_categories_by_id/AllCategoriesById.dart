import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Model/category_by_id_model/category_by_id.dart';
class AllCategoriesByIdServices{
  static Future<dynamic> getCategoriesListByid(int id) async {
    try {
      var url = "${AppUrls.baseAddress}${AppUrls.listofCategoriesbyid}$id";
      var res = await BaseClientClass.get(url, "");
      print('in tryret');

      if (res is http.Response) {
        print("hit successfully");

        return categoryByIdFromJson(res.body);
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