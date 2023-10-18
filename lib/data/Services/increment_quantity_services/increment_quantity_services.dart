import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart'as http;

import '../../Model/addtocart_model/addto_cart_model.dart';
import '../../Model/incrementAmountModel/incrementAccountModel.dart';
import '../../Model/login_model.dart';
import '../../Model/product_by_id_model/product_by_id_model.dart';
import '../../Model/total_amount_model/total_amount_model.dart';

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