
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../constant/fonts_strings.dart';
import '../../constant/paddings.dart';
import '../../constant/styles/app_textstyles.dart';
import '../../constant/styles/colors.dart';

class DescriptionTabBar extends StatefulWidget {
  const DescriptionTabBar({Key? key}) : super(key: key);

  @override
  State<DescriptionTabBar> createState() => _DescriptionTabBarState();
}

class _DescriptionTabBarState extends State<DescriptionTabBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: padA5,
        child: Container(
          height:40 .h,
          decoration: BoxDecoration(
              color: cGrey.withOpacity(0.2),

            border: Border.all(
              color: cGrey.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(5)
          ),
          child:Padding(
            padding:padA5,
            child: Column(
              children: [
                SizedBox(height: 2.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "The P3300DW Monochrome Single Function printer is a reliable and high-performance printing solution designed for professional and heavy-duty use. With its monochrome laser technology, it delivers sharp and precise black and white prints with excellent text quality and clear graphics The P3300DW is built for speed and productivity, offering fast printing speeds that allow you to quickly produce documents, reports, and other printouts. It is equipped with a powerful processor and ample memory capacity, enabling it to handle large print jobs efficiently.This single-function printer supports wireless connectivity, allowing you to print from various devices such as computers, laptops, smartphones, and tablets without the need for cables or wired connections. It also supports Ethernet and USB connectivity options, providing versatile connectivity for different network setups and devices.",
                        style: hsmall,
                      ),),
                  ],
                ),
                SizedBox(height: 10.h,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
