import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Model/dell_home_model/dell_home_model.dart';

class DellHomeServices{
  static Future<dynamic> dellHomeList() async {
    try {
      var url = "${AppUrls.baseAddress}${AppUrls.delldesktopHome}";
      var res = await BaseClientClass.get(url, "");
      print('in tryret');

      if (res is http.Response) {
        print("hit successfully");

        return dellHomeModelFromJson(res.body);
      } else {


        return res;
      }
    } catch (e) {
      print('in catch');

      return e;
    }
  }
}