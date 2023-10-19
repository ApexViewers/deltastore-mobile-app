import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/image_assets.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';
import '../../../laptops/views/hp/hp_laptop.dart';

class DesktopComputer extends StatefulWidget {
  const DesktopComputer({Key? key}) : super(key: key);

  @override
  State<DesktopComputer> createState() => _DesktopComputerState();
}

class _DesktopComputerState extends State<DesktopComputer> {
  @override
  final List<Map<String, dynamic>> printerList = [
    {
      'image': ImageAssests.appleimage.toString(),
      'text': 'HP',
    },
    {
      'image': ImageAssests.appleimage.toString(),
      'text': 'Dell',
    },
    {
      'image': ImageAssests.dellimage.toString(),
      'text': 'Lenovo',
    },

  ];
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("Desktop Computers",style: hMedium.copyWith(fontSize: 12,color: cBlack),),
              SizedBox(width: 12.w,),
              Row(
                children: [
                  Text("See All",style: hsmall.copyWith(fontSize: 12),),
                  Icon(Icons.arrow_forward,size: 13,)
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                height: 77.h,
                width: 70.w,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns in the grid
                    mainAxisSpacing: 4.0, // Spacing between rows
                    crossAxisSpacing: 9.9, // Spacing between columns
                    childAspectRatio: 9/11, // Width to height ratio of each item
                  ),
                  itemCount: printerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Get.to(()=>HpLaptops());
                      },
                      child: Container(

                        child: Column(
                          children: [
                            Card(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                height: 8.h,
                                width: 20.5.w,
                                child: Container(
                                  decoration: BoxDecoration(),
                                  margin: EdgeInsets.only(
                                      left: 3.w, right: 4.w, bottom: 2.h, top: 2.h),
                                  child: Image.asset(
                                      fit: BoxFit.cover,
                                      printerList[index]["image"].toString()),
                                ),
                              ),
                            ),
                            Center(
                                child: Text(
                                  printerList[index]["text"].toString(),
                                  style: hMedium.copyWith(fontSize: 13, color: cBlack),
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
