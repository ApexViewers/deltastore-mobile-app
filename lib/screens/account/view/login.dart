
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/paddings.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/login_account_controller/login_account_controller.dart';
import '../../../reuseable_widgets/bold_text_widget.dart';
import '../../../reuseable_widgets/rounded_button.dart';
import '../../../reuseable_widgets/textformfield_contact.dart';
import 'Registration.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  String? id;
   LoginScreen({Key? key,this.id}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  final _formKey = GlobalKey<FormState>();
  var loginAccount = Get.put((LoginAccountController()));


  @override
  Widget build(BuildContext context) {
    print(widget.id.toString());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Login",
          style: hsmall.copyWith(fontSize: 19, color: colorWhite),
        ),
        backgroundColor: appthem,
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Padding(
            padding: padA5,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 1.h,
                    ),
                    Text(
                      "Welcome back! Sign in to your account.",
                      style: hsmall,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 1.h,
                    ),
                    BoldText(
                      textBold: "Username or email address ",
                    ),
                    Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                RoundTextFormField(
                  onValidate:(val) {
                    if (val!.isEmpty) {
                      return "This field is required.";
                    }
                  },
                    borderRadius: 6,
                    ontapborderRadius: 6,
                    controller: loginAccount.emailController,
                    obsecure: false),

                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 1.h,
                    ),
                    BoldText(
                      textBold: "Password ",
                    ),
                    Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
               Obx(() =>  Container(
                 child: TextFormField(
                   validator: (val) {
                     if (val!.isEmpty) {
                       return "This field is required.";
                     }
                   },
                   controller: loginAccount.passwordController,
                   cursorColor: appthem,
                   textAlign: TextAlign.left,
                   style: TextStyle(),
                   obscureText: loginAccount.isPasswordVisible.value,
                   decoration: InputDecoration(
                       suffixIcon: GestureDetector(
                         onTap: () => loginAccount.togglePasswordVisibility(),
                         child: Icon(
                           loginAccount.isPasswordVisible.value
                               ? Icons.visibility
                               : Icons.visibility_off,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2,
                           color: appthem, // Set your desired border color
                           // Set the border width
                         ),
                       ),
                       contentPadding:
                       EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                       hintStyle: TextStyle(),
                       enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(6),
                           borderSide: BorderSide(
                             color: cGrey,
                           )),
                       disabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: cRed),
                       ),
                       border: OutlineInputBorder(
                           borderSide: BorderSide(color: cGrey),
                           borderRadius: BorderRadius.circular(6))),
                 ),
               ),),
                ListTile(
                    trailing: TextButton(
                  onPressed: () {
                    Get.to(()=>ForgotPassword());
                  },
                  child: Text(
                    "Forgot password",
                    style: hsmall.copyWith(color: cRed),
                  ),
                )),
                Row(
                  children: [
                    Obx(
                          () => Checkbox(
                        value: loginAccount.rememberMe.value,
                        onChanged: (newValue) {
                          loginAccount.rememberMe.value = newValue!;
                        },
                      ),
                    ),
                    Text('Remember Me'),
                  ],
                ),
                Obx(
                  () => loginAccount.loadingcontactus.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: appthem,
                          ),
                        )
                      : loginAccount.errorloadingcontactus.value != ''
                          ? Text(loginAccount.errorloadingcontactus.value)
                          : RoundedButton(
                              backGroundColor: appthem,
                              borderRadius: 12,
                              width: 80.w,
                              textButton: "Login",
                              onTap: ()async {
                                if (_formKey.currentState!.validate()) {
                                  String email = loginAccount.emailController.text;
                                  String password = loginAccount.passwordController.text;
                                  await loginAccount.saveCredentials(email, password);
                                  loginAccount.postLoginAccount(
                                    loginAccount.emailController.text,
                                    loginAccount.passwordController.text,
                                  );

                                  loginAccount.emailController.clear();

                                  loginAccount.passwordController.clear();
                                }
                              }),
                ),
                // RoundedButton(
                //     borderRadius: 8,
                //     backGroundColor: appthem,
                //     width: 80.w,
                //     textButton: "Login",
                //     onTap: () {
                //       if (_formKey.currentState!.validate()) {
                //         _saveCredentials(nameController.text.toString(),
                //             passwordController.text.toString());
                //       }
                //     }),
                Row(
                  children: [
                    SizedBox(
                      width: 13.w,
                    ),
                    Text("New in our app ?"),
                    TextButton(
                      onPressed: () {
                        Get.to(() => RegistrationScreen());
                      },
                      child: Text(
                        "Create Account",
                        style: hsmall.copyWith(color: appthem),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
