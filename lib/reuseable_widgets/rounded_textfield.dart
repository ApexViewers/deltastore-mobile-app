
import 'package:flutter/material.dart';

import '../constant/styles/colors.dart';

class ReuseTextField extends StatelessWidget {
  String? hinttext;
  final double ?fontSize;
  int? maxLint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? fill;
  final Color? fillcolor;
  final double ?borderRadius;
  final double ?ontapborderRadius;
  final  Function()? onTap;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? actionKeyboard;
  final String? Function(String?)? onValidate;
  final Function(String)? onChanged;
  bool obsecure;
  final TextEditingController controller;
  final double? width;
  final double ?height;
  final Color? hintTextColor;

  ReuseTextField(
      {Key? key,
        this.hinttext,
        this.fontSize,
        this.fillcolor,
        this.maxLint,
        this.actionKeyboard,
        this.autovalidateMode,
        required this.controller,
        this.hintText,
        required this.obsecure,
        this.onChanged,
        this.onValidate,
        this.prefixIcon,
        this.suffixIcon,
        this.borderRadius,
        this.height,
        this.width,
        this.onTap,
        this.ontapborderRadius,
        this.hintTextColor,
        this.fill})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        cursorColor: appthem,
        cursorWidth: 1,
        style: TextStyle(
          fontSize:fontSize,
        ),

        obscureText: obsecure,
        controller: controller,
        validator: onValidate,
        keyboardType: TextInputType.multiline,
        maxLines: maxLint,
        decoration: InputDecoration(
          suffixIcon:suffixIcon ,
          prefixIconConstraints: BoxConstraints(minWidth: 0),

            contentPadding: EdgeInsets.only(left: 20),
            hintStyle: TextStyle(
                color: hintTextColor
            ),

            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide.none,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,

            ),
            filled: fill,
            fillColor: fillcolor,
            hintText: hinttext,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,

                borderRadius: BorderRadius.circular(ontapborderRadius!))),
      ),
    );
  }
}
