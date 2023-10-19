
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constant/paddings.dart';
import '../constant/styles/colors.dart';
import '../reuseable_widgets/appbar_widget.dart';
import '../reuseable_widgets/rounded_textfield.dart';
import '../screens/home/components/top_bar_component.dart';
import '../screens/laptops/components/hp_laptop_component/laptop_grid_view_product_component.dart';
import '../screens/laptops/views/hp/hp_laptop.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey.withOpacity(0.1),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: cBlack,)),
        elevation: 0,
        title: const Appbar(),
        backgroundColor: colorWhite,
        actions: [
          Padding(
            padding:padA2.add(EdgeInsets.only(right: 14)),
            child: InkWell(
            onTap: (){
              Get.back();

            },
              child: Icon(
                Icons.search,
                size: 29,
                color: cBlack,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          HpLaptopGridProductComponent(),
        ],
      ),
    );
  }
}
