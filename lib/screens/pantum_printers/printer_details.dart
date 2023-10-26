
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:test_app/screens/pantum_printers/review_tab_bar.dart';

import '../../constant/fonts_strings.dart';
import '../../constant/paddings.dart';
import '../../constant/styles/app_textstyles.dart';
import '../../constant/styles/colors.dart';
import '../../reuseable_widgets/textformfield_contact.dart';
import 'description__tab_bar.dart';
import 'our_gauarantee_to_you.dart';

class PrinterDetails extends StatefulWidget {
  String? nameFunctionality;
  String? price;
  String? image;

  PrinterDetails({Key? key, this.nameFunctionality, this.price, this.image})
      : super(key: key);

  @override
  State<PrinterDetails> createState() => _PrinterDetailsState();
}

class _PrinterDetailsState extends State<PrinterDetails> with SingleTickerProviderStateMixin {
  TextEditingController priceController = TextEditingController();
  bool addText = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.nameFunctionality.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Printer Details"),
        backgroundColor: appthem,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padA5,
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    SizedBox(
                      height: 12.h,
                      // Set the desired height
                      width: 35.w,
                      child: Image.network(
                        widget.image.toString(),
                      ),
                    ),
                    Padding(
                      padding: padA5,
                      child: Container(
                          decoration: const BoxDecoration(color: appthem),
                          child: Padding(
                            padding: padA5,
                            child: Text(
                              "Condition: Excellent | Grade: Max",
                              style: hsmall.copyWith(color: Colors.white),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 3.h,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                widget.nameFunctionality.toString(),
                style: hMedium.copyWith(fontSize: 15, color: Colors.black),
              ),
              Padding(
                padding: padA5,
                child: Row(
                  children: [
                    Text("Categories:",
                        style: hsmall.copyWith(color: Colors.black)),
                    Text("Printer", style: hsmall.copyWith(color: Colors.blue)),
                  ],
                ),
              ),
              Card(
                color: cGrey.withOpacity(0.2),
                child: Padding(
                  padding: padA5,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Status:",
                              style: hsmall.copyWith(color: Colors.black)),
                          Text("In Stock",
                              style: hsmall.copyWith(color: appthem)),
                        ],
                      ),
                      Divider(
                        height: 4.h,
                      ),
                      const Row(
                        children: [
                          Icon(Icons.favorite_border),
                          Text("Product Add!")
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      const Row(
                        children: [Icon(Icons.refresh), Text("Compare")],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: padA5,
                            child: Text(widget.price.toString(),style: hMedium.copyWith(color: cBlack,fontSize: 16),),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      Padding(
                        padding: padA5,
                        child: RoundTextFormField(
                          obsecure: false,
                          fill: true,
                          fillcolor: colorWhite,
                          controller: priceController,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 87.w,
                          height: 7.h,
                          decoration: BoxDecoration(
                              color: appthem,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: padA5,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  const Center(
                                      child: Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                  )),
                                  Center(
                                      child: Text(
                                    "Add to Cart",
                                    style: hsmall.copyWith(color: Colors.white),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 3.h,
                      ),
                      Container(
                        width: 87.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                            color: appthem,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Padding(
                            padding: padA5,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                ),
                                Center(
                                    child: Text(
                                  "Request for Bulk Qunatity",
                                  style: hsmall.copyWith(color: Colors.white),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: padA5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ExpansionTile(
                        trailing: const Icon(Icons.add),
                        title: const Text("FAQ'S"),
                        children: [
                          normalText(textBold: "90 Days warranty",size: 12,noramlBold: "In case of failure, the product is repaired free of charge. If the repair is not possible, Parts Can be replaced and you have to pay the price for Replaced Parts only. Labor & Servicing absolutely free for 90 days.",),
                          Divider(height: 2.h,),
                          normalText(textBold: "30 days Contractual Warranty",size: 12,noramlBold: "In case of failure, the product is repaired free of charge. If the repair is not possible the product is exchanged, no Question asked.")
                         , Divider(height: 2.h,),
                          normalText(textBold: "15 days to change your mind",size: 12,noramlBold: "You have 15 days after receiving the product to use it. If it does not meet your expectations, we will refund you as soon as possible.")

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
                child: Column(
                  children: <Widget>[
                    TabBar(
                     labelStyle: const TextStyle(fontSize: 12),
                       labelColor: Colors.black,
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Description',),
                        Tab(text: 'Reviews'),
                        Tab(text: 'Our Gauarantee To You'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: const [
                          DescriptionTabBar(),
                          ReviewTabBar(),
                          OurGauarantee()
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget normalText({String? textBold, double? size,String? noramlBold,double? normalSize}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              textBold!,
              style: TextStyle(fontFamily: nexabold, fontSize: size),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Text(
                  noramlBold!,
                  style: TextStyle(fontFamily: nexabold, fontSize: normalSize),
                ),),
          ],
        ),
      ],
    );
  }
}
