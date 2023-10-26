
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/email_validator.dart';
import '../../constant/image_assets.dart';
import '../../constant/paddings.dart';
import '../../constant/styles/app_textstyles.dart';
import '../../constant/styles/colors.dart';
import '../../reuseable_widgets/rounded_button.dart';
import '../../reuseable_widgets/textformfield_contact.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: cBlack,)),
        elevation: 0,
        backgroundColor: colorWhite,
        title: SizedBox(
          width: 60.w,
          child: Image.asset(
            ImageAssests.logoImge.toString(),
            fit: BoxFit.cover,
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction ,
          key: _formKey,
          child: Padding(
            padding: padA5,
            child: Column(
              children: [
                Text("Get in Touch", style: hMediumX.copyWith(fontSize: 28)),
                SizedBox(
                  height: s.height * 0.04,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    width: s.width * 0.75,
                    ImageAssests.contactImage,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.04,
                ),
                textwidget(text: "Name", textSing: "*"),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Expanded(
                        child: RoundTextFormField(
                          borderRadius: 4,
                          ontapborderRadius: 4,
                          obsecure: false,
                      onValidate: (val) {
                        if (val!.isEmpty) {
                          return "This field is required.";
                        }
                        return null;
                      },
                      hinttext: "First Name",
                      controller: firstNameController,
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: RoundTextFormField(
                        borderRadius: 4,
                        ontapborderRadius: 4,
                        obsecure: false,
                        onValidate: (val) {
                          if (val!.isEmpty) {
                            return "This field is required.";
                          }
                          return null;
                        },
                        hinttext: "Last Name",
                        controller: lastNameController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                textwidget(text: "Email", textSing: "*"),
                SizedBox(
                  height: s.height * 0.02,
                ),
                RoundTextFormField(

                  borderRadius: 4,
                  ontapborderRadius: 4,
                  obsecure: false,

                  onValidate:Constants.emailValidator, controller: emailController,
                  hinttext: "Enter Your Email Address",

                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                textwidget(text: "Comment or Message", textSing: "*"),
                SizedBox(
                  height: s.height * 0.02,
                ),
                RoundTextFormField(
                  borderRadius: 4,
                  ontapborderRadius: 4,
                  obsecure: false,
                  onValidate: (val) {
                    if (val!.isEmpty) {
                      return "This field is required.";
                    }
                    return null;
                  },
                  maxLint: 6,
                  controller: commentNameController,
                ),
                RoundedButton(
                  borderRadius: 4,
                  backGroundColor: appthem,
                  textButton: 'Send Message',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print("success");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textwidget({text, textSing}) {
    return Padding(
      padding: padA5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            text,
          ),
          Text(
            textSing,
            style: TextStyle(color: cRed),
          )
        ],
      ),
    );
  }
}
