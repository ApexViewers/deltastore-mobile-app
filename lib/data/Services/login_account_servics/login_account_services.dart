import 'dart:convert';


import '../../../constant/app_urls/app_urls.dart';
import '../../../constant/base_client.dart';
import 'package:http/http.dart'as http;

import '../../Model/login_model.dart';

class LoginService{
 static Future<dynamic> logInAccount(String username,String password)async{
   try{ var url = "${AppUrls.baseAddresslogin}${AppUrls.login}";
   Map data = {
     "email": username,

     "password": password,
   };
   var res = await BaseClientClass.post(url, data);
   print('in try');

   if(res is http.Response){


     return LoginModel.fromJson(jsonDecode(res.body));
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