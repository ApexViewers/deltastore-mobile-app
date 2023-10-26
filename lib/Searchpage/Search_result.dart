
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/paddings.dart';
import '../constant/styles/colors.dart';
import '../reuseable_widgets/appbar_widget.dart';
import '../screens/laptops/components/hp_laptop_component/laptop_grid_view_product_component.dart';

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
            padding:padA2.add(const EdgeInsets.only(right: 14)),
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
