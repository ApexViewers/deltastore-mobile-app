import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../image_assets.dart';

class ShimmerEffectLoading extends StatelessWidget {
  const ShimmerEffectLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50.w,
        child:Shimmer.fromColors(
          baseColor:Colors.white,
          highlightColor:Colors.grey.shade400,
          child:
          Image.asset(

            ImageAssests.dlogoimge.toString(),
          ),)





    );
  }
}
