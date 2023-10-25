
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/paddings.dart';
import '../../constant/styles/app_textstyles.dart';
import '../../constant/styles/colors.dart';

import 'components/40_sales_product_components/sales_component.dart';

class SalesProduct extends StatefulWidget {
  const SalesProduct({Key? key}) : super(key: key);

  @override
  State<SalesProduct> createState() => _SalesProductState();
}

class _SalesProductState extends State<SalesProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Shop",
          ),
          backgroundColor: appthem),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: padA5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recommended Products",
                        style: hMediumX,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size(100, 30)),
                          // Set custom width and height
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                          // Remove padding
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 14)), // Adjust font size
                          // Add more customizations if needed
                        ),
                        onPressed: () {},
                        child: Text(
                          "View All",
                          style: hMediumX.copyWith(color: appthem),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: padA5,
                          child: SalesListViewProductComponent(),
                        );
                      }),
                ),
                Column(
                  children: [
                    Padding(
                      padding: padA5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shop",
                            style: hMediumX,
                          ),
                          TextButton(
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(const Size(100, 30)),
                              // Set custom width and height
                              padding: MaterialStateProperty.all(EdgeInsets.zero),
                              // Remove padding
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(fontSize: 14)), // Adjust font size
                              // Add more customizations if needed
                            ),
                            onPressed: () {},
                            child: Text(
                              "View All",
                              style: hMediumX.copyWith(color: appthem),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
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
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
