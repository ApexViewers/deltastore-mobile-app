
import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Model/allProduct_model/all_product_model.dart';

class AllProducts {
  static Future<dynamic> getProducts() async {
    try {
      var url = "${AppUrls.baseAddress}${AppUrls.allProducts}";
      var res = await BaseClientClass.get(url, "");
      print('in try');

      if (res is http.Response) {
        print('in if');

        return allProductModelFromJson(res.body);
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

