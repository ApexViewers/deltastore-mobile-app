
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/loading/ShimmerEffectloading.dart';
import '../../../constant/paddings.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/all_product_controller/all_product_controller.dart';
import '../../../data/Controllers/product_by_id_controller/product_by_id_controller.dart';
import '../views/hp/hp_details.dart';

class LaptopListViewProductComponent extends StatelessWidget {
  LaptopListViewProductComponent({super.key});

  var allProductController = Get.put(AllProductController());
  var ProductidController = Get.put((ProductIdController()));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31.h,
      color: cGrey.withOpacity(0.1),
      child:
      Obx(
        () => allProductController.productLoading.value
            ? const ShimmerEffectLoading()
            : allProductController.productError.value != ''
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            allProductController.getAllProducts();
                          },
                          icon: const Icon(Icons.refresh)),
                      Text(allProductController.productError.value),
                    ],
                  ))
                :
        ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allProductController.productModel.length,
                    // Replace with your actual item count
                    itemBuilder: (BuildContext context, int index) {

                      // Replace with your item widget
                      return InkWell(
                        onTap: () {
                          ProductidController.productById(
                              allProductController.productModel[index].id!);
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
                                        borderRadius: BorderRadius.circular(8)),
                                    height: 12.h,
                                    width: 29.w,
                                    child: Center(
                                        child: allProductController
                                                    .productModel[index]
                                                    .images!.isEmpty
                                            ? Container(
                                                child: const Text(""))
                                            : Image.network(
                                                fit: BoxFit.cover,
                                                allProductController
                                                    .productModel[index]
                                                    .images![0]
                                                    .src
                                                    .toString()))),
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
                                                allProductController
                                                    .productModel[index].name
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
                                            "AED ${allProductController
                                                            .productModel[index]
                                                            .salePrice}" ==
                                                    ""
                                                ? ""
                                                : "AED ${allProductController
                                                        .productModel[index]
                                                        .salePrice}",
                                            style: hsmall.copyWith(
                                                fontSize: 10.sp,
                                                color:
                                                    cBlack.withOpacity(0.6))),
                                        Text(
                                          "AED ${allProductController
                                                  .productModel[index]
                                                  .regularPrice}"
                                                  !=""? allProductController
                                              .productModel[index]
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
    ));
  }
}
