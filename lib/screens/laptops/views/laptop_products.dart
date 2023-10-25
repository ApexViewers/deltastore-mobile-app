
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/decorations.dart';
import '../../../constant/paddings.dart';
import '../../../constant/spacing.dart';
import '../../../constant/styles/app_textstyles.dart';
import '../../../constant/styles/colors.dart';
import '../../sales_promotions/components/40_sales_product_components/sales_component.dart';
import '../components/laptop_grid_view_product_component.dart';
import '../controller/laptop_products_controller.dart';

class LaptopProducts extends StatelessWidget {
  const LaptopProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var laptopProductsController = Get.find<LaptopController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laptop"),
        backgroundColor: appthem,
      ),
      body: Column(
        children: [
          Padding(
            padding: padA5,
            child: Row(
              children: [
                Text(
                  "Laptops",
                  style: hMediumX,
                ),
                const Spacer(),
                Obx(() => laptopProductsController.isGridView.value
                    ? Align(
                        child: IconButton(
                            onPressed: () {
                              laptopProductsController.changListType();
                            },
                            icon: const Icon(Icons.list)),
                      )
                    : IconButton(
                        onPressed: () {
                          laptopProductsController.changListType();
                        },
                        icon: const Icon(Icons.dashboard))),
              ],
            ),
          ),
          vSpac12,
          Obx(() => laptopProductsController.isGridView.value
              ? Flexible(
                  child: Container(
                      decoration: productBox,
                      height: 2000,
                      child: GridView.builder(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 2 / 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemCount: 10,
                          itemBuilder: (BuildContext ctx, index) {
                            return
                              LaptopGridProductComponent();
                          })),
                )
              : Expanded(
                child: ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: padA5,
                        child: SalesListViewProductComponent(),
                      );
                    }),
              ),




          ),
        ],
      ),
    );
  }
}
