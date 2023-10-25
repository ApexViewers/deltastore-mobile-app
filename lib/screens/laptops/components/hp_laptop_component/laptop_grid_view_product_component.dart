
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/loading/shimmerEffect_full_page.dart';
import '../../../../constant/paddings.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';
import '../../../../data/Controllers/all_categories_controller/all_categories_show_controller.dart';
import '../../../../data/Controllers/product_by_id_controller/product_by_id_controller.dart';
import '../../views/hp/hp_details.dart';

class HpLaptopGridProductComponent extends StatelessWidget {
   HpLaptopGridProductComponent({super.key});
   var ProductidController = Get.put((ProductIdController()));
   var showAllCategoryByIdController = Get.put(ShowAllCategoryByIdController());
  @override
  Widget build(BuildContext context) {
    var childAspectRatio = MediaQuery.of(context).size.width > 600 ? 9 / 8 : 9 / 12;

    return  Obx(
            () => showAllCategoryByIdController.productLoading.value
            ? const FullPageShimmerEffect()
            : showAllCategoryByIdController.productError != ''
            ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      showAllCategoryByIdController.allCategoryById;
                    },
                    icon: const Icon(Icons.refresh)),
                Text(showAllCategoryByIdController.productError.value),
              ],
            ))
            :  Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.vertical,

                  gridDelegate:
                   SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    mainAxisSpacing: 3.0, // Spacing between rows
                    crossAxisSpacing: 3.0, // Spacing between columns
                    childAspectRatio: childAspectRatio ),
                  itemCount: showAllCategoryByIdController.allCategoryById.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: (){
                        ProductidController.productById(
                            showAllCategoryByIdController.allCategoryById[index].id!);
                        Get.to(() => HpLaptopDetailsScreen());
                        // Get.to(()=>HpLaptopDetailsScreen());
                      },
                      child: Card(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
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
                                          BorderRadius
                                              .circular(
                                              30)),
                                      width: 6.w,
                                      height: 3.h,
                                      child: const Icon(
                                        Icons.favorite_border,
                                        size: 16,
                                        color:colorWhite,
                                      )),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6.w),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(
                                        8)),
                                height: 15.h,
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    showAllCategoryByIdController.allCategoryById[index].images![0].src.toString()

                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                          width: 40.w,
                                          child: Text( showAllCategoryByIdController.allCategoryById[index].name.toString(),style: hsmall.copyWith(
                                            fontSize: 10
                                          ),
                                          overflow:   TextOverflow. ellipsis ,
                                            maxLines: 3,
                                          )),


                                    ],
                                  ),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 0.5.h,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.5.h,),
                                      Text(showAllCategoryByIdController.allCategoryById[index].salePrice.toString(), style:hsmall.copyWith(
                                          color: cBlack
                                              .withOpacity(
                                              0.6))),
                                      const SizedBox(height: 0.5,),
                                      Text(
                                        showAllCategoryByIdController.allCategoryById[index].regularPrice.toString(),
                                        style: hsmall.copyWith(
                                            decoration: TextDecoration.lineThrough,
                                            color: cGrey
                                                .withOpacity(
                                                0.6)),
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
                  }),
            ),
    );






  }
}
