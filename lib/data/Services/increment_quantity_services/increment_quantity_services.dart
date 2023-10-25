
import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart'as http;

import '../../Model/incrementAmountModel/incrementAccountModel.dart';

class IncrementCartService{
  static Future<dynamic> incrementCartAmount(String quantity,String itemkey)async{
    try{

      var url = "${AppUrls.baseAddresslogin}${AppUrls.incrementQuantity}$itemkey";
      Map data = {


        "quantity": quantity,
      };

      var res = await BaseClientClass.post(url, data);
      print('in try');

      if(res is http.Response){


        return incrementAmountModelFromJson(res.body);
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