import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/loading/shimmerEffect_full_page.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';
import '../../../../data/Controllers/Categories_controller/all_categories_controller.dart';
import '../../../../data/Controllers/all_categories_controller/all_categories_show_controller.dart';
import '../../../../data/Controllers/categories_parent/categories_by_id_controller.dart';
import '../../../../data/Controllers/twoinone_category_controller/twoinone_category_controller.dart';
import '../../../laptops/views/hp/hp_laptop.dart';

class Laptops extends StatefulWidget {
  const Laptops({Key? key}) : super(key: key);

  @override
  State<Laptops> createState() => _LaptopsState();
}

class _LaptopsState extends State<Laptops> {
  var allCatagoriesByIdController = Get.put(AllCategoryByIdController());
  var showAllCategoryByIdController = Get.put(ShowAllCategoryByIdController());

  var allCatagoriesController = Get.put(AllCategoriesListController());
  var twoInOneCategoriesController = Get.put(TwoInOneCategoriesController());

  @override
  void initState() {
    // TODO: implement initState
    // twoInOneCategoriesController.productById(645);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var childAspectRatio =
        MediaQuery.of(context).size.width > 600 ? 12 / 11 : 9 / 10;
    return SingleChildScrollView(
      child: Column(
        children: [
          Obx(() => allCatagoriesByIdController.productLoading.value
              ? const FullPageShimmerEffect()
              : allCatagoriesByIdController.productError != ''
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              allCatagoriesByIdController.categoryById;
                            },
                            icon: const Icon(Icons.refresh)),
                        Text(allCatagoriesByIdController.productError.value),
                      ],
                    ))
                  : Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            twoInOneCategoriesController.twoInOneModel.name ==
                                    null
                                ? "2 in 1"
                                : twoInOneCategoriesController
                                    .twoInOneModel.name
                                    .toString(),
                            style:
                                hMedium.copyWith(fontSize: 12, color: cBlack),
                          ),
                          InkWell(
                            onTap: () {
                              showAllCategoryByIdController.getAllCatagoryById(
                                  twoInOneCategoriesController
                                      .twoInOneModel.id!);
                              Get.to(
                                () => HpLaptops(
                                  name: twoInOneCategoriesController
                                      .twoInOneModel.name
                                      .toString(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Text(
                                  "See All",
                                  style: hsmall.copyWith(fontSize: 12),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  size: 13,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      if (allCatagoriesByIdController.categoryById.isEmpty) ...[
                        Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      final idString =
                                          twoInOneCategoriesController
                                              .twoInOneModel.id
                                              .toString();
                                      final parsedId = int.parse(idString);
                                      showAllCategoryByIdController
                                          .getAllCatagoryById(parsedId);
                                      Get.to(
                                        () => HpLaptops(
                                          name: twoInOneCategoriesController
                                              .twoInOneModel.name
                                              .toString(),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height <
                                                    600
                                                ? 0.7.h
                                                : 8.h,
                                        width:
                                            MediaQuery.of(context).size.width <
                                                    600
                                                ? 19.w
                                                : 14.w,
                                        decoration: BoxDecoration(
                                            color: appthem,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Center(
                                            child: Text(
                                              twoInOneCategoriesController
                                                          .twoInOneModel.name ==
                                                      null
                                                  ? "2 in 1"
                                                  : twoInOneCategoriesController
                                                      .twoInOneModel.name
                                                      .toString(),
                                              style: hMedium.copyWith(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                                  .size
                                                                  .width <
                                                              600
                                                          ? 9.sp
                                                          : 14,
                                                  color: colorWhite),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                        )),
                                      ),
                                    ),
                                  )
                                ]),
                          ],
                        ),
                      ] else ...[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100.h,
                                width: MediaQuery.of(context).size.width < 600
                                    ? 60.w
                                    : 50.w,
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    // Number of columns in the grid
                                    mainAxisSpacing: 0.0,
                                    // Spacing between rows
                                    crossAxisSpacing: 12.0,
                                    // Spacing between columns
                                    childAspectRatio:
                                        childAspectRatio, // Width to height ratio of each item
                                  ),
                                  itemCount: allCatagoriesByIdController
                                      .categoryById.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        showAllCategoryByIdController
                                            .getAllCatagoryById(
                                                allCatagoriesByIdController
                                                    .categoryById[index].id!);
                                        // print( allCatagoriesByIdController
                                        //     .categoryById[index].name.toString());
                                        Get.to(() => HpLaptops(
                                              name: allCatagoriesByIdController
                                                  .categoryById[index].name
                                                  .toString(),
                                            ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: appthem,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                              child: Text(
                                            allCatagoriesByIdController
                                                .categoryById[index].name
                                                .toString(),
                                            style: hMedium.copyWith(
                                                fontSize: MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        600
                                                    ? 11
                                                    : 14,
                                                color: colorWhite),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          )),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ]),
                      ],
                    ])),
        ],
      ),
    );
  }
}
