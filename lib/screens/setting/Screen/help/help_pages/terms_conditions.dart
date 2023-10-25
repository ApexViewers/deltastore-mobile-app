
import 'package:flutter/material.dart';

import '../../../../../constant/paddings.dart';
import '../../../../../constant/spacing.dart';
import '../../../../../constant/styles/app_textstyles.dart';
import '../../../../../constant/styles/colors.dart';


class TermAndConditions extends StatelessWidget {
  const TermAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: cBlack,
            )),
        backgroundColor: colorWhite,
        title: Text(
          "Terms and Conditions",
           style: hMediumX,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: padA5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Returns Policy ",
                      style: hMediumX,
                  ),
                  vSpac10 ,
                  Text(
                      "Items shipped from ” Delta International ” can be returned within 15 days of receipt of shipment in most cases. Some products have different policies or requirements associated with them. ",style: hsmall,),
                  vSpac10,
                  Text(
                    "Returns will be processed only if:   ",
                    style: hMediumX,
                  ),
                  vSpac10,
                  Text("The product is not damaged.",style: hsmall,),
                  vSpac6,
                  Text(
                      "The product is not different from what was shipped to you.",style: hsmall,),
                  vSpac6,
                  Text(
                      "The product is returned in the same condition as when it was received (with the original brand /manufacturer box or packaging, and, if applicable, any user manual, warranty card and    all accessories). ",style: hsmall,),
                  vSpac6,
                  Text("After the courier has received your item, it can take up to one week for us to receive and   process your return. It may take up to two weeks for Marketplace Seller orders. After the   return is processed it may take 5 to 7 business days for the refund to show on your payment   card statement.",style: hsmall,)
                ],
              ),
            ),
            Padding(
              padding: padA5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Valid reasons to return an item ",
                      style: hMediumX,
                  ),
                  vSpac10 ,
                  Text("These items are eligible for return for a full refund within 15 days of delivery. In an unlikely event of damaged, defective or different item delivered you can also opt for a free replacement (if available).",style: hsmall,),
                  vSpac6,
                  Text("Please keep the item in its original condition, with brand outer box, brand/price tags attached, user manual, warranty cards, CDs and original accessories in manufacturer packaging for a successful return pick-up.  ",style: hsmall,),
                  vSpac6,
                  Text("For defects identified outside the 15-day return period, you can also avail the manufacturer warranty as communicated on product details page.",style: hsmall,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
