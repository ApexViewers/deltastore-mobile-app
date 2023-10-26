
import 'package:flutter/material.dart';

import '../../../../constant/paddings.dart';
import '../../../../constant/spacing.dart';
import '../../../../constant/styles/app_textstyles.dart';
import '../../../../constant/styles/colors.dart';

class DeliveryAndShipment extends StatelessWidget {
  const DeliveryAndShipment({Key? key}) : super(key: key);

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
          "Delivery and Shipment Policy",
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
                    "Delivery and shipping",
                      style: hMediumX,
                  ),
                  vSpac10,
                  Text(
                    "We take pride in providing fast and timely delivery of our products. Our process is guided by these terms.",
                    style: hsmall,
                  ),
                  vSpac6,
                  Text(
                    "Processing:",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text(
                    "Once an order is placed with us, your order goes into processing – identification, tagged, assembled and packed and ready for shipment. This may take from 36 to 45 hours.",
                    style: hsmall,
                  ),
                  vSpac6,
                  Text(
                    "Shipping:",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text(
                    "Once your order is handed over to shipping company, the estimated time for shipping is 2-5 business days via our partner shipping company. Once your product is shipped, you will receive a tracking ID so you can track your shipment location. If, due to unforeseen circumstance, your shipment gets late, we will notify you immediately on the number given in the order form. This is why it is important to provide us with your contact information when you place an order with us.",
                    style: hsmall,
                  ),
                  vSpac6,
                  Text(
                    "Shipping with Warranty:",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text(
                    "If you opt for warranty claim, exchange or return of a product, you will be responsible for shipping cost and shipment of returned product to our address. We offer free shipping for products within UAE. We do not offer international shipping.",
                    style: hsmall,
                  ),
                  vSpac6,
                  Text(
                    "Delivery:",
                      style: hMediumX,
                  ),
                  vSpac6,
                  Text("We offer local delivery of all products based on our order schedule and our partner shipping company schedule. If you require same day or express delivery, kindly mention in your order form so we can make arrangements for the same. Otherwise, all deliveries are expected to reach customers within 4-6 business days unless the order is out of stock in which case we’ll inform you accordingly.",style: hsmall,)
               , vSpac6,
                  const Text("All deliveries are done via J&D Express and DHL."),
                  vSpac6,
               
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
