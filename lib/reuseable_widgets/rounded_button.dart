import 'package:flutter/material.dart';

import '../constant/styles/colors.dart';

class RoundedButton extends StatelessWidget {
  String textButton;
  final VoidCallback onTap;
  double? height;
  double? width;
  double? size;
  Color? backGroundColor;
  Color? textColor;
  double? borderRadius;
  Color? borderColor;

  RoundedButton(
      {Key? key,
      required this.textButton,
      required this.onTap,
      this.width,
      this.height,
      this.size,
      this.backGroundColor,
      this.textColor,
      this.borderColor = appthem,
      this.borderRadius = 6})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backGroundColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0, color: borderColor!),
              borderRadius: BorderRadius.circular(
                  borderRadius!), // Set your desired border radius here
            ),
          ),
          onPressed: onTap,
          child: Text(
            textButton,
            style: TextStyle(
              color: textColor,
              fontSize: size,
            ),
          )),
    );
  }
}
