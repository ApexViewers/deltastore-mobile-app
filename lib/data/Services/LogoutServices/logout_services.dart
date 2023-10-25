
import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart'as http;


import '../../Model/LogoutModel/logout_model.dart';

class LogoutService{
  static Future<dynamic> LogoutData()async{
    try{

      var url = "${AppUrls.baseAddresslogin}${AppUrls.logout}";
      var res = await BaseClientClass.post(url,"");
      print('in try');

      if(res is http.Response){
        return logoutModelFromJson(res.body);
      }else {
        print('in else');

        return res;
      }

    }catch(e){
      print(e.toString());
      return e;
    }


  }

}