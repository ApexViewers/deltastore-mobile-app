import 'package:flutter/cupertino.dart';

import '../constant/fonts_strings.dart';

class BoldText extends StatelessWidget {
  String? textBold;
  double ?size;
   BoldText({Key? key,this.textBold,this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textBold!,
      style: TextStyle(fontFamily: nexabold, fontSize: size),
    );
  }
}
