
import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart'as http;

import '../../Model/total_amount_model/total_amount_model.dart';

class TotalAmountCartService{
  static Future<dynamic> addToCartAmount()async{
    try{

      var url = "${AppUrls.baseAddresslogin}${AppUrls.totalAmountCart}";

      var res = await BaseClientClass.post(url, '');
      print('in try');

      if(res is http.Response){


        return totalAmountModelFromJson(res.body);
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