import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/screens/home/components/nav_bar_component.dart';

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
  LoginScreen({Key? key, this.id}) : super(key: key);

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
                    const Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                RoundTextFormField(
                    onValidate: (val) {
                      if (val!.isEmpty) {
                        return "This field is required.";
                      }
                      return null;
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
                    const Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Obx(
                  () => TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "This field is required.";
                      }
                      return null;
                    },
                    controller: loginAccount.passwordController,
                    cursorColor: appthem,
                    textAlign: TextAlign.left,
                    style: const TextStyle(),
                    obscureText: loginAccount.isPasswordVisible.value,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () =>
                              loginAccount.togglePasswordVisibility(),
                          child: Icon(
                            loginAccount.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: appthem, // Set your desired border color
                            // Set the border width
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8),
                        hintStyle: const TextStyle(),
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
                ),
                ListTile(
                    trailing: TextButton(
                  onPressed: () {
                    Get.to(() => const ForgotPassword());
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
                    const Text('Remember Me'),
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
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  String email =
                                      loginAccount.emailController.text;
                                  String password =
                                      loginAccount.passwordController.text;
                                  loginAccount.postLoginAccount(
                                      email, password);
                                  bool loginSuccess =
                                      await loginAccount.postLoginAccount(
                                    loginAccount.emailController.text,
                                    loginAccount.passwordController.text,
                                  );
                                  if (loginSuccess) {
                                    loginAccount.emailController.clear();
                                    loginAccount.passwordController.clear();
                                    Get.to(() => Bar());
                                  } else {
                                    Get.snackbar("Error", "User does not exit");
                                  }
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
                    const Text("New in our app ?"),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const RegistrationScreen());
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
