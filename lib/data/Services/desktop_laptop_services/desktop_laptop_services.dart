import 'package:flutter/foundation.dart';
import 'package:test_app/constant/app_urls/app_urls.dart';

import '../../../constant/base_client.dart';
import 'package:http/http.dart' as http;

import '../../Model/desktop_computer_model/desktop_model.dart';

class DesktopLaptopServices {
 static Future<dynamic> desktopLaptop() async {
    try {
      var url = "${AppUrls.baseAddress}${AppUrls.desktopComputer}";
      var res = await BaseClientClass.get(url, '');
      if (res is http.Response) {
        print("hit successfully");
        return desktopComputerModelFromJson(res.body);
      } else {
        return res;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return e;
    }
  }
}
