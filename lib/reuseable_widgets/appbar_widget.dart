import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../constant/image_assets.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0,left: 2),
      child: Container(
        width: 60.w,
        child: Image.asset(

          ImageAssests.logoImge.toString(),

        ),
      ),
    );
  }
}
