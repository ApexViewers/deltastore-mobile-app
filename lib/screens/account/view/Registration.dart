
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/paddings.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/create_account_controller/create_account_controller.dart';
import '../../../reuseable_widgets/bold_text_widget.dart';
import '../../../reuseable_widgets/rounded_button.dart';
import '../../../reuseable_widgets/textformfield_contact.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checkbool = true;
  final _formKey = GlobalKey<FormState>();
  var createAccount = Get.put((CreatAccountController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Register",
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
                    Expanded(
                      child: Text(
                        "Create new account today to reap the benefits of a personalized shopping experience.",
                        style: hsmall.copyWith(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
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
                      textBold: "Username ",
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
                  borderRadius: 7,
                  ontapborderRadius: 12,
                  onValidate: (val) {
                    if (val!.isEmpty) {
                      return "This field is required.";
                    }
                    return null;
                  },
                  obsecure: false,
                  controller: nameController,
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
                      textBold: "Email address ",
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
                  borderRadius: 7,
                  ontapborderRadius: 12,
                  onValidate: (val) {
                    if (val!.isEmpty) {
                      return "This field is required.";
                    }
                    return null;
                  },
                  obsecure: false,
                  controller: emailController,
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
                RoundTextFormField(
                  borderRadius: 7,
                  ontapborderRadius: 12,
                  onValidate: (val) {
                    if (val!.isEmpty) {
                      return "This field is required.";
                    }
                    return null;
                  },
                  obsecure: false,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 1.h,
                    ),
                    Expanded(
                      child: Text(
                        "Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our privacy policy.",
                        style: hsmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Obx(
                  () => createAccount.loadingcontactus.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: appthem,
                          ),
                        )
                      : createAccount.errorloadingcontactus.value != ''
                          ? Text(createAccount.errorloadingcontactus.value)
                          : RoundedButton(
                              backGroundColor: appthem,
                              borderRadius: 12,
                              width: 80.w,
                              textButton: "Register",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  createAccount.postCreateAccount(
                                    nameController.text,
                                    emailController.text,
                                    passwordController.text,
                                  );

                                  nameController.clear();
                                  emailController.clear();
                                  passwordController.clear();
                                }
                              }),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    const Text("Already have an account ?"),
                    TextButton(
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text(
                        "Login",
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
