import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class FullPageShimmerEffect extends StatelessWidget {
  const FullPageShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.builder(
itemCount: 6,

          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 7.h,
                    width: 20.w,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.red,
                    ),




                  ),
                  SizedBox(height: 1.h,),
                  Container(height: 1.h,
                    width: 100.w,
                    color: Colors.red,



                  ),
                  SizedBox(height: 1.h,),
                  Container(height: 1.h,
                    width: 100.w,
                    color: Colors.red,



                  ),
                  SizedBox(height: 1.h,),

                ],
              ),
            );
          },

        )
      ),
    );
  }
}
