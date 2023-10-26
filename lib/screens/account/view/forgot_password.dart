
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/paddings.dart';
import '../../../constant/spacing.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../reuseable_widgets/rounded_button.dart';
import '../../../reuseable_widgets/textformfield_contact.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: padA5,
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: padA5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            color: cBlack,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                Text(
                  "Lost your password? Please enter your  email address. You will receive a link to create a new password via email.",
                  style: hsmall,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Text(
                      "Enter Your Email",
                      style: hMedium.copyWith(color: cBlack, fontSize: 17),
                    ),
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
                    controller: nameController,
                    obsecure: false),
                SizedBox(
                  height: 3.h,
                ),
                RoundedButton(

                    borderRadius: 12,
                    backGroundColor: appthem,
                    width: 80.w,

                    textButton: "Continuous",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        otpVerification(nameController);


                      }

                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void otpVerification(TextEditingController nameController, {var con}){
    var data =nameController.text;
     Get.dialog(
      AlertDialog(
        content: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9)
            ),
            height: 33.h,
            width: double.infinity,
            child: Column(
              children: [
                Text(
                    "OTP Verification",style: hMedium.copyWith(color: cBlack,fontSize: 19),),
                vSpac10,
                Text("Please Enter one time password (otp) sent to",style: hsmall,
                ),
                Text(data,style: hsmall,),
                vSpac20,
                RoundTextFormField(
                  hintText: "Enter otp",
                    onValidate: (val) {
                      if (val!.isEmpty) {
                        return "This field is required.";
                      }
                      return null;
                    },
                    borderRadius: 6,
                    ontapborderRadius: 6,

                    obsecure: false),
                vSpac10,
                RoundedButton(
                    borderRadius: 12,
                    backGroundColor: appthem,
                    width: 80.w,
                    textButton: "Valid Otp Continuous",
                    onTap: () {
                      Get.back();
                    }),
              ],
            )),
      ),
    );
  }
}
