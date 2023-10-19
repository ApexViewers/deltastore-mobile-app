
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/decorations.dart';
import '../../../../constant/paddings.dart';
import '../../../../constant/spacing.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';
import '../../../../data/Controllers/all_categories_controller/all_categories_show_controller.dart';
import '../../components/hp_laptop_component/laptop_grid_view_product_component.dart';
import '../../components/hp_laptop_component/laptop_listview_products_component.dart';
import '../../components/laptop_grid_view_product_component.dart';
import '../../components/laptop_listview_products_component.dart';
import '../../controller/hplaptop_product_controller.dart';

class HpLaptops extends StatefulWidget {
  String? name;
   HpLaptops({Key? key,this.name}) : super(key: key);

  @override
  State<HpLaptops> createState() => _HpLaptopsState();
}

class _HpLaptopsState extends State<HpLaptops> {

  @override
  Widget build(BuildContext context) {
    var hplaptopProductsController = Get.put(HpLaptopController());
    return Scaffold(
      appBar: AppBar(title: Text(widget.name.toString()),
      backgroundColor: appthem,
        actions: [
         
          Padding(
            padding: padA5.add(EdgeInsets.only(right: 20)),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [

          vSpac12,
        HpLaptopGridProductComponent(),

        ],
      ),
    );
  }
}
