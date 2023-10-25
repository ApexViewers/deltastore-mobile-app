import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Model/hp_home_model/hp_home_model.dart';

class HpHomeServices{
  static Future<dynamic> hpHomeList() async {
    try {
      var url = "${AppUrls.baseAddress}${AppUrls.hpdesktopHome}";
      var res = await BaseClientClass.get(url, "");
      print('in tryret');

      if (res is http.Response) {
        print("hit successfully");

        return hpHomeModelFromJson(res.body);
      } else {


        return res;
      }
    } catch (e) {
      print('in catch');

      return e;
    }
  }
}