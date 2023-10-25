import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Model/addtocart_model/addto_cart_model.dart';
import '../../Model/delete_cart_model/delete_cart_model.dart';
import '../../Model/login_model.dart';
import '../../Model/product_by_id_model/product_by_id_model.dart';

class DeleteCartService {
  static Future<dynamic> deleteCartData(String itemKey) async {
    try {
      var url = "${AppUrls.baseAddresslogin}${AppUrls.deleteCart}$itemKey";

      var res = await BaseClientClass.delete(url);
      print('in try');

      if (res is http.Response) {
        print("successfully");
        return addToCartModelFromJson(res.body);
      } else {
        print('in else');

        return res;
      }
    } catch (e) {
      print(e.toString()+"show error");
      return e;
    }
  }
}
