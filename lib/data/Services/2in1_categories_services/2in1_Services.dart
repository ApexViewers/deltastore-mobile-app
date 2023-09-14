import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import '../../Model/2in1_category_model/twoinone_category_model.dart';
import '../../Model/allProduct_model/all_product_model.dart';
import 'package:http/http.dart' as http;

import '../../Model/categories_model/categories_model.dart';
class TwoInOneCategoriesServices{
  static Future<dynamic> TwoinonegetCategoriesList(int id) async {
    try {
      var url = "${AppUrls.baseAddress}${AppUrls.twoInOneApi}$id";
      var res = await BaseClientClass.get(url, "");
      print('in tryret');

      if (res is http.Response) {
        print("hit successfully");

        return twoInOneModelFromJson(res.body);
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