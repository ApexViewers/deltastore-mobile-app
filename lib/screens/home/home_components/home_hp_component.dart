import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/image_assets.dart';
import '../../../constant/loading/ShimmerEffectloading.dart';
import '../../../constant/paddings.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/all_product_controller/all_product_controller.dart';
import '../../../data/Controllers/dell_laptop_controller/dell_laptop_controller.dart';

import '../../../data/Controllers/hp_laptop_controller/hp_laptop_controller.dart';
import '../../../data/Controllers/product_by_id_controller/product_by_id_controller.dart';
import '../../laptops/views/hp/hp_details.dart';

class HpLaptopProductComponent extends StatelessWidget {
  HpLaptopProductComponent({super.key});

  var hpLaptopController = Get.put(HpCategoriesListController());
  var ProductidController = Get.put((ProductIdController()));

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 31.h,
        color: cGrey.withOpacity(0.1),
        child: Obx(
          () => hpLaptopController.hpcategoriesLoading.value
              ? const ShimmerEffectLoading()
              : hpLaptopController.hpcategoriesError.value != ''
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              hpLaptopController.HpCategoriesController();
                            },
                            icon: const Icon(Icons.refresh)),
                        Text(hpLaptopController.hpcategoriesError.value),
                      ],
                    ))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: hpLaptopController.hpLaptopModel.length,
                      // Replace with your actual item count
                      itemBuilder: (BuildContext context, int index) {
                        // Replace with your item widget
                        return InkWell(
                          onTap: () {
                            ProductidController.productById(
                                hpLaptopController.hpLaptopModel[index].id!);
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
                                  padding:
                                      EdgeInsets.only(left: 6.w, bottom: 10),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      height: 12.h,
                                      width: 29.w,
                                      child: Center(
                                          child: hpLaptopController
                                                  .hpLaptopModel[index]
                                                  .images![0]
                                                  .src!
                                                  .isEmpty
                                              ? Container(child: Text(""))
                                              : Image.network(
                                                  fit: BoxFit.cover,
                                                  hpLaptopController
                                                      .hpLaptopModel[index]
                                                      .images![0]
                                                      .src
                                                      .toString()))),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 7, bottom: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  hpLaptopController
                                                      .hpLaptopModel[index].name
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
                                              "AED" +
                                                          " " +
                                                          hpLaptopController
                                                              .hpLaptopModel[
                                                                  index]
                                                              .salePrice
                                                              .toString() ==
                                                      ""
                                                  ? ""
                                                  : "AED" +
                                                      " " +
                                                      hpLaptopController
                                                          .hpLaptopModel[index]
                                                          .salePrice
                                                          .toString(),
                                              style: hsmall.copyWith(
                                                  fontSize: 10.sp,
                                                  color:
                                                      cBlack.withOpacity(0.6))),
                                          Text(
                                            "AED" +
                                                        " " +
                                                        hpLaptopController
                                                            .hpLaptopModel[
                                                                index]
                                                            .regularPrice
                                                            .toString() !=
                                                    ""
                                                ? hpLaptopController
                                                    .hpLaptopModel[index]
                                                    .regularPrice
                                                    .toString()
                                                : "",
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
        ));
  }
}
