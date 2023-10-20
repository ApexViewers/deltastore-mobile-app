import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../screens/home/components/nav_bar_component.dart';
import '../../Model/login_model.dart';
import '../../Model/product_by_id_model/product_by_id_model.dart';

import '../../Services/create_account_services/create_account_services.dart';
import '../../Services/login_account_servics/login_account_services.dart';

class LoginAccountController extends GetxController {
  RxBool loadingcontactus = false.obs;
  RxString errorloadingcontactus = ''.obs;
  var loginModel = LoginModel();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> saveCredentials(String email, String password, String firstName, String secondName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', '$firstName $secondName');
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setBool('rememberMe', rememberMe.value);
  }

  Future<List<String>> retrieveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username')!;
    String email = prefs.getString('email')!;
    return [username,email];
  }

  Future<void> retrieveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String ?email = prefs.getString('email');
    String? password = prefs.getString('password');
    bool rememberMeStatus = prefs.getBool('rememberMe') ?? false;
    emailController.text = email ?? '';
    passwordController.text = rememberMeStatus ? password ?? '' : '';
    rememberMe.value = rememberMeStatus;
  }

  RxBool rememberMe = false.obs;
  var isPasswordVisible = false.obs;

  @override
  void onInit() {
    togglePasswordVisibility();
    retrieveCredentials();
    // TODO: implement onInit
    super.onInit();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  Future<bool> postLoginAccount(String username, String password) async {
    loadingcontactus.value = true;
    errorloadingcontactus.value = '';
    var res = await LoginService.logInAccount(
      username,
      password,
    );

    loadingcontactus.value = false;
    if (res is LoginModel) {
      if (res.user_id.runtimeType == String) {
        await saveCredentials(res.email!, password, res.firstName!, res.lastName!);
        //print("hello 1");
        Fluttertoast.showToast(
            msg: 'Login Successful',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        return true;
      } else {
        Fluttertoast.showToast(
            msg: 'Login Unsuccessful',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
    return false;
  }
}
