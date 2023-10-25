
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/decorations.dart';
import '../../../../constant/paddings.dart';
import '../../../../constant/spacing.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';
import '../../../laptops/views/hp/hp_details.dart';

class SalesListViewProductComponent extends StatelessWidget {
  const SalesListViewProductComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>HpLaptopDetailsScreen(
          lessPriceProduct: "AED 700",
          imageProduct:"https://ditllcae.com/wp-content/uploads/2023/03/Dell-Latitude-E6440-300x300.png",nameProduct:"Dell Latitude 340 |\n Intel Core I5 8th Generation" ,priceProduct: "AED 1000",productCategories: "Dell  Laptop ", ));
      },
      child: Container(
        decoration: productBox.copyWith(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: padA5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Dell",
                            style: hsmall,
                          ),
                          hSpac10,
                          Text(
                            "Laptop",
                            style: hsmall,
                          ),
                          hSpac10,
                          Text(
                            "Latitude",
                            style: hsmall,
                          )
                        ],
                      ),
                      Text(
                        "Dell Latitude 340 |\n Intel Core I5 8th Generation ",
                        style: hxMedium.copyWith(fontSize: 14),
                      )
                    ],
                  ),
                  Container(
                    height: 5.h,
                    width: 12.w,
                    decoration: BoxDecoration(
                        color: cGrey, borderRadius: BorderRadius.circular(40)),
                    child: const Center(
                        child: Icon(
                      Icons.shopping_cart,
                      color: colorWhite,
                    )),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
              vSpac10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                        fit: BoxFit.cover,
                        height: 20.h,
                        "https://ditllcae.com/wp-content/uploads/2023/03/Dell-Latitude-E6440-300x300.png"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 16,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Column(
                    children: [
                      Text("AED 3500 ", style: hsmall.copyWith(color: cRed)),
                      Text(
                        "AED 4600 ",
                        style: hsmall.copyWith(
                            color: cGrey, decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
