
import 'package:flutter/material.dart';

import '../../constant/image_assets.dart';
import '../../constant/paddings.dart';
import '../../constant/styles/colors.dart';
import '../../reuseable_widgets/custom_service.dart';

class CustomerService extends StatelessWidget {
  const CustomerService({super.key});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Service"),
        backgroundColor: appthem,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padA5,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: const Border(
                      top: BorderSide(
                        color: appthem,
                        width: 3.0,
                      ),
                      left: BorderSide(
                        color: appthem,
                        width: 12.0,
                      ),
                      right: BorderSide(
                        color: appthem,
                        width: 3.0,
                      ),
                      bottom: BorderSide(
                        color: appthem,
                        width: 3.0,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: const Column(
                  children: [
                    Padding(
                      padding: padA5,
                      child: Icon(Icons.headphones),
                    ),
                    Padding(
                      padding: padA5,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: 'Our phone lines are open from '),

                            TextSpan(
                              text: '9:00am to 6:00pm Saturday to Thursday ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: 'UAE time. You can email us at '),
                            TextSpan(
                                text: 'Info@ditllcae.com',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    ' to our team. You can also track your orders and deliveries, return a product, and manage your account by clicking on the help resources below.'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
               SizedBox(
                height: s.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: s.height * 0.04,
                      ),
                      const Text(
                        "Hello. What can we help you with?",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: s.height * 0.04,
                      ),
                      const Text(
                        "Some things you can do here",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: s.height * 0.04,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: s.height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: cBlack.withOpacity(0.3),
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: const Offset(
                        5.0, // Move to right 5  horizontally
                        5.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                ),
                child: Material(
                  elevation: 2,
                  child: Column(
                    children: [
                      CustomServices(
                        imagePath:ImageAssests.findImage.toString(),
                        customIcon: Icons.search,
                        text1: "Your Orders",
                        text2: "Track packages",
                        text3: "Edit or cancel orders",
                      ),
                      Divider(
                        height: 2,
                        color: cBlack,
                      ),
                      CustomServices(
                        imagePath:ImageAssests.boxImage.toString(),
                        text1: "Returns & Refunds",
                        text2: "Return or exchange items",
                        text3: "Print return mailing labels",
                      ),
                      Divider(
                        height: 2,
                        color: cBlack,

                      ),
                      CustomServices(
                        imagePath:ImageAssests.adminImage.toString(),
                        text1: "Account Settings",
                        text2: "Change email or password Update login",
                        text3: "information",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: s.height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: cBlack.withOpacity(0.3),
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: const Offset(
                        5.0, // Move to right 5  horizontally
                        5.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                ),
                child: Material(
                  elevation: 2,
                  child: CustomServices(
                    width: s.width,
                    imagePath:ImageAssests.envopImage.toString(),
                    text1: "Payment Settings",
                    text2: "Add or edit payment methods",
                    text3: "",
                  ),
                ),
              ),
              SizedBox(
                height: s.height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: cBlack.withOpacity(0.3),
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: const Offset(
                        5.0, // Move to right 5  horizontally
                        5.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                ),
                child: Material(
                  elevation: 2,
                  child: CustomServices(
                    width: s.width,
                    imagePath:ImageAssests.handsetImage.toString(),
                    text1: "Contact Us",
                    text2: "Contact our customer service via phone or chat",
                    text3: "",
                  ),
                ),
              ),
              SizedBox(
                height: s.height * 0.02,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: cBlack.withOpacity(0.3),
                      blurRadius: 5.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: const Offset(
                        5.0, // Move to right 5  horizontally
                        5.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                ),
                child: Material(
                  elevation: 2,
                  child: CustomServices(
                    width: s.width,
                    imagePath:ImageAssests.covidImage.toString(),
                    text1: "Ditllcae and COVID-19",
                    text2: "Impacts on orders and deliveries",
                    text3: "",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
