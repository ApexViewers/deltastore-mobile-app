
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/image_assets.dart';
import '../../../constant/loading/ShimmerEffectloading.dart';
import '../../../constant/paddings.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/dell_laptop_controller/dell_laptop_controller.dart';

import '../../../data/Controllers/product_by_id_controller/product_by_id_controller.dart';
import '../../laptops/views/hp/hp_details.dart';


class DellLaptopProductComponent extends StatelessWidget {
  DellLaptopProductComponent({super.key});

  var dellLaptopController = Get.put(DellCategoriesListController());
  var ProductidController = Get.put((ProductIdController()));

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 31.h,
        color: cGrey.withOpacity(0.1),
        child:
        Obx(
              () => dellLaptopController.hpcategoriesLoading.value
              ? const ShimmerEffectLoading()
              : dellLaptopController.hpcategoriesError.value != ''
              ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        dellLaptopController.DellCategoriesController();
                      },
                      icon: const Icon(Icons.refresh)),
                  Text( dellLaptopController.hpcategoriesError.value),
                ],
              ))
              :
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:  dellLaptopController.hpLaptopModel.length,
            // Replace with your actual item count
            itemBuilder: (BuildContext context, int index) {

              // Replace with your item widget
              return InkWell(
                onTap: () {
                  ProductidController.productById(
                      dellLaptopController.hpLaptopModel[index].id!);
                  Get.to(() => HpLaptopDetailsScreen());
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(""),
                          SizedBox(
                            width: 33.w,
                          ),
                          Padding(
                            padding: padA5,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: cGrey,
                                    borderRadius:
                                    BorderRadius.circular(30)),
                                width: 30,
                                height: 30,
                                child: const Icon(
                                  Icons.favorite_border,
                                  size: 16,
                                  color: colorWhite,
                                )),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 6.w, bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 12.h,
                          width: 29.w,
                          child: Center(
                            child: dellLaptopController.hpLaptopModel[index].images![0].src == ''
                                ? Container(
                              child: Image.asset(ImageAssests.hpimage),
                            )
                                : Image.network(
                              dellLaptopController.hpLaptopModel[index].images![0].src.toString(),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // Handle the 404 error here
                                return Container(
                                  child: Image.asset(ImageAssests.hpimage), // Provide a placeholder image
                                );
                              },
                            ),
                          ),
                        ),

                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 7, bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 40.w,
                                      child: Text(
                                        dellLaptopController.hpLaptopModel[index].name
                                            .toString(),
                                        maxLines: 2,
                                        style: hMedium.copyWith(
                                            overflow:
                                            TextOverflow.ellipsis,
                                            fontSize: 11.sp,
                                            color: cBlack
                                                .withOpacity(0.9)),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                    "AED ${dellLaptopController.hpLaptopModel[index]
                                            .salePrice}" ==
                                        ""
                                        ? ""
                                        : "AED ${dellLaptopController.hpLaptopModel[index]
                                            .salePrice}",
                                    style: hsmall.copyWith(
                                        fontSize: 10.sp,
                                        color:
                                        cBlack.withOpacity(0.6))),
                                Text(
                                  "AED ${dellLaptopController.hpLaptopModel[index]
                                          .regularPrice}"
                                      !=""?   dellLaptopController.hpLaptopModel[index]
                                      .regularPrice
                                      .toString():"",
                                  style: hsmall.copyWith(
                                      fontSize: 10.sp,
                                      decoration:
                                      TextDecoration.lineThrough,
                                      color: cGrey.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // ),
        )


    );
  }
}
