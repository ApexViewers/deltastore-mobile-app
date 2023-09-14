
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/decorations.dart';
import '../../../../constant/paddings.dart';
import '../../../../constant/spacing.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';
import '../../../laptops/views/laptop_products.dart';

class DealsOfDayListViewProductComponent extends StatelessWidget {
  const DealsOfDayListViewProductComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=>LaptopProducts());
      },
      child: Container(

        decoration: productBox.copyWith(borderRadius: BorderRadius.circular(6)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5,top: 10,right: 5),
              child: Container(

                height:20.h,
                width: 60.w,
                decoration: BoxDecoration(
                    color: cGrey,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Padding(
                  padding: padA5,
                  child: Image.network(
                    fit:BoxFit.cover,


                      "https://deltastore.ae/wp-content/uploads/2023/01/Dell-Latitude-5400.png"),
                ),
              ),
            ),
            Padding(
              padding: padA1,
              child: Row(
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
            ),
            Padding(
              padding: padA1,
              child: Text("Dell Latitude 340 |\n Intel Core I5 8th Generation ",
                  style: hsmall.copyWith(color: cBlue)),
            ),

            Padding(
              padding: padA1,
              child: Row(
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 10,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(width: 29.w,),
                  Container(
                    height: 5.h,
                    width: 12.w,
                    decoration: BoxDecoration(
                        color: cGrey,

                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Center(child: Icon(

                      Icons.shopping_cart,color:colorWhite ,)),
                  )
                ],
              ),
            ),
            Padding(
              padding: padA5,
              child: Row(

                children: [
                  Text("AED 700 ", style: hsmall.copyWith(color: cRed)),
                  Text(
                    "AED 1000 ",
                    style: hsmall.copyWith(color: cGrey,decoration: TextDecoration.lineThrough),
                  ),


                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
