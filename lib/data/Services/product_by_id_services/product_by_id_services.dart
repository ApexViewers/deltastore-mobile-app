import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Model/product_by_id_model/product_by_id_model.dart';

class ProductById {
  static Future<dynamic> getProductsid(int id) async {
    try {
      var url = "${AppUrls.baseAddressneed}${AppUrls.allProducts}/$id";

      var res = await BaseClientClass.get(url, "");
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
