import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Model/allProduct_model/all_product_model.dart';
import '../../Model/product_by_id_model/product_by_id_model.dart';

class CreateAccount {
  static Future<dynamic> postUserAccountCreate(
      String name, String email, String password) async {
    try {
      var url = "${AppUrls.baseAddress}${AppUrls.allProducts}";
      Map data = {
        "name": name,
        "email": email,
        "password": password,
      };
      var res = await BaseClientClass.post(url, data);
      print('in try');

      if (res is http.Response) {
        print('in if');

        return productBYidFromJson(res.body);
      } else {
        print('in else');

        return res;
      }
    } catch (e) {
      print('in catch');

      return e;
    }
  }
}
