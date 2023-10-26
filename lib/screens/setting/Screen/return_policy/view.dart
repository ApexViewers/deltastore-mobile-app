
import 'package:flutter/material.dart';

import '../../../../constant/paddings.dart';
import '../../../../constant/spacing.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';

class ReturnPolicy extends StatelessWidget {
  const ReturnPolicy({Key? key}) : super(key: key);

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
          "Refund and Returns Policy",
          style: hsmall.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
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
                    "Returns Policy",
                      style: hMediumX,
                  ),
                  vSpac10,
                  Text(
                    "Items shipped from ” Delta International ” can be returned within 15 days of receipt of shipment in most cases. Some products have different policies or requirements associated with them.",
                    style: hsmall,
                  ),
                  vSpac10,
                  Text(
                    "Returns will be processed only if:",
                      style: hMediumX,
                  ),
                  widgettext("The product is not damaged."),
                  vSpac6,
                  widgettext(
                      "The product is returned in the same condition as when it was received (with the original brand /manufacturer box or packaging, and, if applicable, any user manual, warranty card and all accessories)."),
                  vSpac6,
                  widgettext(
                      "After the courier has received your item, it can take up to one week for us to receive and   process your return. It may take 4 to 7 working days."),
                  vSpac6,
                  widgettext(
                      "After the return is processed it may take 5 to 7 business days for the refund to show on your payment card statement."),
                  vSpac10,
                  Text(
                    "Valid reasons to return an item",
                      style: hMediumX,
                  ),
                  vSpac6,
                  widgettext(
                      "These items are eligible for return for a full refund within 15 days of delivery. In an unlikely event of damaged, defective or different item delivered you can also opt for a free replacement (if available). "),
                  vSpac6,
                  widgettext(
                      "Please keep the item in its original condition, with brand outer box, brand/price tags attached, user manual, warranty cards, and original accessories in manufacturer packaging for a successful return pick-up."),
                  vSpac12,
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: cGrey),
                        borderRadius: BorderRadius.circular(4)),
                    child: ExpansionTile(
                      iconColor: appthem,
                      title: Text(
                        "Laptop",
                        style: hMedium.copyWith(color: appthem, fontSize: 15),
                      ),
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: padA1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Change of Mind is not applicable for return and refund.",
                                    style: hsmall,
                                  ),
                                  vSpac6,
                                  Text.rich(

                                    TextSpan(
                                      children:[
                                        TextSpan(text: "If the item received is damaged, defective, incorrect, or incomplete, a ",style: hsmall),
                                        TextSpan(text: "Replacement ",style: hMedium.copyWith(color: cBlack,fontSize: 12,fontWeight: FontWeight.bold)),
                                        TextSpan(text: "or refund will be issued based on Dit assessment. ",style: hsmall),

                                      ]
                                    ),

                                  ),
                                  vSpac6,
                                  Text.rich(

                                    TextSpan(
                                        children:[
                                          TextSpan(text: "We do not accept returns for more than 30 days used items. For Laptops, you may raise a return or ",style: hsmall),
                                          TextSpan(text: "Replacement ",style: hMedium.copyWith(color: cBlack,fontSize: 12,fontWeight: FontWeight.bold)),
                                          TextSpan(text: "request directly with Dit if the device is dead on arrival (i.e. does not switch on completely). If it has already been activated*, please contact us info@ditllcae.com",style: hsmall),

                                        ]
                                    ),

                                  ),
                                  vSpac12,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  vSpac12,
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: cGrey),
                        borderRadius: BorderRadius.circular(4)),
                    child: ExpansionTile(
                      title: Text(
                        "Desktop",
                        style: hMedium.copyWith(color: appthem, fontSize: 15),
                      ),
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: padA1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Change of Mind is not applicable for return and refund.",
                                    style: hsmall,
                                  ),
                                  vSpac6,
                                  Text.rich(

                                    TextSpan(
                                        children:[
                                          TextSpan(text: "If the item received is damaged, defective, incorrect, or incomplete, a ",style: hsmall),
                                          TextSpan(text: "Replacement ",style: hMedium.copyWith(color: cBlack,fontSize: 12,fontWeight: FontWeight.bold)),
                                          TextSpan(text: "or refund will be issued based on Dit assessment. ",style: hsmall),

                                        ]
                                    ),

                                  ),
                                  vSpac6,
                                  Text.rich(

                                    TextSpan(
                                        children:[
                                          TextSpan(text: "We do not accept returns for more than 30 days used items. For Laptops, you may raise a return or ",style: hsmall),
                                          TextSpan(text: "Replacement ",style: hMedium.copyWith(color: cBlack,fontSize: 12,fontWeight: FontWeight.bold)),
                                          TextSpan(text: "request directly with Dit if the device is dead on arrival (i.e. does not switch on completely). If it has already been activated*, please contact us info@ditllcae.com",style: hsmall),

                                        ]
                                    ),

                                  ),
                                  vSpac12,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget widgettext(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8.0,
          height: 8.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
          ),
          margin: const EdgeInsets.only(top: 6.0, right: 8.0),
        ),
        Expanded(
          child: Text(
            text,
            style: hsmall,
          ),
        ),
      ],
    );
  }
}
