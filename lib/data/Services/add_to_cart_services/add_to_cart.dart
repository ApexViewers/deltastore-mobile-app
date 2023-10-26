
import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart'as http;

import '../../Model/addtocart_model/addto_cart_model.dart';

class AddToCartService{
  static Future<dynamic> addToCartData( String  id,String quantity)async{
    try{

      var url = "${AppUrls.baseAddresslogin}${AppUrls.addItem}";
    Map data = {
      "id": id,

      "quantity": quantity,
    };
    var res = await BaseClientClass.post(url, data);
    print('in try');

    if(res is http.Response){


      return addToCartModelFromJson(res.body);
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