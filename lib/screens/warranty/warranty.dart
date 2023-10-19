import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constant/fonts_strings.dart';
import '../../constant/image_assets.dart';
import '../../constant/paddings.dart';
import '../../constant/styles/app_textstyles.dart';
import '../../constant/styles/colors.dart';

class Warranty extends StatelessWidget {
  const Warranty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: cBlack,)),
        elevation: 0,
        backgroundColor: colorWhite,
        title: Container(
          width: 60.w,
          child: Image.asset(
            ImageAssests.logoImge.toString(),
            fit: BoxFit.cover,
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padA4,
          child: Column(
            children: [
              SizedBox(height: s.height*0.02,),
              Text("Delta International Mobile phone Electric device Trd LLC Warranty policy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),
              ),
              SizedBox(height: s.height*0.02,),

              textWarranty(
                  text:
                      "The Warranty will be voided if The product is damaged physically. The product is repaired, modified, or disassembled."),
              Padding(
                padding: padA5,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'We provide '),
                      TextSpan(
                        text: '90 days warranties ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'that cover most  of the Parts, only '),
                      TextSpan(
                          text: 'Burn & Physical damage or Brocken',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' will not be included in the warranty.'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: padA5,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'DIT provides a '),
                      TextSpan(
                        text: '90 days warranty ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text:
                              '(Labor & Servicing) for all our computers (laptop & Desktop). '),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: padA5,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text:
                              'In case of failure, the product is repaired free of charge. If the repair is not possible, Parts Can be replaced and you have to pay the price for the Replaced Parts only. Labor & Servicing  will be absolutely free for '),
                      TextSpan(
                        text: '90 days.  ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              textWarranty(
                  text:
                      "DIT also offer extended warranties for an additional fee. This warranty period starts from the date of the DIT-Invoice. After the warranty expiration, we offer free general tech support and phone support, but do not cover parts & Services related to Parts repair or replacement. If any additional service is required will be charged Shipping/handling is the customer’s responsibility. The customer is responsible for the shipping cost outside the UAE."),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textWarrantyBold(text: "Product Returns"),
                ],
              ),
              textWarranty(
                  text:
                      "In case any product needs to be returned to DIT for warranty service, the customer should make sure to present our original invoice with the product serial number and the computer with the same matching SERIAL number mentioned or printed on the device the DIT will not accept any return shipment without the PRODUCT SERIAL number. Shipping/handling is the customer’s responsibility"),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textWarrantyBold(text: "Return For Credit"),
                ],
              ),
              textWarranty(
                  text:
                      "If customer request or demand to return credit for defective or DOA products, the process is initiated only when the product is sold within 15 days from DIT invoice date. DIT will not charge any amount/price as a restocking fee."),
              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textWarrantyBold(text: "Replacement Conditions"),
                ],
              ),
              textWarranty(
                  text:
                      "Replacement of any defective or unsatisfactory product is subject to the available quantity in DIT stock. In case any unavailability of stock occurs, DIT will offer alternate options. DIT will have at least 4 to 5 days to procure and replace the product for the customer.visit contact about"),
              SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }

  Widget textWarranty({
    String? text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom:4 ),
      child: Text(
        text!,
        style: hsmall,
      ),
    );
  }

  Widget textWarrantyBold({
    String? text,
  }) {
    return Text(
      text!,
        style: hMediumX,
    );
  }
}
