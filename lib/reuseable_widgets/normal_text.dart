import 'package:flutter/cupertino.dart';

import '../constant/styles/app_textstyles.dart';

class NormalText extends StatelessWidget {
  String ?normalText;
   NormalText({Key? key,this.normalText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      normalText!,
      style: hsmall,
    );
  }
}
