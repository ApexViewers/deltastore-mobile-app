
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/image_assets.dart';
import '../controller/home_screen_controller.dart';

class TopBarComponent extends StatelessWidget {
  const TopBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var homeScreenController = Get.find<HomeScreenController>();
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.3.h, left: 5.w),
          child: SizedBox(
            width: 60.w,
            child: Image.asset(
              ImageAssests.logoImge.toString(),
            ),
          ),
        ),
      ],
    );
  }
}
