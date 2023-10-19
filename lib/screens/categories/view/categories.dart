import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../../../constant/image_assets.dart';
import '../../../constant/loading/shimmerEffect_full_page.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../../data/Controllers/Categories_controller/all_categories_controller.dart';
import '../../../data/Controllers/all_categories_controller/all_categories_show_controller.dart';
import '../../../data/Controllers/categories_parent/categories_by_id_controller.dart';
import '../../../data/Controllers/twoinone_category_controller/twoinone_category_controller.dart';
import '../../../reuseable_widgets/appbar_widget.dart';
import '../../laptops/views/hp/hp_laptop.dart';
import 'allcategoriespages/desktop_moniters.dart';
import 'allcategoriespages/laptops.dart';
import 'allcategoriespages/desktop_computer.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  List<Widget> pages = [
    const Laptops(),
  ];

  int selectedIndex = 0;

  var allCatagoriesByIdController = Get.put(AllCategoryByIdController());
  var showAllCategoryByIdController = Get.put(ShowAllCategoryByIdController());
  var allCatagoriesController = Get.put(AllCategoriesListController());
  var twoInOneCategoriesController = Get.put(TwoInOneCategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cGrey.withOpacity(0.1),
        appBar: AppBar(
          elevation: 0,
          title: const Appbar(),
          backgroundColor: colorWhite,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Obx(
            () => allCatagoriesController.categoriesLoading.value
                ? FullPageShimmerEffect()
                : allCatagoriesController.categoriesError != ''
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                allCatagoriesController.CategoriesController();
                              },
                              icon: const Icon(Icons.refresh)),
                          Text(allCatagoriesController.categoriesError.value),
                        ],
                      ))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: ListView.builder(
                                physics: const PageScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: allCatagoriesController
                                    .categoriesModel.length,
                                itemBuilder: (buildContext, index) {
                                  return SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: appthem,
                                              blurRadius: 4,
                                              offset: Offset(
                                                  4, 4), // Shadow position
                                            ),
                                          ],
                                        ),
                                        width: 36.w,
                                        child: Column(
                                          children: [
                                            Card(
                                              color: colorWhite,
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex !=
                                                            allCatagoriesController
                                                                .categoriesModel[
                                                                    index]
                                                                .id!;
                                                      });
                                                      // print( twoInOneCategoriesController
                                                      //     .twoInOneModel.id.toString()+"show indexdddd");
                                                      // print(allCatagoriesController.categoriesModel[index].id!.toString()+"need");
                                                      twoInOneCategoriesController
                                                          .productById(
                                                        allCatagoriesController
                                                            .categoriesModel[
                                                                index]
                                                            .id!,
                                                      );
                                                      allCatagoriesByIdController
                                                          .getAllCatagoryById(
                                                        allCatagoriesController
                                                            .categoriesModel[
                                                                index]
                                                            .id!,
                                                      );
                                                    },
                                                    title: Text(
                                                      allCatagoriesController
                                                          .categoriesModel[
                                                              index]
                                                          .name
                                                          .toString(),
                                                      style: hsmall.copyWith(
                                                        fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width <
                                                                600
                                                            ? 10
                                                            : 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                              child: Container(
                                child: pages[selectedIndex],
                              ),
                            ),
                          )
                        ],
                      ),
          ),
        ));
  }
}
